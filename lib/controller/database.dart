import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  Future addDonate(Map<String, dynamic> donatedetails, String id) async {
    return await FirebaseFirestore.instance
        .collection('donate')
        .doc(id)
        .set(donatedetails);
  }

  Future getUserDetails(String id) async {
    return await FirebaseFirestore.instance.collection('users').doc(id).get();
  }
}
