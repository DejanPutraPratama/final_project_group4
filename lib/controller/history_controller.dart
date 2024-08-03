import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_group4/model/redeemhistory_model.dart';
import 'package:final_project_group4/model/wastehistory_model.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class HistoryController {
  RxList<WasteHistoryModel> wasteHistoryList = <WasteHistoryModel>[].obs;
  RxList<RedeemHistoryModel> redeemHistoryList = <RedeemHistoryModel>[].obs;

  void updateWasteList(List<WasteHistoryModel> newList) {
    wasteHistoryList.value = newList;
  }

  void updateRedeemList(List<RedeemHistoryModel> newList) {
    redeemHistoryList.value = newList;
  }

  Future? getUserWasteHistory(String userId) async {
    List<WasteHistoryModel> historyList = [];
    try {
      var snapshot = await FirebaseFirestore.instance
          .collection('donate')
          .where('userId', isEqualTo: userId)
          .get();

      if (snapshot.docs.isNotEmpty) {
        for (var i = 0; i < snapshot.docs.length; i++) {
          historyList.add(WasteHistoryModel(
              wasteType: snapshot.docs[i].data()['WasteType'],
              wasteWeight: snapshot.docs[i].data()['Weight'],
              destinationLandfill:
                  snapshot.docs[i].data()['DestinationLandfill'],
              uploadedAt: snapshot.docs[i].data()['UploadedAt'].toDate()));
        }
        return historyList;
      } else {
        return historyList;
      }
    } catch (e) {
      log("Error fetching user Wasted Weight: $e");
      return 0;
    }
  }

  Future? getUserRedeemHistory(String userId) async {
    List<RedeemHistoryModel> historyList = [];
    try {
      var snapshot = await FirebaseFirestore.instance
          .collection('redeems')
          .where('userId', isEqualTo: userId)
          .get();

      if (snapshot.docs.isNotEmpty) {
        for (var i = 0; i < snapshot.docs.length; i++) {
          historyList.add(RedeemHistoryModel(
              amount: snapshot.docs[i].data()['amount'],
              payment: snapshot.docs[i].data()['payment method'],
              timestamp: snapshot.docs[i].data()['timestamp'].toDate()));
        }
        return historyList;
      } else {
        return historyList;
      }
    } catch (e) {
      log("Error fetching user Wasted Weight: $e");
      return 0;
    }
  }
}
