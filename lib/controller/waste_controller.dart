import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class WasteController extends GetxController {
  var wasteWeight = 0.0.obs;

  void updateWeight(double weight) {
    wasteWeight.value = weight;
  }

  Future<double> getWastedWeight(String userId) async {
    double weight = 0;
    try {
      var snapshot = await FirebaseFirestore.instance
          .collection('donate')
          .where('userId', isEqualTo: userId)
          .get();

      if (snapshot.docs.isNotEmpty) {
        for (var i = 0; i < snapshot.docs.length; i++) {
          weight += snapshot.docs[i].data()['Weight'];
        }
        return weight;
      } else {
        return weight;
      }
    } catch (e) {
      log("Error fetching user Wasted Weight: $e");
      return 0;
    }
  }

  Future<void> deleteAllData(String id) async {
    try {
      DocumentReference documentReference;
      Reference storageReference;
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('donate')
          .where('userId', isEqualTo: id)
          .get();

      if (snapshot.docs.isNotEmpty) {
        for (var i = 0; i < snapshot.docs.length; i++) {
          documentReference = snapshot.docs[i].reference;
          storageReference =
              FirebaseStorage.instance.refFromURL(snapshot.docs[i]['photoUrl']);
          log(storageReference.toString());
          await storageReference.delete();
          await documentReference.delete();
        }
      }
    } on Exception catch (e) {
      log('Error on Waste Controller: $e');
    }
  }
}
