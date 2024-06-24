import 'package:final_project_group4/page/login.dart';
import 'package:flutter/material.dart';
import 'package:final_project_group4/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:final_project_group4/page/splashScreen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:final_project_group4/page/Donatepage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_project_group4/page/registration.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Storbage',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: GoogleFonts.poppins().fontFamily),
      home: const LoginScreen(),
    );
  }
}
