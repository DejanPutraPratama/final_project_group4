import 'package:cloud_firestore/cloud_firestore.dart';

class RedeemService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> redeemPoints({
    required String userId,
    required String phoneNumber,
    required int amount,
  }) async {
    await _firestore.collection('redeems').add({
      'userId': userId,
      'phone number': phoneNumber,
      'amount': amount,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}