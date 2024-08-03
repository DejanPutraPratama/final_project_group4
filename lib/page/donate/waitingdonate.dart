import 'package:final_project_group4/controller/history_controller.dart';
import 'package:final_project_group4/controller/points_controller.dart';
import 'package:final_project_group4/controller/waste_controller.dart';
import 'package:final_project_group4/model/wastehistory_model.dart';
import 'package:final_project_group4/navbar/navbar_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:final_project_group4/page/donate/donatesuccess.dart';
import 'package:get/get.dart';

class WaitingDonate extends StatelessWidget {
  final bool haveNavbar;
  final String wasteType;
  final int weight;

  const WaitingDonate(
      {super.key,
      required this.haveNavbar,
      required this.wasteType,
      required this.weight});

  @override
  Widget build(BuildContext context) {
    PointsController pointsController = Get.find<PointsController>();
    WasteController wasteController = Get.find<WasteController>();
    HistoryController historyController = Get.find<HistoryController>();
    String userId = FirebaseAuth.instance.currentUser!.uid;
    Future.delayed(const Duration(seconds: 5), () async {
      NavbarController navbarController = NavbarController();
      navbarController.showBottomNav();
      int currentPoints = await pointsController.getUserPoints(userId);
      int gettingPoints = getPoints(wasteType, weight);
      Map<String, dynamic> updatePoints = {
        'amount': currentPoints += gettingPoints
      };
      double updateWeight = wasteController.wasteWeight.value + weight;
      List<WasteHistoryModel> newList =
          await historyController.getUserWasteHistory(userId);
      await pointsController.addUserPoints(userId, updatePoints).then((_) {
        pointsController.updatePoints(currentPoints);
        wasteController.updateWeight(updateWeight);
        historyController.updateWasteList(newList);
      });
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => DonateSuccessPage(
                    haveNavbar: haveNavbar,
                  )),
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

int getPoints(String wasteType, int weight) {
  int addPoints = 0;
  if (wasteType == 'Plastic') {
    addPoints = 1000 * weight;
  } else if (wasteType == 'Anorganic') {
    addPoints = 500 * weight;
  } else if (wasteType == 'Metal') {
    addPoints = 2000 * weight;
  } else {
    addPoints = 200 * weight;
  }
  return addPoints;
}
