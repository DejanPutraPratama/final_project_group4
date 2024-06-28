import 'package:flutter/material.dart';
import 'package:final_project_group4/navbar/navbar_controller.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool showWaste = true;
  final NavbarController navbarController = Get.find<NavbarController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            navbarController.showBottomNav();
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
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
      backgroundColor: Colors.white,
    );
  }
}

class WasteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ListTile(
          leading: Icon(Icons.delete, color: Colors.green),
          title: Text('Plastic - 1 kg'),
          subtitle: Text('31 Mei 2024 - TPA Rawa Kucing'),
          trailing: Text('Accepted', style: TextStyle(color: Colors.green)),
        ),
        const ListTile(
          leading: Icon(Icons.delete, color: Colors.green),
          title: Text('Plastic - 2 kg'),
          subtitle: Text('11 Mei 2024 - TPA Rawa Kucing'),
          trailing: Text('Rejected', style: TextStyle(color: Colors.red)),
        ),
        const ListTile(
          leading: Icon(Icons.delete, color: Colors.green),
          title: Text('Plastic - 2 kg'),
          subtitle: Text('1 Mei 2024 - TPA Rawa Kucing'),
          trailing: Text('In Progress', style: TextStyle(color: Colors.grey)),
        ),
      ],
    );
  }
}

class RedeemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ListTile(
          leading: Icon(Icons.card_giftcard, color: Colors.green),
          title: Text('Voucher - 10 points'),
          subtitle: Text('Redeemed on 20 Mei 2024'),
          trailing: Text('Completed', style: TextStyle(color: Colors.green)),
        ),
        const ListTile(
          leading: Icon(Icons.card_giftcard, color: Colors.green),
          title: Text('Gift Card - 20 points'),
          subtitle: Text('Redeemed on 15 Mei 2024'),
          trailing: Text('Completed', style: TextStyle(color: Colors.green)),
        ),
        const ListTile(
          leading: Icon(Icons.card_giftcard, color: Colors.green),
          title: Text('Coupon - 5 points'),
          subtitle: Text('Redeemed on 5 Mei 2024'),
          trailing: Text('Completed', style: TextStyle(color: Colors.green)),
        ),
      ],
    );
  }
}
