import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_group4/auth/forgot_password.dart';
import 'package:final_project_group4/page/home_page.dart';
import 'package:final_project_group4/page/registration.dart';
import 'package:final_project_group4/widget/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:final_project_group4/auth/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = AuthService();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _showPassword = false;
  String? _emailError;
  String? _passwordError;
  String? _resetEmailError;
  String? _passwordError2;

  Future<void> _login() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          _emailError = 'Email have not been registered';
        });
      } else if (e.code == 'wrong-password') {
        setState(() {
          _passwordError = 'Password is not matched with the record';
        });
      }
    }
  }

  Future<void> _resetpassword([DocumentSnapshot? documentSnapshot]) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
              ),
              child: Container(
                height: 400,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                      bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Forgot your password ?",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Let’s fine your password back",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 50),
                      const Text(
                        "Please provide your email",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _email,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          fillColor: Colors.white,
                          filled: true,
                          errorText: _resetEmailError,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                          label: "Next",
                          onPressed: () {
                            setState(() {
                              if (_email.text.isEmpty) {
                                _resetEmailError =
                                    'Email have not been registered';
                              } else {
                                _resetEmailError = null;
                                _SendOTP();
                              }
                            });
                          }),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  Future<void> _SendOTP([DocumentSnapshot? documentSnapshot]) async {
    String? _OTPerror;

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Container(
                height: 390,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                      bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Verification email is sent",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Please verify that’s you",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 50),
                      const Text(
                        "Please provide the OTP code",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _email,
                        decoration: InputDecoration(
                          labelText: 'OTP Code',
                          fillColor: Colors.white,
                          filled: true,
                          errorText: _OTPerror,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                          label: "Next",
                          onPressed: () {
                            setState(() {
                              if (_email.text.isEmpty) {
                                _OTPerror = 'The OTP does not match';
                              } else {
                                _OTPerror = null;
                                _InputNewPassword();
                              }
                            });
                          }),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  Future<void> _InputNewPassword([DocumentSnapshot? documentSnapshot]) async {
    String? _OTPerror;

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Container(
                height: 448,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                      bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Reset Password",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Make yourself a new password",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 40),
                      TextField(
                        controller: _password,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          fillColor: Colors.white,
                          filled: true,
                          errorText: _passwordError,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.00),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _password,
                        decoration: InputDecoration(
                          labelText: 'Confirm password',
                          fillColor: Colors.white,
                          filled: true,
                          errorText: _passwordError2,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.00),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                          label: "Next",
                          onPressed: () {
                            setState(() {
                              if (_email.text.isEmpty) {
                                _passwordError2 =
                                    'Confirm password is not same with the password';
                              } else {
                                _passwordError2 = null;
                                Navigator.pop(ctx);
                              }
                            });
                          }),
                    ],
                  ),
                ),
              ),
            );
          });
        });
  }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightGreen[50],
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 50),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Hello ',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Storbagers!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Let's sustaining our environment together!",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                TextField(
                  controller: _email,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    // errorText: 'Email have not been registered',
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _password,
                  obscureText: !_showPassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    // errorText: 'Password is not matched with the record',
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: _showPassword,
                      onChanged: (bool? value) {
                        setState(() {
                          _showPassword = value ?? false;
                        });
                      },
                    ),
                    const Text('Show password'),
                  ],
                ),
                const SizedBox(height: 16),
                CustomButton(label: "Login", onPressed: _Login),
                const SizedBox(height: 16),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  InkWell(
                    onTap: () => _resetpassword(),
                    child: const Text("Forgot password",
                        style: TextStyle(color: Colors.lightGreen)),
                  )
                ]),
                const SizedBox(height: 150),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  InkWell(
                      onTap: () => goToSignup(context),
                      child: const Text(
                        "Don't have an account ? Join us",
                        style: TextStyle(color: Colors.lightGreen),
                      ))
                ]),
                const Spacer()
              ],
            )));
  }

  goToSignup(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Registrartion()),
      );

  // forgetPassword(BuildContext context) => Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => const _resetpassword)
  // );

  _Login() async {
    final user =
        await _auth.loginUserWithEmailAndPassword(_email.text, _password.text);

    if (user != null) {
      log("User Logged In");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}
