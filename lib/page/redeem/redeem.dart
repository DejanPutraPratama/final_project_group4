import 'package:final_project_group4/controller/points_controller.dart';
import 'package:final_project_group4/navbar/navbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_group4/model/ewalletmodel.dart';
import 'redeempayment.dart';

class RedeemPage extends StatelessWidget {
  final String userId;
  RedeemPage({super.key, required this.userId});

  final NavbarController navbarController = Get.find<NavbarController>();
  final PointsController pointsController = Get.find<PointsController>();

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Redeem',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF5E3023),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: greyBox(
                deviceWidth * 0.9,
                75,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Your Balance Point",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Obx(
                      () => Text(
                        pointsController.userPoints.value.toString(),
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: deviceWidth * 0.9,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Choose your e-wallet',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('ewallets')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return const Center(child: Text("No data available"));
                      }

                      var ewallets = snapshot.data!.docs.map((doc) {
                        return EWallet.fromMap(
                            doc.data() as Map<String, dynamic>);
                      }).toList();
                      return SizedBox(
                        height: 300,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: ewallets.length,
                          itemBuilder: (context, index) {
                            var ewallet = ewallets[index];
                            return SizedBox(
                              height: 75,
                              child: Center(
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  leading: Image.network(
                                    ewallet.imageUrl,
                                    width: 40,
                                    height: 40,
                                  ),
                                  title: Text(
                                    ewallet.name,
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  trailing: const Icon(Icons.arrow_forward),
                                  onTap: () {
                                    navbarController.hideBottomNav();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RedeemPaymentPage(
                                            ewallet: ewallet,
                                            userPoints: pointsController
                                                .userPoints.value,
                                            userId: userId),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }

  Widget greyBox(double width, double height, Widget child) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: child,
    );
  }
}
