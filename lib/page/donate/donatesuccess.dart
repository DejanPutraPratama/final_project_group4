import 'package:final_project_group4/navbar/navbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonateSuccessPage extends StatelessWidget {
  final bool haveNavbar;
  const DonateSuccessPage({
    super.key,
    required this.haveNavbar,
  });

  @override
  Widget build(BuildContext context) {
    NavbarController navbarController = Get.find<NavbarController>();
    return Scaffold(
      backgroundColor: const Color(0xFFE6F0DC),
      appBar: null,
      body: GestureDetector(
        onTap: () {
          Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
          navbarController.showBottomNav();
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
