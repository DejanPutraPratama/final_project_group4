import 'package:cloud_firestore/cloud_firestore.dart';

class UserPointsService {
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
      print("Error fetching user points: $e");
      return 0;
    }
  }
}
