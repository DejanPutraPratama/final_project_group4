import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  RxString userName = ''.obs;
  RxString photoUrl = ''.obs;

  void updateUsername(String name) {
    userName.value = name;
  }

  void updatePhotoUrl(String url) {
    photoUrl.value = url;
  }

  Future addUser(String id, Map<String, dynamic> userDetails) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(userDetails);
  }

  Future updateUser(String id, Map<String, dynamic> updateInfo) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .update(updateInfo);
  }

  Future getDataUser(String id) async {
    return await FirebaseFirestore.instance.collection('users').doc(id).get();
  }

  Future<void> deleteUser(String id) async {
    try {
      var userData =
          await FirebaseFirestore.instance.collection('users').doc(id).get();
      var storageReference = FirebaseStorage.instance
          .refFromURL(userData.data()!['profilePhotoUrl']);
      await storageReference.delete();
      await FirebaseFirestore.instance.collection('users').doc(id).delete();
    } on Exception catch (e) {
      log('Error on User Controller: $e');
    }
  }
}
