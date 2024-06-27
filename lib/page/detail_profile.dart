import 'dart:io';
import 'package:final_project_group4/controller/database.dart';
import 'package:final_project_group4/navbar/navbar_controller.dart';
import 'package:final_project_group4/navbar/navbar_navigation.dart';
import 'package:final_project_group4/page/profile_page.dart';
import 'package:final_project_group4/utils/custom_colors.dart';
import 'package:final_project_group4/widget/custom_widgets.dart';
import 'package:final_project_group4/widget/popup_dialog.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class DetailProfile extends StatefulWidget {
  String userId;
  DetailProfile({super.key, required this.userId});

  @override
  State<DetailProfile> createState() => _DetailProfileState();
}

class _DetailProfileState extends State<DetailProfile> {
  Database database = Database();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController daycontroller = TextEditingController();
  TextEditingController monthcontroller = TextEditingController();
  TextEditingController yearcontroller = TextEditingController();
  String? newBirthDate;
  String? selectedGender;
  TextEditingController mobilecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  String? selectedCity;

  final List<String> cities = [
    'Jakarta Utara',
    'Jakarta Selatan',
    'Jakarta Barat',
    'Jakarta Timur',
    'Jakarta Pusat'
  ];
  final NavbarController navbarController = Get.find<NavbarController>();
  ImagePicker picker = ImagePicker();
  XFile? theImage;
  Reference storageRef = FirebaseStorage.instance.ref();
  var userData;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future _loadUserData() async {
    await database.getDataUser(widget.userId).then((value) {
      userData = value.data();
    });
  }

