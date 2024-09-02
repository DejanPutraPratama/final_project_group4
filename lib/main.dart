import 'package:final_project_group4/controller/show_screen.dart';
import 'package:final_project_group4/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:final_project_group4/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
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
    ThemeController themeController = Get.put(ThemeController());
    return Obx(() => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Storbage',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            useMaterial3: true,
            fontFamily: GoogleFonts.poppins().fontFamily),
        darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.green,
                brightness: Brightness.dark,
                surface: Colors.grey.shade700),
            useMaterial3: true,
            fontFamily: GoogleFonts.poppins().fontFamily),
        themeMode: themeController.themeMode.value,
        home: const ShowScreen()));
  }
}
