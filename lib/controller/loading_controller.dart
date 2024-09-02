import 'package:final_project_group4/controller/theme_controller.dart';
import 'package:final_project_group4/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingController {
  CustomColors customColors = CustomColors();
  ThemeController themeController = Get.find<ThemeController>();
  void showLoadingDialog() {
    Get.dialog(
        Center(
            child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 150,
            height: 150,
            color: themeController.themeMode.value == ThemeMode.light
                ? Colors.white
                : Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CircularProgressIndicator(),
                  Text('Please Wait',
                      style: GoogleFonts.getFont(
                        'Poppins',
                        textStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none),
                      ))
                ],
              ),
            ),
          ),
        )),
        barrierDismissible: false);
  }

  void closeLoadingDialog() {
    Get.back();
  }

  void showAlertDialog(String title, String errorMessage) {
    Get.defaultDialog(
        title: title,
        titleStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        content: Column(
          children: [
            const Icon(
              Icons.error_outline,
              size: 100,
              color: Colors.red,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              errorMessage,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            )
          ],
        ),
        onConfirm: () => Get.back(),
        buttonColor: customColors.darkGreen);
  }
}
