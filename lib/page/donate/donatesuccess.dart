import 'package:final_project_group4/navbar/navbar_navigation.dart';
import 'package:flutter/material.dart';
import 'package:final_project_group4/page/history.dart';

class DonateSuccessPage extends StatelessWidget {
  bool haveNavbar;
  DonateSuccessPage({super.key, required this.haveNavbar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6F0DC),
      appBar: null,
      body: GestureDetector(
        onTap: () {
          if (haveNavbar == true) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HistoryScreen()),
                (Route<dynamic> route) => route.isFirst);
          } else {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => const NavbarNavigation()),
                (Route<dynamic> route) => route.isFirst);
          }
        },
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check_circle,
                size: 100,
                color: Color(0xFF55883B),
              ),
              SizedBox(height: 20),
              Text(
                'Process completed',
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xFF5E3023),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Please wait a maximum of 5 working days for the data to be verified.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
