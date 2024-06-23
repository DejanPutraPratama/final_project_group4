import 'package:cloud_firestore/cloud_firestore.dart';

class DonateDatabase {
  Future addDonate(Map<String, dynamic> donatedetails, String id) async {
    return await FirebaseFirestore.instance
      .collection('donate')
      .doc(id)
      .set(donatedetails);
  }
}