import 'package:final_project_group4/navbar/navbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:final_project_group4/page/donate/donatesuccess.dart';

class WaitingDonate extends StatelessWidget {
  bool haveNavbar;
  String wasteType;
  int weight;

  WaitingDonate(
      {super.key,
      required this.haveNavbar,
      required this.wasteType,
      required this.weight});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      NavbarController navbarController = NavbarController();
      navbarController.showBottomNav();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => DonateSuccessPage(
                  haveNavbar: haveNavbar,
                  wasteType: wasteType,
                  weight: weight,
                )),
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
