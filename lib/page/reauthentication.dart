import 'dart:developer';
import 'dart:io';
import 'package:final_project_group4/controller/loading_controller.dart';
import 'package:final_project_group4/services/auth_service.dart';
import 'package:final_project_group4/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Reauthentication extends StatefulWidget {
  final String userId;
  const Reauthentication({super.key, required this.userId});

  @override
  State<Reauthentication> createState() => _ReauthenticationState();
}

class _ReauthenticationState extends State<Reauthentication> {
  LoadingController loadingController = LoadingController();
  AuthService authService = AuthService();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passTextController = TextEditingController();
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightGreen[50],
        body: SingleChildScrollView(
            child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(16),
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
                    "Make sure it was you",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),
                  TextField(
                    controller: emailTextController,
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
                    controller: passTextController,
                    obscureText: !showPassword,
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
                        value: showPassword,
                        onChanged: (bool? value) {
                          setState(() {
                            showPassword = value!;
                          });
                        },
                      ),
                      const Text('Show password'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                      label: "Reautenticate",
                      onPressed: () async {
                        loadingController.showLoadingDialog();
                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        preferences.remove('userId');
                        var result = await authService.deleteUserAccount(
                            widget.userId,
                            emailTextController.text,
                            passTextController.text);
                        if (result == true) {
                          log('Akun berhasil dihapus');
                          exit(0);
                        } else {
                          loadingController.closeLoadingDialog();
                          loadingController.showAlertDialog('Proses Gagal',
                              'Pastikan data yang dimasukkan benar');
                        }
                      }),
                  const SizedBox(height: 16),
                  const Spacer()
                ],
              ),
            ),
          ),
        )));
  }
}
