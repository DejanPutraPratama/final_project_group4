import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_group4/controller/database.dart';
import 'package:final_project_group4/model/userModel.dart';
import 'package:final_project_group4/navbar/navbar_controller.dart';
import 'package:final_project_group4/page/Donatepage.dart';
import 'package:final_project_group4/services/UserPointService.dart';
import 'package:final_project_group4/utils/custom_colors.dart';
import 'package:final_project_group4/widget/custom_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  final String userId;

  const HomePage({super.key, required this.userId});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Database database = Database();
  final userInfo = FirebaseAuth.instance.currentUser;
  int _userPoints = 0;
  final UserPointsService _userPointsService = UserPointsService();
  var userData;

  @override
  void initState() {
    super.initState();
    _loadUserPoints();
    _loadUserData();
  }

  Future<void> _loadUserPoints() async {
    int points = await _userPointsService.getUserPoints(widget.userId);

    setState(() {
      _userPoints = points;
      print(points);
    });
  }

  Future _loadUserData() async {
    await database.getDataUser(widget.userId).then((value) {
      userData = value.data();
    });
  }

  @override
  Widget build(BuildContext context) {
    final CustomWidgets customWidgets = CustomWidgets();
    final CustomColors customColors = CustomColors();
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;
    String? selectedItem;
    final NavbarController navbarController = Get.find<NavbarController>();

    void dropdownCallback(String? selectedValue) {
      if (selectedValue is String) {
        selectedItem = selectedValue;
      }
    }

    return FutureBuilder(
      future: database.getDataUser(userInfo!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          userData = snapshot.data;
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: deviceWidth,
                    height: 200,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(230, 240, 220, 1),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: deviceWidth * 0.2,
                          top: deviceHeight * 0.1,
                          child: customWidgets.lightGreenCircle(
                              deviceWidth, deviceHeight),
                        ),
                        Positioned(
                          left: -10,
                          top: deviceHeight * 0.15,
                          child: customWidgets.greenCircle(
                              deviceWidth, deviceHeight),
                        ),
                        Positioned(
                          width: deviceWidth,
                          height: 250,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Welcome, ${userData['fullName']}",
                                  style: GoogleFonts.getFont('Poppins',
                                      textStyle: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: customColors.redText)),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                    "Better environment, better tommorow\n-Unknown-",
                                    style: GoogleFonts.getFont('Poppins',
                                        textStyle: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: customColors.redText))),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  customWidgets.greyBox(
                      deviceWidth * 0.9,
                      75,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Your Balance Point",
                            style: GoogleFonts.getFont('Poppins',
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Text(_userPoints.toString(),
                              style: GoogleFonts.getFont('Poppins',
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )))
                        ],
                      )),
                  customWidgets.greyBox(
                      deviceWidth * 0.9,
                      180,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Destination Landfill",
                              style: GoogleFonts.getFont('Poppins',
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ))),
                          customWidgets.greyBox(
                            deviceWidth * 0.8,
                            50,
                            DropdownButtonFormField<String>(
                                value: selectedItem,
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                                isExpanded: true,
                                hint: Text(
                                  'Please select location',
                                  style: GoogleFonts.getFont('Poppins',
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500)),
                                ),
                                icon: const Icon(
                                    Icons.keyboard_arrow_down_rounded),
                                items: const [
                                  DropdownMenuItem<String>(
                                    value: 'Jakarta',
                                    child: Text('Jakarta'),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'Serang',
                                    child: Text("Serang"),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'Tangerang',
                                    child: Text("Tangerang"),
                                  ),
                                  DropdownMenuItem<String>(
                                    value: 'Yogyakarta',
                                    child: Text("Yogyakarta"),
                                  )
                                ],
                                onChanged: dropdownCallback),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Feel like to dispose today?',
                                style: GoogleFonts.getFont('Poppins',
                                    textStyle: const TextStyle(
                                      fontSize: 10,
                                    )),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    navbarController.hideBottomNav();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DonateScreen()));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 20),
                                      elevation: 0,
                                      backgroundColor: customColors.darkGreen,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  child: Text(
                                    'Donate Now',
                                    style: GoogleFonts.getFont('Poppins',
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white)),
                                  ))
                            ],
                          )
                        ],
                      )),
                  customWidgets.greyBox(
                      deviceWidth * 0.9,
                      300,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Instruction',
                              style: GoogleFonts.getFont('Poppins',
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: customColors.redText))),
                          SizedBox(
                            height: 250,
                            child: GridView.count(
                              childAspectRatio: 1.0,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      'assets/trash.png',
                                      height: 75,
                                    ),
                                    Text('Sort your waste',
                                        style: GoogleFonts.getFont('Poppins',
                                            textStyle: const TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500,
                                            )))
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      'assets/location.png',
                                      scale: 2,
                                      height: 75,
                                    ),
                                    Text('Send to nearest landfill',
                                        style: GoogleFonts.getFont('Poppins',
                                            textStyle: const TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500,
                                            )))
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      'assets/verified.png',
                                      scale: 2,
                                      height: 50,
                                    ),
                                    Text('Wait for verification and get points',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.getFont('Poppins',
                                            textStyle: const TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500,
                                            )))
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image.asset(
                                      'assets/money.png',
                                      scale: 2,
                                      height: 50,
                                    ),
                                    Text('Excange points to e-wallet',
                                        style: GoogleFonts.getFont('Poppins',
                                            textStyle: const TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500,
                                            )))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  customWidgets.greyBox(
                      deviceWidth * 0.9,
                      200,
                      Row(
                        children: [
                          Image.asset(
                            'assets/person.png',
                            scale: 1.5,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: deviceWidth * 0.4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'Congratulation! you have already sort and dispose the waste with total of',
                                    style: GoogleFonts.getFont('Poppins',
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: customColors.redText))),
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: '15',
                                      style: GoogleFonts.getFont('Poppins',
                                          textStyle: const TextStyle(
                                              fontSize: 36,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green))),
                                  TextSpan(
                                      text: 'kg',
                                      style: GoogleFonts.getFont('Poppins',
                                          textStyle: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green)))
                                ]))
                              ],
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          );
        } else {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
