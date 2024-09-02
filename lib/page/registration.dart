import 'dart:developer';
import 'package:final_project_group4/controller/loading_controller.dart';
import 'package:final_project_group4/controller/points_controller.dart';
import 'package:final_project_group4/controller/user_controller.dart';
import 'package:final_project_group4/model/user_model.dart';
import 'package:final_project_group4/page/login.dart';
import 'package:final_project_group4/widget/custom_radiobutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_group4/services/auth_service.dart';
import 'package:final_project_group4/widget/button.dart';
import 'package:final_project_group4/widget/textfield.dart';
import 'package:final_project_group4/widget/birthform.dart';
import 'package:intl/intl.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formkey = GlobalKey<FormState>();
  final userInfo = FirebaseAuth.instance.currentUser;
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  String? selectedGender;
  String? selectedCity;

  final List<String> cities = [
    'Jakarta Utara',
    'Jakarta Selatan',
    'Jakarta Barat',
    'Jakarta Timur',
    'Jakarta Pusat'
  ];

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
                      CustomRadioButton(
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
                        child: DropdownButtonFormField<String>(
                          value: selectedCity,
                          hint: const Text('Select City'),
                          items: cities.map((String city) {
                            return DropdownMenuItem<String>(
                                value: city, child: Text(city));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCity = newValue;
                            });
                          },
                          decoration: InputDecoration(
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
                    final String fullName = _fullNameController.text;
                    final String birthDate = dateController.text;
                    final String mobileNumber = _mobileNumberController.text;
                    final String address = _addressController.text;
                    final String city = selectedCity ?? '';
                    if (selectedGender == null) {
                      // Menampilkan pesan error jika gender belum dipilih
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please select a gender')),
                      );
                      return;
                    }

                    if (fullName.isNotEmpty &&
                        birthDate.isNotEmpty &&
                        mobileNumber.isNotEmpty &&
                        address.isNotEmpty &&
                        city.isNotEmpty) {
                      Timestamp birthDateTimestamp = Timestamp.fromDate(
                          DateFormat('yyyy-MM-dd').parse(birthDate));

                      log("Full Name: $fullName");
                      log("birth Date: $birthDateTimestamp");
                      log("Mobile Number: $mobileNumber");
                      log("Address: $address");
                      log("City: $city");
                      log("Gender: $selectedGender");
                      // await _users.add({
                      //   'fullName': fullName,
                      //   'birth Date': birthDateTimestamp,
                      //   'mobileNumber': mobileNumber,
                      //   'address': address,
                      //   'city': city,
                      //   'gender': selectedGender,
                      // });
                      UserModel regisInfo = UserModel(
                          userId: '0',
                          fullName: fullName,
                          birthDate: birthDate,
                          mobileNumber: mobileNumber,
                          address: address,
                          city: city,
                          gender: selectedGender!);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NextRegistration(
                                  regisInfo: regisInfo,
                                )),
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
  final UserModel regisInfo;
  const NextRegistration({super.key, required this.regisInfo});

  @override
  State<NextRegistration> createState() => _NextRegistrationState();
}

class _NextRegistrationState extends State<NextRegistration> {
  LoadingController loadingController = LoadingController();
  UserController userController = UserController();
  PointsController pointsController = PointsController();
  final AuthService _auth = AuthService();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  bool agreeToTerms = false;

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
                                  builder: (context) => const Registration()),
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
                          controller: _password,
                          hint: "Enter ur password",
                          label: "Password",
                          isPassword: true,
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
                          controller: _confirmPassword,
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
                  onPressed: () async {
                    if (_password.text == _confirmPassword.text) {
                      await _signup(widget.regisInfo);
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

  _signup(UserModel regisInfo) async {
    loadingController.showLoadingDialog();
    final user = await _auth.createUserWithEmailAndPassword(
      _email.text,
      _password.text,
    );
    if (user != null) {
      final userInfo = FirebaseAuth.instance.currentUser;
      Map<String, dynamic> newUserData = {
        'id': userInfo!.uid,
        'profilePhotoUrl': '',
        'fullName': regisInfo.fullName,
        'birthdate': regisInfo.birthDate,
        'mobileNumber': regisInfo.mobileNumber,
        'address': regisInfo.address,
        'city': regisInfo.city,
        'gender': regisInfo.gender,
      };
      Map<String, dynamic> initialPoints = {
        'userId': userInfo.uid,
        'amount': 0,
      };
      await userController.addUser(userInfo.uid, newUserData);
      await pointsController.setInitialPoint(userInfo.uid, initialPoints);
      log("User created Succesfully");
      loadingController.closeLoadingDialog();
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }
}
