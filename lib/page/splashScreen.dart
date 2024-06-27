import 'package:final_project_group4/navbar/navbar_navigation.dart';
import 'package:final_project_group4/page/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

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
          PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  SecondScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.easeInOut;

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                return SlideTransition(
                    position: animation.drive(tween), child: child);
              }),
        );
      },
      child: Scaffold(
        backgroundColor: Color(0xFFEAF0DF),
        body: Stack(
          children: [
            const Positioned(
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
              bottom: 160,
              child: Image.asset(
                'assets/Plastik_sampah.png',
                fit: BoxFit.contain,
                width: 200,
              ),
            ),
            const Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.circle, color: Colors.black, size: 10.0),
                  SizedBox(width: 10),
                  Icon(Icons.circle, color: Colors.grey, size: 10.0),
                  SizedBox(width: 10),
                  Icon(Icons.circle, color: Colors.grey, size: 10.0),
                  SizedBox(width: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  ThirdScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.easeInOut;

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                return SlideTransition(
                    position: animation.drive(tween), child: child);
              }),
        );
      },
      child: Scaffold(
        backgroundColor: Color(0xFFEAF0DF),
        body: Stack(
          children: [
            const Positioned(
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
              bottom: 160,
              child: Image.asset(
                'assets/Plastik_sampah.png',
                fit: BoxFit.contain,
                width: 200,
              ),
            ),
            const Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.circle, color: Colors.grey, size: 10.0),
                  SizedBox(width: 10),
                  Icon(Icons.circle, color: Colors.black, size: 10.0),
                  SizedBox(width: 10),
                  Icon(Icons.circle, color: Colors.grey, size: 10.0),
                  SizedBox(width: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  LoginScreen(hasLogOut: false),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.easeInOut;

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                return SlideTransition(
                    position: animation.drive(tween), child: child);
              }),
        );
      },
      child: Scaffold(
        backgroundColor: Color(0xFFEAF0DF),
        body: Stack(
          children: [
            const Positioned(
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
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 0,
                    ),
                    child: Text(
                      ' Here the right',
                      style: TextStyle(
                        fontSize: 37,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
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
              bottom: 160,
              child: Image.asset(
                'assets/Plastik_sampah.png',
                fit: BoxFit.contain,
                width: 200,
              ),
            ),
            const Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.circle, color: Colors.grey, size: 10.0),
                  SizedBox(width: 10),
                  Icon(Icons.circle, color: Colors.grey, size: 10.0),
                  SizedBox(width: 10),
                  Icon(Icons.circle, color: Colors.black, size: 10.0),
                  SizedBox(width: 10),
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
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => FirstScreen()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/storbage_logo.png',
              width: 150, // Sesuaikan ukuran sesuai kebutuhan
              height: 150, // Sesuaikan ukuran sesuai kebutuhan
            ),
          ],
        ),
      ),
      backgroundColor:
          Color(0xFFEAF0DF), // Warna latar belakang sesuai dengan gambar
    );
  }
}
