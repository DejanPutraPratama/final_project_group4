import 'package:flutter/material.dart';
import 'package:final_project_group4/page/redeem/redeemsuccess.dart';

class WaitingRedeem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RedeemSuccessPage()),
      );
    });

    return Scaffold(
      appBar: AppBar(
      ),
      backgroundColor: Color(0xFFE6F0DC), // Set background color here
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.access_time,
              size: 100,
              color: Color(0xFF5E3023), // Icon color
            ),
            SizedBox(height: 20),
            Text(
              'Please wait',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFF5E3023), // Text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}