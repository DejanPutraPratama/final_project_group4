import 'dart:developer';
import 'package:final_project_group4/page/login.dart';
import 'package:final_project_group4/widget/radioButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_group4/auth/auth_service.dart';
import 'package:final_project_group4/widget/button.dart';
import 'package:final_project_group4/widget/textfield.dart';
import 'package:flutter/widgets.dart';
import 'package:final_project_group4/widget/birthForm.dart';

class Registrartion extends StatefulWidget {
  const Registrartion({super.key});

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registrartion> {
  final _formkey = GlobalKey<FormState>();
  final firebaseUser = FirebaseAuth.instance.currentUser;
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  String? selectedGender;
  // String fullName = '';
  // String birthDate = '';
  // String gender = '';
  // String address = '';
  // String mobileNumber = '';
  // String city = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: Container(
        margin: const EdgeInsets.only(
          top: 30,
          left: 10,
          right: 10,
          bottom: 20,
        ),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 40),
                    Container(
                      width: 30,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                            );
                          },
                          icon: const Icon(Icons.chevron_left,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Let’s fill your data first",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.only(
                      top: 10, left: 14, right: 15, bottom: 7),
                  width: double.infinity,
                  height: 38,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        'Step 1/2',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: 0.5,
                          backgroundColor: Colors.green[100],
                          valueColor:
                              const AlwaysStoppedAnimation<Color>(Colors.green),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 290, top: 20),
                        child: Text(
                          'Full Name',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          controller: _fullNameController,
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      DateOfBirthForm(dateController: dateController),
                      const Padding(
                        padding: EdgeInsets.only(
                          right: 300,
                          top: 10,
                        ),
                        child: Text(
                          'Gender',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      GenderSelectionScreen(
                        onChanged: (String? gender) {
                          setState(() {
                            selectedGender = gender;
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.only(
                          right: 250,
                          top: 10,
                        ),
                        child: Text(
                          'Mobile Number',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          controller: _mobileNumberController,
                          decoration: InputDecoration(
                            labelText: 'Mobile Number',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.only(right: 290, top: 10),
                        child: Text(
                          "Address",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          controller: _addressController,
                          decoration: InputDecoration(
                            labelText: 'Address',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.only(right: 330, top: 10),
                        child: Text(
                          "City",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          controller: _cityController,
                          decoration: InputDecoration(
                            labelText: 'City',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                CustomButton(
                  label: "Next",
                  onPressed: () async {
                    final String userId = firebaseUser!.uid;
                    final String fullName = _fullNameController.text;
                    final String birthDate = dateController.text;
                    final String mobileNumber = _mobileNumberController.text;
                    final String address = _addressController.text;
                    final String city = _cityController.text;
                    String gender = '';
                    if (selectedGender == null) {
                      // Menampilkan pesan error jika gender belum dipilih
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please select a gender')),
                      );
                      return;
                    }

                    if (fullName.isNotEmpty &&
                        birthDate.isNotEmpty &&
                        mobileNumber.isNotEmpty &&
                        address.isNotEmpty &&
                        city.isNotEmpty) {
                      print("User Id: $userId");
                      print("Full Name: $fullName");
                      print("birth Date: $birthDate");
                      print("Mobile Number: $mobileNumber");
                      print("Address: $address");
                      print("City: $city");
                      print("Gender: $selectedGender");
                      await _users.add({
                        'userId': userId,
                        'fullName': fullName,
                        'birth Date': birthDate,
                        'mobileNumber': mobileNumber,
                        'address': address,
                        'city': city,
                        'gender': selectedGender,
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NextRegistration()),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NextRegistration extends StatefulWidget {
  const NextRegistration({super.key});

  @override
  _NextRegistrationState createState() => _NextRegistrationState();
}

class _NextRegistrationState extends State<NextRegistration> {
  final _formkey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;
  final AuthService _auth = AuthService();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  bool agreeToTerms = false;

  // Future<void> registerUser() async {
  //   if(_formkey.currentState!.validate()) {
  //     try {
  //       User? user = await _auth.createUserWithEmailAndPassword(email, password);

  //       if (user != null) {
  //         await _firestore.collection('users').doc(user.uid).set({
  //           'fullName': widget.fullName,
  //           'birthDate': widget.birthDate,
  //           'gender': widget.gender,
  //           'mobileNumber': widget.mobileNumber,
  //           'address': widget.addres,
  //           'city': widget.city,
  //           'email': email,
  //         });

  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(builder: (context) => ConfirmationPage ()),
  //         );
  //       } else {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text('User creation failed')),
  //         );
  //       }
  //     } catch (e) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('An error occured: $e ')),
  //       );
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: Container(
        margin: const EdgeInsets.only(
          top: 30,
          left: 10,
          right: 10,
          bottom: 20,
        ),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: <Widget>[
                    const SizedBox(height: 40),
                    Container(
                      width: 30,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Registrartion()),
                            );
                          },
                          icon: const Icon(Icons.chevron_left,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Make an account",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.only(
                      top: 10, left: 14, right: 15, bottom: 7),
                  width: double.infinity,
                  height: 38,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        'Step 2/2',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: 1,
                          backgroundColor: Colors.green[100],
                          valueColor:
                              const AlwaysStoppedAnimation<Color>(Colors.green),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          right: 320,
                          top: 20,
                        ),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: CustomTextField(
                          hint: "Enter ur email",
                          label: "Email",
                          controller: _email,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.only(
                          right: 290,
                          top: 10,
                        ),
                        child: Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: CustomTextField(
                          hint: "Enter ur password",
                          label: "Password",
                          isPassword: true,
                          controller: _password,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, right: 220),
                        child: Text(
                          'Confirm Password',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: CustomTextField(
                          hint: "Confirm ur password",
                          label: "Confirm Password",
                          isPassword: true,
                          controller: _password,
                        ),
                      ),
                      const SizedBox(height: 20),
                      CheckboxListTile(
                        title: const Text(
                          "By ticking, you are confirming that you have read, understood and agree with our terms and conditions",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        value: agreeToTerms,
                        onChanged: (newValue) {
                          setState(() {
                            agreeToTerms = newValue!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        subtitle: !agreeToTerms
                            ? const Text(
                                'Please tick it before you register',
                                style: TextStyle(color: Colors.red),
                              )
                            : null,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                CustomButton(
                  label: "Register",
                  onPressed: _signup,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _signup() async {
    final User = await _auth.createUserWithEmailAndPassword(
      _email.text,
      _password.text,
    );
    if (User != null) {
      print(User.uid);
      log("User created Succesfully");
    }
  }
}

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Successful'),
      ),
      body: const Center(
        child: Text('Thank you for registering!'),
      ),
    );
  }

  goToLogin(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
}
