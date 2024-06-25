import 'package:final_project_group4/page/detail_profile.dart';
import 'package:final_project_group4/utils/custom_colors.dart';
import 'package:final_project_group4/widget/custom_widgets.dart';
import 'package:final_project_group4/widget/popup_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomWidgets customWidgets = CustomWidgets();
    final CustomColors customColors = CustomColors();
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;
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
                    left: deviceWidth * 0.1,
                    top: deviceHeight * 0.1,
                    child: customWidgets.lightGreenCircle(
                        deviceWidth, deviceHeight),
                  ),
                  Positioned(
                    right: deviceWidth * 0.5,
                    top: deviceHeight * 0.15,
                    child: customWidgets.greenCircle(deviceWidth, deviceHeight),
                  ),
                  Positioned(
                    left: 30,
                    height: 250,
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.black,
                          radius: 35,
                          child: Icon(Icons.camera_enhance),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('John Doe',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  textStyle: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: customColors.redText),
                                )),
                            Text(
                              'Member ID : 21328941621643871',
                              style: GoogleFonts.getFont(
                                'Poppins',
                                textStyle: TextStyle(
                                    fontSize: 12, color: customColors.redText),
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
                      Text("100000 pts",
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DetailProfile()));
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
            optionList('Log out', Colors.black, null, () {
              popUpDialog('Are you sure you want to Log Out?', '', context,
                  "Yes, I'm sure", "No, I'm not", () {});
            }),
            optionList('Delete Account', customColors.redText, null, () {
              popUpDialog(
                  'Are you sure you want to delete your account?',
                  'This action can not be undone, your data will deleted permanently',
                  context,
                  "Yes, I'm sure",
                  "No, I'm not",
                  () {});
            }),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
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
