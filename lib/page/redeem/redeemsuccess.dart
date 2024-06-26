import 'package:final_project_group4/navbar/navbar_controller.dart';
import 'package:final_project_group4/page/redeem/redeem.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RedeemSuccessPage extends StatelessWidget {
  const RedeemSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userInfo = FirebaseAuth.instance.currentUser;
    final NavbarController navbarController = Get.find<NavbarController>();
    return Scaffold(
      backgroundColor: const Color(0xFFE6F0DC),
      appBar: null,
      body: GestureDetector(
        onTap: () {
          navbarController.showBottomNav();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => RedeemPage(
                      userId: userInfo!.uid,
                    )),
            ((Route<dynamic> route) => route.isFirst),
          );
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
                  color: Color(0xFF5E3023), // Text color
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Please wait a maximum of 5 working days for the amount to arrive in your e-wallet account.',
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
