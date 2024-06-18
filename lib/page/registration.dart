import 'dart:developer';

import 'package:final_project_group4/page/login.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_group4/auth/auth_service.dart';
import 'package:final_project_group4/widget/button.dart';
import 'package:final_project_group4/widget/textfield.dart';

class Registrartion extends StatefulWidget {
  const Registrartion({super.key});

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registrartion> {
  final _formkey = GlobalKey<FormState>();
  final CollectionReference _users = FirebaseFirestore.instance.collection('users');
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  // String fullName = '';
  // String birthDate = '';
  // String gender = '';
  // String address = '';
  // String mobileNumber = '';
  // String city = '';

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          }, 
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text(
          "Let's fill your data first",
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.lightGreen[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // child: Row(
        //   children: [
        //     Container(
        //       width: 335,
        //       height: 38,
        //       color: Colors.white,
        //       child: Center(
        //         child: Text(
        //           'Step 1/2',
        //           style: TextStyle(
        //             fontSize: 16,
        //             fontWeight: FontWeight.bold,
        //             color: Colors.black,
        //           ),
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Step 1/2',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 38),
              LinearProgressIndicator(
                value: 0.5,
                backgroundColor: Colors.green[100],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
              ),
              TextField(
                controller: _fullNameController,
                decoration: const InputDecoration(labelText: 'Full Name'),
              ),
              TextField(
                controller: _mobileNumberController,
                decoration: const InputDecoration(labelText: 'Mobile Number'),
              ),
              TextField(
                controller:_addressController,
                decoration: const InputDecoration(labelText: 'Address'),
              ),
              TextField(
                controller: _cityController,
                decoration: const InputDecoration(labelText: 'City'),
              ),
              const SizedBox(height: 54),
              CustomButton(
                label: "Next",
                onPressed: () async {
                  final String fullName = _fullNameController.text;
                  final String mobileNumber = _mobileNumberController.text;
                  final String address = _addressController.text;
                  final String city = _cityController.text;
                  
                  if (fullName.isNotEmpty && 
                  mobileNumber.isNotEmpty &&
                  address.isNotEmpty && 
                  city.isNotEmpty) {
                    await _users.add({
                    'fullName': fullName,
                    'mobileNumber': mobileNumber,
                    'address': address,
                    'city': city,
                    });

                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const NextRegistration()),
                    );
                  }
                },
              ),
            ],
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
      appBar: AppBar(
        title: const Text(
          "Make an account",
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.lightGreen[50],
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              const Text(
                'Step 2/2',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 38),
              LinearProgressIndicator(
                value: 1,
                backgroundColor: Colors.green[100],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
              ),
              CustomTextField(
                hint: "Enter ur email", 
                label: "Email",
                controller: _email
              ),
              CustomTextField(
                hint: "Enter ur password", 
                label: "Password",
                isPassword: true,
                controller: _password,
              ),
              CustomTextField(
                hint: "Confirm ur password", 
                label: "Confirm Passwor",
                isPassword: true,
                controller: _password,
              ),
              CheckboxListTile(
                title: const Text('I agree to the terms and conitions'),
                value: agreeToTerms,
                onChanged: (newValue) {
                  setState(() {
                    agreeToTerms = newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                subtitle: !agreeToTerms
                ? const Text(
                  'Please agree to terms and conditions',
                  style: TextStyle(color: Colors.red),
                )
                : null,
              ),
              const SizedBox(height: 54),
              CustomButton(
                label: "Register",
                onPressed: _signup,
              ),
            ],
          ),
        ),
      ),
    );
  }
  _signup() async {
    final User = await _auth.createUserWithEmailAndPassword(_email.text, _password.text,);
    if (User != null) {
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

