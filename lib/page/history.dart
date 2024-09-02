import 'package:final_project_group4/controller/history_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool showWaste = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    showWaste = true;
                  });
                },
                child: Text(
                  'Waste',
                  style: TextStyle(
                    color: showWaste ? Colors.green : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    showWaste = false;
                  });
                },
                child: Text(
                  'Redeem',
                  style: TextStyle(
                    color: showWaste ? Colors.black : Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: showWaste ? WasteList() : RedeemList(),
          ),
        ],
      ),
    );
  }
}

class WasteList extends StatelessWidget {
  WasteList({super.key});
  final HistoryController historyController = Get.find<HistoryController>();

  @override
  Widget build(BuildContext context) {
    return historyController.wasteHistoryList.isNotEmpty
        ? Obx(() => ListView.builder(
            itemCount: historyController.wasteHistoryList.length,
            itemBuilder: (context, index) {
              String dateUploaded = DateFormat('yyyy-MMMM-dd')
                  .format(historyController.wasteHistoryList[index].uploadedAt);
              return ListTile(
                leading: const Icon(Icons.delete, color: Colors.green),
                title: Text(
                    '${historyController.wasteHistoryList[index].wasteType} - ${historyController.wasteHistoryList[index].wasteWeight.toStringAsFixed(0)} kg'),
                subtitle: Text(
                    '$dateUploaded\n${historyController.wasteHistoryList[index].destinationLandfill}'),
                trailing: const Text('Accepted',
                    style: TextStyle(color: Colors.green)),
              );
            }))
        : const Center(
            child: Text('Data masih kosong'),
          );
  }
}

class RedeemList extends StatelessWidget {
  RedeemList({super.key});
  final HistoryController historyController = Get.find<HistoryController>();

  @override
  Widget build(BuildContext context) {
    return (historyController.redeemHistoryList.isNotEmpty)
        ? Obx(() => ListView.builder(
            itemCount: historyController.redeemHistoryList.length,
            itemBuilder: (context, index) {
              String dateUploaded = DateFormat('yyyy-MMMM-dd')
                  .format(historyController.redeemHistoryList[index].timestamp);
              return ListTile(
                leading: const Icon(Icons.delete, color: Colors.green),
                title: Text(
                    '${historyController.redeemHistoryList[index].payment} - ${historyController.redeemHistoryList[index].amount} points'),
                subtitle: Text(dateUploaded),
                trailing: const Text('Completed',
                    style: TextStyle(color: Colors.green)),
              );
            }))
        : const Center(
            child: Text('Data masih kosong'),
          );
  }
}
