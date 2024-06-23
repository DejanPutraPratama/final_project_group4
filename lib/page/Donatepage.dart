import 'dart:io';

import 'package:final_project_group4/navbar/navbar.dart';
import 'package:final_project_group4/navbar/navbar_navigation.dart';
import 'package:final_project_group4/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:final_project_group4/model/donateData.dart';
import 'package:final_project_group4/model/photo.dart';

class DonateScreen extends StatefulWidget {
  @override
  _DonateScreenState createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  String? selectedLandfill;
  String? selectedWasteType;
  final List<String> destinationLandfill = [
    'TPA Jakarta Utara',
    'TPA Jakarta Selatan',
    'TPA Jakarta Barat',
    'TPA Jakarta Timur',
    'TPA Jakarta Pusat'
  ];
  final List<String> wasteTypes = ['Plastic', 'Organic', 'Metal'];
  final TextEditingController weightController = TextEditingController();
  final donateData = Get.put(DonateDatabase());
  File? selectedImage;

  void putImage(File image) {
    setState(() {
      selectedImage = image;
    });
  }

  Future<void> createData(DonateModel donate) async {
    await donateData.createData(donate);
  }

  Future<void> addDonation() async {
    if (selectedLandfill == null ||
        selectedWasteType == null ||
        weightController.text.isEmpty) {
      // Handle validation error
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('donate').add({
        'DestinationLandfill': selectedLandfill,
        'WasteType': selectedWasteType,
        'Weight': double.parse(weightController.text),
      });
      // Show success message or perform other actions
    } catch (e) {
      print(e);
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    final Function(int) onTap;
    return Scaffold(
      appBar: AppBar(
        title: Text('Donate'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              const Text(
                'Destination Landfill',
                style: TextStyle(
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: selectedLandfill,
                onChanged: (value) {
                  setState(() {
                    selectedLandfill = value;
                  });
                },
                items: destinationLandfill.map((landfill) {
                  return DropdownMenuItem(
                    value: landfill,
                    child: Text(landfill),
                  );
                }).toList(),
                decoration: InputDecoration(
                  errorText: selectedLandfill == null
                      ? 'Please select your destination landfill'
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.black26, width: 1),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Waste Type',
                style: TextStyle(
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: selectedWasteType,
                onChanged: (value) {
                  setState(() {
                    selectedWasteType = value;
                  });
                },
                items: wasteTypes.map((wasteType) {
                  return DropdownMenuItem(
                    value: wasteType,
                    child: Text(wasteType),
                  );
                }).toList(),
                decoration: InputDecoration(
                    errorText: selectedWasteType == null
                        ? 'Please select your waste type'
                        : null,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.black26, width: 1))),
              ),
              const SizedBox(height: 20),
              const Text(
                'Weight',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  suffixText: 'kg',
                  errorText: weightController.text.isEmpty
                      ? 'Please input the weight of your waste'
                      : null,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.black26, width: 1)),
                ),
              ),
              const SizedBox(height: 20),
              uploadPhoto(onFileChanged: putImage),
              // const Text(
              //   'Upload Photo',
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontSize: 15
              //   ),
              // ),
              // const SizedBox(height: 10),
              // Container(
              //   height: 205,
              //   width: double.infinity,
              //   color: Colors.grey[300],
              //   child: Icon(
              //     Icons.camera_alt,
              //     size: 50,
              //     color: Colors.grey[700],
              //   ),
              // ),
              const SizedBox(height: 30),
              CustomButton(
                label: "Donate",
                onPressed: () async {
                  // createData();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
