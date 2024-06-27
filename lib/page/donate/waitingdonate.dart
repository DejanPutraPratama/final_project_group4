import 'package:flutter/material.dart';
import 'package:final_project_group4/page/donate/donatesuccess.dart';

class WaitingRedeem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DonateSuccessPage()),
      );
    });

    return const Scaffold(
      appBar: null,
      backgroundColor: Color(0xFFE6F0DC),
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
                fontSize: 20,
                color: Color(0xFF5E3023), // Text color
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Your donation data is being submitted',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF5E3023),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
