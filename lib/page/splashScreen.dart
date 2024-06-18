import 'package:final_project_group4/page/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen ({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(builder: (context) => SecondScreen()),
        );
      },
      child: Scaffold(
        backgroundColor: Color(0xFFEAF0DF),
        body: Stack(
          children: [
            Positioned(
              top: 40,
              right: 20,
              child: Column(
                children: [
                  Text(
                    'Welcome to',
                    style: TextStyle(
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  Text(
                    'Storbage',
                    style: TextStyle(
                      fontSize: 47,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 200,
              left: 5,
              child: Image.asset(
                'assets/Plastik_sampah.png', 
                fit: BoxFit.contain,
                width: 200, 
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.circle, color: Colors.black),
                  SizedBox(width:20),
                  Icon(Icons.circle, color: Colors.grey),
                  SizedBox(width: 20),
                  Icon(Icons.circle, color: Colors.grey),
                  SizedBox(width: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget{
    @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ThirdScreen()),
        );
      },
      child: Scaffold(
        backgroundColor: Color(0xFFEAF0DF),
        body: Stack(
          children: [
            Positioned(
              top: 40,
              right: 20,
              child: Column(
                children: [
                  Text(
                    'Nice to meet',
                    style: TextStyle(
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  Text(
                    'You',
                    style: TextStyle(
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 200,
              left: 5,
              child: Image.asset(
                'assets/Plastik_sampah.png', 
                fit: BoxFit.contain,
                width: 200, 
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.circle, color: Colors.grey),
                  SizedBox(width: 20),
                  Icon(Icons.circle, color: Colors.black),
                  SizedBox(width: 20),
                  Icon(Icons.circle, color: Colors.grey),
                  SizedBox(width: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget{
    @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
      child: Scaffold(
        backgroundColor: Color(0xFFEAF0DF),
        body: Stack(
          children: [
            Positioned(
              top: 40,
              right: 70,
              child: Column(
                children: [
                  Text(
                    'Want to donate',
                    style: TextStyle(
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  Text(
                    'trash with reward ?',
                    style: TextStyle(
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    ' Here the right',
                    style: TextStyle(
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  Text(
                    'place for you',
                    style: TextStyle(
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 200,
              left: 5,
              child: Image.asset(
                'assets/Plastik_sampah.png', 
                fit: BoxFit.contain,
                width: 200, 
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.circle, color: Colors.grey),
                  SizedBox(width: 20),
                  Icon(Icons.circle, color: Colors.grey),
                  SizedBox(width: 20),
                  Icon(Icons.circle, color: Colors.black),
                  SizedBox(width: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SplashScreenState extends State<SplashScreen>
  with SingleTickerProviderStateMixin {
    @override
    void initState() {
      super.initState();
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => FirstScreen())
          );
        }
      );
    }

    @override
    void dispose() {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: SystemUiOverlay.values);
    }

    @override
    Widget build(BuildContext context) {
          return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/plastik_sampah.png',
              width: 150, // Sesuaikan ukuran sesuai kebutuhan
              height: 150, // Sesuaikan ukuran sesuai kebutuhan
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFEAF0DF), // Warna latar belakang sesuai dengan gambar
    );
    }
  }