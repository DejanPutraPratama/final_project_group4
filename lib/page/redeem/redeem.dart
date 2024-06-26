import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_group4/model/ewalletmodel.dart';
import 'package:final_project_group4/services/UserPointService.dart';
import 'redeempayment.dart';

class RedeemPage extends StatefulWidget {
  final String userId;

  const RedeemPage({super.key, required this.userId});

  @override
  _RedeemPageState createState() => _RedeemPageState();
}

class _RedeemPageState extends State<RedeemPage> {
  int _userPoints = 0;
  final UserPointsService _userPointsService = UserPointsService();

  @override
  void initState() {
    super.initState();
    _loadUserPoints();
  }

  Future<void> _loadUserPoints() async {
    int points = await _userPointsService.getUserPoints(widget.userId);
    setState(() {
      _userPoints = points;
    });
  }

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
                    Text(
                      _userPoints.toString(),
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
                  SizedBox(height: 10),
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
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: ewallets.length,
                          itemBuilder: (context, index) {
                            var ewallet = ewallets[index];
                            return SizedBox(
                              height: 75,
                              child: Center(
                                child: ListTile(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
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
                                  trailing: Icon(Icons.arrow_forward),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RedeemPaymentPage(
                                            ewallet: ewallet,
                                            userPoints: _userPoints,
                                            userId: widget.userId),
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
            SizedBox(
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
      padding: EdgeInsets.all(10),
      child: child,
    );
  }
}
