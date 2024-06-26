import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  Future addDonate(Map<String, dynamic> donatedetails, String id) async {
    return await FirebaseFirestore.instance
        .collection('donate')
        .doc(id)
        .set(donatedetails);
  }

  Future addUser(String id, Map<String, dynamic> userDetails) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(userDetails);
  }

  Future getDataUser(String id) async {
    return await FirebaseFirestore.instance.collection('users').doc(id).get();
  }
}
