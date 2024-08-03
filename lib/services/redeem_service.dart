import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_group4/controller/points_controller.dart';
import 'package:get/get.dart';

class RedeemService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final PointsController pointsController = Get.find<PointsController>();

  Future<void> redeemPoints({
    required String userId,
    required String phoneNumber,
    required int amount,
    required String paymentMethod,
  }) async {
    // Points collection untuk uodate
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('points')
          .where('userId', isEqualTo: userId)
          .limit(1)
          .get();

      if (querySnapshot.docs.isEmpty) {
        throw Exception('Eror poin ga ketemu');
      }

      DocumentSnapshot snapshot = querySnapshot.docs.first;

      Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

      if (data == null) {
        throw Exception('data null');
      }

      int currentPoints = data['amount'] ?? 0;
      int newPoints = currentPoints - amount;

      await snapshot.reference.update({
        'amount': newPoints,
        'updated_at': FieldValue.serverTimestamp(),
      }).then((value) => pointsController.updatePoints(newPoints));

      // Redeem collection
      await _firestore.collection('redeems').add({
        'userId': userId,
        'phone number': phoneNumber,
        'amount': amount,
        'payment method': paymentMethod,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      log('Error redeeming points: $e');
      throw Exception('Failed to redeem points. Please try again later.');
    }
  }
}
