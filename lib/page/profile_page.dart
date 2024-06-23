import 'package:final_project_group4/utils/custom_colors.dart';
import 'package:final_project_group4/widget/custom_widgets.dart';
import 'package:flutter/material.dart';

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
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          foregroundColor: Colors.black,
                          radius: 35,
                          child: Icon(Icons.camera_enhance),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'John Doe',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: customColors.redText),
                            ),
                            Text(
                              'Member ID : 21328941621643871',
                              style: TextStyle(
                                  fontSize: 12, color: customColors.redText),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            customWidgets.greyBox(
                deviceWidth * 0.9,
                50,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Your Balance Point",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("100000 pts",
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                )),
            optionList('Update Profile'),
            optionList('Settings'),
            SizedBox(
              height: 10,
            ),
            optionList('Dark Mode'),
            SizedBox(
              height: 10,
            ),
            optionList('Terms & Conditions'),
            optionList('Personal Policy'),
            SizedBox(
              height: 10,
            ),
            optionList('Log out'),
            optionList('Delete Account'),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }

  ListTile optionList(String title) {
    return ListTile(
      style: ListTileStyle.list,
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
      shape: Border.symmetric(
          horizontal: BorderSide(width: 1, color: Colors.grey)),
    );
  }
}
