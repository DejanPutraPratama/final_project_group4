import 'package:final_project_group4/controller/history_controller.dart';
import 'package:final_project_group4/model/redeemhistory_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:final_project_group4/page/redeem/redeemsuccess.dart';
import 'package:get/get.dart';

class WaitingRedeem extends StatelessWidget {
  const WaitingRedeem({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () async {
      HistoryController historyController = Get.find<HistoryController>();
      String userId = FirebaseAuth.instance.currentUser!.uid;
      List<RedeemHistoryModel> newList =
          await historyController.getUserRedeemHistory(userId);
      historyController.updateRedeemList(newList);
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RedeemSuccessPage()),
        );
      }
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
