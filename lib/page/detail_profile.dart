import 'package:final_project_group4/page/profile_page.dart';
import 'package:final_project_group4/utils/custom_colors.dart';
import 'package:final_project_group4/widget/custom_widgets.dart';
import 'package:final_project_group4/widget/popup_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_picker_plus/date_picker_plus.dart';

class DetailProfile extends StatefulWidget {
  const DetailProfile({super.key});

  @override
  State<DetailProfile> createState() => _DetailProfileState();
}

enum Gender { male, female, others }

class _DetailProfileState extends State<DetailProfile> {
  Gender? gender = Gender.male;
  TextEditingController daycontroller = TextEditingController();
  TextEditingController monthcontroller = TextEditingController();
  TextEditingController yearcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CustomColors customColors = CustomColors();
    CustomWidgets customWidgets = CustomWidgets();
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () async {
            await popUpDialog('Do you want to save the data changes first?', '',
                    context, 'Yes, I do', 'No, delete it', () {})
                .then((_) {
              Navigator.pop(context);
            });
          },
          child: Row(
            children: [
              const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 16,
              ),
              Text('Back',
                  style: GoogleFonts.getFont('Poppins',
                      textStyle: const TextStyle(
                          fontSize: 8, fontWeight: FontWeight.w600))),
            ],
          ),
        ),
        title: Text(
          'Edit Profile',
          style: GoogleFonts.getFont('Poppins',
              textStyle: TextStyle(
                  fontWeight: FontWeight.bold, color: customColors.redText)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.camera_alt),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Full Name'),
                      customWidgets.greyBox(
                          0.9 * deviceWidth,
                          60,
                          TextFormField(
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          ))
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Birth Date'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          customWidgets.birthGreyBox(
                              0.25 * deviceWidth,
                              60,
                              TextFormField(
                                controller: daycontroller,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () async {
                                          final date =
                                              await showDatePickerDialog(
                                            context: context,
                                            minDate: DateTime(1950, 1, 1),
                                            maxDate: DateTime(2018, 12, 31),
                                          );
                                          if (date != null) {
                                            String day = date.day.toString();
                                            String month =
                                                date.month.toString();
                                            String year = date.year.toString();
                                            setState(() {
                                              daycontroller.text = day;
                                              monthcontroller.text = month;
                                              yearcontroller.text = year;
                                            });
                                          } else {
                                            return;
                                          }
                                        },
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down_rounded)),
                                    border: InputBorder.none),
                              )),
                          customWidgets.birthGreyBox(
                              0.25 * deviceWidth,
                              60,
                              TextFormField(
                                controller: monthcontroller,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () async {
                                          final date =
                                              await showDatePickerDialog(
                                            context: context,
                                            minDate: DateTime(1950, 1, 1),
                                            maxDate: DateTime(2018, 12, 31),
                                          );
                                          if (date != null) {
                                            String day = date.day.toString();
                                            String month =
                                                date.month.toString();
                                            String year = date.year.toString();
                                            setState(() {
                                              daycontroller.text = day;
                                              monthcontroller.text = month;
                                              yearcontroller.text = year;
                                            });
                                          } else {
                                            return;
                                          }
                                        },
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down_rounded)),
                                    border: InputBorder.none),
                              )),
                          customWidgets.birthGreyBox(
                              0.3 * deviceWidth,
                              60,
                              TextFormField(
                                controller: yearcontroller,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: () async {
                                          final date =
                                              await showDatePickerDialog(
                                            context: context,
                                            minDate: DateTime(1950, 1, 1),
                                            maxDate: DateTime(2018, 12, 31),
                                          );
                                          if (date != null) {
                                            String day = date.day.toString();
                                            String month =
                                                date.month.toString();
                                            String year = date.year.toString();
                                            setState(() {
                                              daycontroller.text = day;
                                              monthcontroller.text = month;
                                              yearcontroller.text = year;
                                            });
                                          } else {
                                            return;
                                          }
                                        },
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down_rounded)),
                                    border: InputBorder.none),
                              )),
                        ],
                      )
                    ],
                  )),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Gender'),
                    Row(
                      children: [
                        RadioMenuButton(
                            style: const ButtonStyle(
                                overlayColor: WidgetStateColor.transparent),
                            value: Gender.male,
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value;
                              });
                            },
                            child: const Text('Male')),
                        RadioMenuButton(
                            value: Gender.female,
                            groupValue: gender,
                            style: const ButtonStyle(
                                overlayColor: WidgetStateColor.transparent),
                            onChanged: (value) {
                              setState(() {
                                gender = value;
                              });
                            },
                            child: const Text('Female')),
                        RadioMenuButton(
                          style: const ButtonStyle(
                              overlayColor: WidgetStateColor.transparent),
                          value: Gender.others,
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value;
                            });
                          },
                          child: const Text('Others'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Mobile Number'),
                      customWidgets.greyBox(
                          0.9 * deviceWidth,
                          60,
                          TextFormField(
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          ))
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Address'),
                      customWidgets.greyBox(
                          0.9 * deviceWidth,
                          60,
                          TextFormField(
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          ))
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('City'),
                      customWidgets.greyBox(
                          0.9 * deviceWidth,
                          60,
                          TextFormField(
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          ))
                    ],
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: deviceWidth * 0.3, vertical: 15),
                      backgroundColor: customColors.darkGreen,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {},
                  child: const Text('Update')),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
