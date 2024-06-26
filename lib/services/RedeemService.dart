import 'package:cloud_firestore/cloud_firestore.dart';

class RedeemService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
      });

      // Redeem collection
      await _firestore.collection('redeems').add({
        'userId': userId,
        'phone number': phoneNumber,
        'amount': amount,
        'payment method': paymentMethod,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error redeeming points: $e');
      throw Exception('Failed to redeem points. Please try again later.');
    }
  }
}
