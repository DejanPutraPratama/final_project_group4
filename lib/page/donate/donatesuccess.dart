import 'package:final_project_group4/services/UserPointService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DonateSuccessPage extends StatelessWidget {
  bool haveNavbar;
  String wasteType;
  int weight;
  DonateSuccessPage(
      {super.key,
      required this.haveNavbar,
      required this.wasteType,
      required this.weight});

  @override
  Widget build(BuildContext context) {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    UserPointsService _userPointsService = UserPointsService();
    int points = 10000;
    return Scaffold(
      backgroundColor: const Color(0xFFE6F0DC),
      appBar: null,
      body: GestureDetector(
        onTap: () async {
          int currentPoints = await _userPointsService.getUserPoints(userId);
          int gettingPoints = getPoints(wasteType, weight);
          Map<String, dynamic> updatePoints = {
            'amount': currentPoints += gettingPoints
          };
          await _userPointsService.addUserPoints(userId, updatePoints);
          Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
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
