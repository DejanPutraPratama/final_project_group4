import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PointsController {
  var userPoints = 0.obs;

  void updatePoints(int newPoints) {
    userPoints.value = newPoints;
    userPoints.refresh();
  }

  Future setInitialPoint(String id, Map<String, dynamic> userDetails) async {
    return await FirebaseFirestore.instance
        .collection('points')
        .doc(id)
        .set(userDetails);
  }

  Future<int> getUserPoints(String userId) async {
    try {
      var snapshot = await FirebaseFirestore.instance
          .collection('points')
          .where('userId', isEqualTo: userId)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        return snapshot.docs.first.data()['amount'] ?? 0;
      } else {
        return 0;
      }
    } catch (e) {
      log("Error fetching user points: $e");
      return 0;
    }
  }

  Future addUserPoints(String userId, Map<String, dynamic> addedPoints) async {
    return await FirebaseFirestore.instance
        .collection('points')
        .doc(userId)
        .update(addedPoints);
  }

  Future<void> deleteUserPoints(String userId) async {
    return await FirebaseFirestore.instance
        .collection('points')
        .doc(userId)
        .delete();
  }
}
