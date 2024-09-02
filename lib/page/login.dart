import 'dart:developer';
import 'package:final_project_group4/controller/history_controller.dart';
import 'package:final_project_group4/controller/loading_controller.dart';
import 'package:final_project_group4/controller/points_controller.dart';
import 'package:final_project_group4/controller/user_controller.dart';
import 'package:final_project_group4/controller/waste_controller.dart';
import 'package:final_project_group4/model/redeemhistory_model.dart';
import 'package:final_project_group4/model/wastehistory_model.dart';
import 'package:final_project_group4/navbar/navbar_controller.dart';
import 'package:final_project_group4/navbar/navbar_navigation.dart';
import 'package:final_project_group4/page/registration.dart';
import 'package:final_project_group4/widget/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:final_project_group4/services/auth_service.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final NavbarController navbarController = Get.find<NavbarController>();
  final UserController userController = Get.find<UserController>();
  final PointsController pointsController = Get.find<PointsController>();
  final WasteController wasteController = Get.find<WasteController>();
  final HistoryController historyController = Get.find<HistoryController>();
  final LoadingController loadingController = LoadingController();
  final _auth = AuthService();
  final _email = TextEditingController();
  final emailController = TextEditingController();
  final _password = TextEditingController();
  bool _showPassword = false;
  String? _resetEmailError;

  Future<void> _resetpassword() async {
    TextEditingController email = TextEditingController();
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return DecoratedBox(
              decoration: const BoxDecoration(
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
                  child: SingleChildScrollView(
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
                          controller: email,
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
                            onPressed: () async {
                              EmailOTP.config(
                                appEmail: "dejanputra12@gmail.com",
                                appName: "Email OTP",
                                emailTheme: EmailTheme.v4,
                                otpLength: 4,
                                otpType: OTPType.numeric,
                              );
                              bool otpSent =
                                  await EmailOTP.sendOTP(email: email.text);
                              if (context.mounted) {
                                if (otpSent) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text("OTP dikirim"),
                                  ));
                                  Navigator.pop(ctx);
                                  _sendOTP();
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Something wrong I can feel it")));
                                }
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }

  Future<void> _sendOTP() async {
    final TextEditingController otp1controller = TextEditingController();
    final TextEditingController otp2controller = TextEditingController();
    final TextEditingController otp3controller = TextEditingController();
    final otp4controller = TextEditingController();
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return DecoratedBox(
              decoration: const BoxDecoration(
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
                  child: SingleChildScrollView(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildOTPfield(context, otp1controller),
                            _buildOTPfield(context, otp2controller),
                            _buildOTPfield(context, otp3controller),
                            _buildOTPfield(context, otp4controller),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const SizedBox(height: 16),
                        CustomButton(
                            label: "Next",
                            onPressed: () async {
                              if (EmailOTP.verifyOTP(
                                      otp: otp1controller.text +
                                          otp2controller.text +
                                          otp3controller.text +
                                          otp4controller.text) ==
                                  true) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("OTP is verified")));
                                  Navigator.pop(ctx);
                                  _inputNewPassword();
                                }
                              } else {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("invalid OTP")));
                                }
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }

  Widget _buildOTPfield(
      BuildContext context, TextEditingController controller) {
    return SizedBox(
      width: 50,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: Theme.of(context).textTheme.headlineMedium,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
        decoration: const InputDecoration(
          hintText: '0',
        ),
      ),
    );
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      if (!mounted) return;
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text("Password reset email sent"),
            );
          });
    }
  }

  Future<void> _inputNewPassword() async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return DecoratedBox(
              decoration: const BoxDecoration(
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
                  child: SingleChildScrollView(
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
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.00),
                              borderSide: const BorderSide(color: Colors.green),
                            ),
                            hintText: 'Input ur email',
                          ),
                        ),
                        const SizedBox(height: 16),
                        CustomButton(
                            label: "Reset Password", onPressed: passwordReset),
                      ],
                    ),
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
    emailController.dispose();
  }

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
                  CustomButton(
                      label: "Login",
                      onPressed: () {
                        _login();
                      }),
                  const SizedBox(height: 16),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    InkWell(
                      onTap: () => _resetpassword(),
                      child: const Text("Forgot password",
                          style: TextStyle(color: Colors.lightGreen)),
                    )
                  ]),
                  const SizedBox(height: 100),
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
              ),
            ),
          ),
        )));
  }

  goToSignup(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Registration()),
      );

  _login() async {
    loadingController.showLoadingDialog();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final user =
        await _auth.loginUserWithEmailAndPassword(_email.text, _password.text);

    if (user != null) {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      prefs.setString('userId', userId);
      log("User Logged In");
      log("User ID: $userId");
      log("Getting user data...");
      var userData = await userController.getDataUser(userId);
      var userPoints = await pointsController.getUserPoints(userId);
      var wastedByUser = await wasteController.getWastedWeight(userId);
      List<WasteHistoryModel> wastedHistoryList =
          await historyController.getUserWasteHistory(userId);
      List<RedeemHistoryModel> redeemHistoryList =
          await historyController.getUserRedeemHistory(userId);

      userController.updateUsername(userData.data()['fullName']);
      userController.updatePhotoUrl(userData.data()['profilePhotoUrl']);
      pointsController.updatePoints(userPoints);
      wasteController.updateWeight(wastedByUser);
      historyController.updateWasteList(wastedHistoryList);
      historyController.updateRedeemList(redeemHistoryList);

      navbarController.showBottomNav();
      if (!mounted) return;
      loadingController.closeLoadingDialog();
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const NavbarNavigation()));
    }
  }
}
