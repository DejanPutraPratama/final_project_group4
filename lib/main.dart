import 'package:flutter/material.dart';
import 'package:final_project_group4/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:final_project_group4/page/splashScreen.dart';
import 'package:final_project_group4/seeder/ewallet_seeder.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // seedEWalletData(); //untuk seeding ewallet doang
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Storbage',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

