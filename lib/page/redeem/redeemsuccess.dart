import 'package:flutter/material.dart';
import 'package:final_project_group4/page/homepage.dart';

class RedeemSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6F0DC),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        child: Center(
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
                  color: Color(0xFF5E3023), // Text color
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Please wait a maximum of 5 working days for the amount to arrive in your e-wallet account.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
