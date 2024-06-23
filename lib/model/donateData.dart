import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonateModel {
  final String? id;
  final String destinationLandfill;
  final String wasteType;
  final int weight;

  const DonateModel({
    this.id,
    required this.destinationLandfill,
    required this.wasteType,
    required this.weight,
  });

  toJson(){
    return{
      "destinationLandfill": destinationLandfill,
      "wasteType": wasteType,
      "weight": weight,
    };
  }
}

class DonateDatabase extends GetxController {
  static DonateDatabase get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createData(DonateModel donate) async{
    await _db.collection("donate").add(donate.toJson()).whenComplete(
      () => Get.snackbar("Succes", "Your data has been created.",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.1),
      colorText: Colors.green),
    )
    .catchError((error, StackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent.withOpacity(0.1),
      colorText: Colors.red);
    print(error.toString());
    });
  }
}