  @override
  Widget build(BuildContext context) {
    CustomColors customColors = CustomColors();
    CustomWidgets customWidgets = CustomWidgets();
    double deviceWidth = MediaQuery.of(context).size.width;

    return FutureBuilder(
      future: database.getDataUser(widget.userId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          userData = snapshot.data;
          namecontroller.text = userData['fullName'];
          DateTime birthdate = DateTime.parse(userData['birthdate']);
          newBirthDate = userData['birthdate'];
          daycontroller.text = birthdate.day.toString();
          monthcontroller.text = birthdate.month.toString();
          yearcontroller.text = birthdate.year.toString();
          selectedGender = userData['gender'];
          mobilecontroller.text = userData['mobileNumber'];
          addresscontroller.text = userData['address'];
          selectedCity = userData['city'];
          return Scaffold(
            appBar: AppBar(
              leading: GestureDetector(
                onTap: () async {
                  await popUpDialog(
                          'Do you want to save the data changes first?',
                          '',
                          context,
                          'Yes, I do',
                          'No, delete it',
                          await database.updateUser(widget.userId, {
                            'fullName': namecontroller.text,
                            'birthdate': newBirthDate,
                            'gender': selectedGender,
                            'mobileNumber': mobilecontroller.text,
                            'address': addresscontroller.text,
                            'city': selectedCity,
                          }))
                      .then((_) {
                    Navigator.pop(context);
                    navbarController.showBottomNav();
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
                        fontWeight: FontWeight.bold,
                        color: customColors.redText)),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    Text('Edit Foto Profile'),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          haveImage(
                              'https://1.bp.blogspot.com/-8XJ_-WfmIvI/VE8xSs1ZwzI/AAAAAAAABt0/bOgv9sX_6EI/s1600/Gambar%2BTopeng%2BTradisional%2BBali%2BWanita%2BSeni%2BBudaya%2BIndonesia.jpg'),
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 50,
                            color: Colors.grey,
                          ),
                          GestureDetector(
                              onTap: () async {
                                theImage = await picker
                                    .pickImage(source: ImageSource.gallery)
                                    .then((value) => value);
                                setState(() {});
                              },
                              child: imagePicked(theImage)),
                        ],
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
                                  controller: namecontroller,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none),
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
                                                  selectedDate: birthdate,
                                                  maxDate:
                                                      DateTime(2018, 12, 31),
                                                );
                                                if (date != null) {
                                                  String day =
                                                      date.day.toString();
                                                  String month =
                                                      date.month.toString();
                                                  String year =
                                                      date.year.toString();

                                                  daycontroller.text = day;
                                                  monthcontroller.text = month;
                                                  yearcontroller.text = year;

                                                  newBirthDate =
                                                      date.toString();
                                                } else {
                                                  return;
                                                }
                                              },
                                              icon: const Icon(Icons
                                                  .keyboard_arrow_down_rounded)),
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
                                                  maxDate:
                                                      DateTime(2018, 12, 31),
                                                );
                                                if (date != null) {
                                                  String day =
                                                      date.day.toString();
                                                  String month =
                                                      date.month.toString();
                                                  String year =
                                                      date.year.toString();

                                                  daycontroller.text = day;
                                                  monthcontroller.text = month;
                                                  yearcontroller.text = year;
                                                  newBirthDate =
                                                      date.toString();
                                                } else {
                                                  return;
                                                }
                                              },
                                              icon: const Icon(Icons
                                                  .keyboard_arrow_down_rounded)),
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
                                                  maxDate:
                                                      DateTime(2018, 12, 31),
                                                );

                                                if (date != null) {
                                                  String day =
                                                      date.day.toString();
                                                  String month =
                                                      date.month.toString();
                                                  String year =
                                                      date.year.toString();

                                                  daycontroller.text = day;
                                                  monthcontroller.text = month;
                                                  yearcontroller.text = year;
                                                  newBirthDate =
                                                      date.toString();
                                                } else {
                                                  return;
                                                }
                                              },
                                              icon: const Icon(Icons
                                                  .keyboard_arrow_down_rounded)),
                                          border: InputBorder.none),
                                    )),
                              ],
                            )
                          ],
                        )),
                    StatefulBuilder(
                      builder: (context, setState) => Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Gender'),
                            Row(
                              children: [
                                RadioMenuButton(
                                    style: const ButtonStyle(
                                        overlayColor:
                                            WidgetStateColor.transparent),
                                    value: 'Male',
                                    groupValue: selectedGender,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedGender = value;
                                      });
                                    },
                                    child: const Text('Male')),
                                RadioMenuButton(
                                    value: 'Female',
                                    groupValue: selectedGender,
                                    style: const ButtonStyle(
                                        overlayColor:
                                            WidgetStateColor.transparent),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedGender = value;
                                      });
                                    },
                                    child: const Text('Female')),
                                RadioMenuButton(
                                  style: const ButtonStyle(
                                      overlayColor:
                                          WidgetStateColor.transparent),
                                  value: 'Others',
                                  groupValue: selectedGender,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedGender = value;
                                    });
                                  },
                                  child: const Text('Others'),
                                ),
                              ],
                            )
                          ],
                        ),
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
                                  controller: mobilecontroller,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none),
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
                                  controller: addresscontroller,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none),
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
                              StatefulBuilder(
                                builder: (context, setState) =>
                                    DropdownButtonFormField<String>(
                                  value: selectedCity,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none),
                                  isExpanded: true,
                                  hint: Text(
                                    'Please select city',
                                    style: GoogleFonts.getFont('Poppins',
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  icon: const Icon(
                                      Icons.keyboard_arrow_down_rounded),
                                  items: cities.map((String city) {
                                    return DropdownMenuItem<String>(
                                        value: city, child: Text(city));
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedCity = newValue;
                                    });
                                  },
                                ),
                              ),
                            )
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
                        onPressed: () async {
                          await database.updateUser(widget.userId, {
                            'fullName': namecontroller.text,
                            'birthdate': newBirthDate,
                            'gender': selectedGender,
                            'mobileNumber': mobilecontroller.text,
                            'address': addresscontroller.text,
                            'city': selectedCity,
                          });
                          Navigator.pop(context);
                          navbarController.showBottomNav();
                        },
                        child: const Text('Update')),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  Widget imagePicked(XFile? imagePicked) {
    if (imagePicked != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.file(
          File(imagePicked.path),
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

  Widget haveImage(String imageSrc) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Image.network(
        imageSrc,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
    );
  }
}
