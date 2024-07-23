import 'dart:io';

import 'package:final_project_group4/controller/database.dart';
import 'package:final_project_group4/navbar/navbar_controller.dart';
import 'package:final_project_group4/page/detail_profile.dart';
import 'package:final_project_group4/services/UserPointService.dart';
import 'package:final_project_group4/utils/custom_colors.dart';
import 'package:final_project_group4/widget/custom_widgets.dart';
import 'package:final_project_group4/widget/popup_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  String userId;
  ProfilePage({super.key, required this.userId});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _userPoints = 0;
  Database database = Database();
  final UserPointsService _userPointsService = UserPointsService();
  final NavbarController navbarController = Get.find<NavbarController>();
  bool loggedOut = false;

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
    });
  }

  Future _loadUserData() async {
    await database.getDataUser(widget.userId).then((value) {
      userData = value.data();
    });
  }

  Future _onPullRefresh() async {
    await _loadUserData();
    await _loadUserPoints();
  }

  @override
  Widget build(BuildContext context) {
    final CustomWidgets customWidgets = CustomWidgets();
    final CustomColors customColors = CustomColors();
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;
    return FutureBuilder(
        future: database.getDataUser(widget.userId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            userData = snapshot.data;
            return RefreshIndicator(
              onRefresh: _onPullRefresh,
              child: Scaffold(
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
                              left: deviceWidth * 0.1,
                              top: deviceHeight * 0.1,
                              child: customWidgets.lightGreenCircle(
                                  deviceWidth, deviceHeight),
                            ),
                            Positioned(
                              right: deviceWidth * 0.5,
                              top: deviceHeight * 0.15,
                              child: customWidgets.greenCircle(
                                  deviceWidth, deviceHeight),
                            ),
                            Positioned(
                              left: 30,
                              height: 250,
                              child: Row(
                                children: [
                                  haveImage(userData['profilePhotoUrl']),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(userData['fullName'],
                                          style: GoogleFonts.getFont(
                                            'Poppins',
                                            textStyle: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600,
                                                color: customColors.redText),
                                          )),
                                      Text(
                                        'Member ID : ${userData['id']}',
                                        style: GoogleFonts.getFont(
                                          'Poppins',
                                          textStyle: TextStyle(
                                              fontSize: 8,
                                              color: customColors.redText),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: customWidgets.greyBox(
                            deviceWidth * 0.9,
                            60,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Your Balance Point",
                                    style: GoogleFonts.getFont(
                                      'Poppins',
                                      textStyle: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )),
                                Text(_userPoints.toString(),
                                    style: GoogleFonts.getFont(
                                      'Poppins',
                                      textStyle: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ))
                              ],
                            )),
                      ),
                      optionList('Update Profile', Colors.black,
                          const Icon(Icons.chevron_right_rounded), () {
                        navbarController.hideBottomNav();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailProfile(
                                      userId: widget.userId,
                                    )));
                      }),
                      optionList('Dark Mode', Colors.black, null, () {}),
                      const SizedBox(
                        height: 10,
                      ),
                      optionList('Terms & Conditions', Colors.black,
                          const Icon(Icons.chevron_right_rounded), () {}),
                      optionList('Personal Policy', Colors.black,
                          const Icon(Icons.chevron_right_rounded), () {}),
                      const SizedBox(
                        height: 10,
                      ),
                      optionList('Log out', Colors.black, null, () async {
                        await popUpDialog(
                            'Are you sure you want to Log Out?',
                            'This action will close the app',
                            context,
                            "Yes, I'm sure",
                            "No, I'm not", () async {
                          await FirebaseAuth.instance.signOut().then((_) {
                            exit(0);
                          });
                        }, () {});
                      }),
                      optionList('Delete Account', customColors.redText, null,
                          () async {
                        await popUpDialog(
                            'Are you sure you want to delete your account?',
                            'This action can not be undone, your data will deleted permanently',
                            context,
                            "Yes, I'm sure",
                            "No, I'm not",
                            () {},
                            () {});
                      }),
                      const SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }

  Widget haveImage(String? imageSrc) {
    if (imageSrc != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.network(
          imageSrc,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return const CircleAvatar(
        radius: 50,
        backgroundColor: Colors.grey,
        child: Icon(Icons.camera_alt),
      );
    }
  }

  Widget optionList(
      String title, Color textColor, Icon? icon, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        title: Text(title,
            style: GoogleFonts.getFont(
              'Poppins',
              textStyle: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w600, color: textColor),
            )),
        trailing: icon,
        shape: const Border.symmetric(
            horizontal: BorderSide(width: 1, color: Colors.black12)),
      ),
    );
  }
}

Future dologOut() async {
  await FirebaseAuth.instance.signOut();
  // Restart.restartApp();
}
