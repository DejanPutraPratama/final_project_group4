import 'dart:io';
import 'package:final_project_group4/widget/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:final_project_group4/model/donateData.dart';
import 'package:final_project_group4/model/photo.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:final_project_group4/navbar/navbar_controller.dart';
import 'package:final_project_group4/page/donate/waitingdonate.dart';

class DonateScreen extends StatefulWidget {
  bool haveNavbar;
  String? landfill;

  DonateScreen({super.key, required this.haveNavbar, required this.landfill});

  @override
  _DonateScreenState createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  final userInfo = FirebaseAuth.instance.currentUser;
  String? selectedLandfill;
  String? selectedWasteType;
  final List<String> destinationLandfill = [
    'Bank Sampah Jakarta Utara',
    'Bank Sampah Jakarta Selatan',
    'Bank Sampah Jakarta Barat',
    'Bank Sampah Jakarta Timur',
    'Bank Sampah Jakarta Pusat'
  ];
  final List<String> wasteTypes = ['Plastic', 'Anorganic', 'Metal', 'Paper'];
  final TextEditingController weightController = TextEditingController();
  final NavbarController navbarController = Get.find<NavbarController>();
  final donateData = Get.put(DonateDatabase());
  File? selectedImage;

  void putImage(File image) {
    setState(() {
      selectedImage = image;
    });
  }

  // Future<void> createData(DonateModel donate) async {
  //   await donateData.createData(donate);
  // }

  Future<String?> _uploadImageToFirebase() async {
    if (selectedImage == null) return null;

    try {
      String fileName =
          'photo/${DateTime.now().millisecondsSinceEpoch.toString()}.png';
      Reference storageReference =
          FirebaseStorage.instance.ref().child(fileName);
      UploadTask uploadTask = storageReference.putFile(selectedImage!);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading image: $e ');
      return null;
    }
  }

  Future<void> addDonation({
    required String? userId,
    required String? selectedLandfill,
    required String? selectedWasteType,
    required TextEditingController? weightController,
    File? selectedImage,
  }) async {
    weightController ??= TextEditingController();
    try {
      String? imageUrl = await _uploadImageToFirebase();
      if (imageUrl == null) {
        Get.snackbar("Error", "Failed to upload image. Try again.",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red);
        return;
      }

      await FirebaseFirestore.instance.collection('donate').add({
        'userId': userId,
        'DestinationLandfill': selectedLandfill,
        'WasteType': selectedWasteType,
        'Weight': double.parse(weightController.text),
        'photoUrl': imageUrl,
        'UploadedAt': Timestamp.now(),
      }).whenComplete(() {
        Get.snackbar(
          "Success",
          "Your data has been created.",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => WaitingDonate(
              haveNavbar: widget.haveNavbar,
              wasteType: selectedWasteType!,
              weight: int.parse(weightController!.text),
            ),
          ),
        );
      }).catchError((error, StackTrace) {
        Get.snackbar(
          "Error",
          "Something went wrong. Try again.",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red,
        );
        print(error.toString());
      });
      // Show success message or perform other actions
    } catch (e) {
      print(e);
      Get.snackbar(
        "Error",
        "An unexpected error occured. Try again",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
      // Handle error
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    selectedLandfill = widget.landfill;
  }

  @override
  Widget build(BuildContext context) {
    final Function(int) onTap;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            navbarController.showBottomNav();
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
        title: const Text('Donate'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
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
                    print(selectedLandfill);
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
              const SizedBox(height: 30),
              CustomButton(
                label: "Donate",
                onPressed: () async {
                  if (selectedLandfill == null ||
                      selectedWasteType == null ||
                      weightController.text.isEmpty) {
                    // Handle validation error
                    Get.snackbar(
                      "Error",
                      "Please fill in all fields",
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.redAccent.withOpacity(0.1),
                      colorText: Colors.red,
                    );
                  } else {
                    await addDonation(
                      userId: userInfo!.uid,
                      selectedLandfill: selectedLandfill,
                      selectedWasteType: selectedWasteType,
                      weightController: weightController,
                      selectedImage: selectedImage,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
