import 'package:final_project_group4/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<Widget?> popUpDialog(
  String title,
  String description,
  BuildContext context,
  String confirmText,
  String cancelText,
  Future? onTapYes,
) async {
  CustomColors customColors = CustomColors();
  return await showModalBottomSheet(
      useRootNavigator: true,
      context: context,
      builder: (context) => Container(
            height: 200,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.getFont('Poppins',
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    description,
                    style: GoogleFonts.getFont('Poppins',
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              elevation: 0,
                              backgroundColor: customColors.darkGreen,
                              foregroundColor: Colors.white),
                          onPressed: () async {
                            await onTapYes;
                            Navigator.pop(context);
                          },
                          child: Text(confirmText)),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              elevation: 0,
                              backgroundColor: customColors.redText,
                              foregroundColor: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(cancelText)),
                    ],
                  )
                ],
              ),
            )),
          ));
}
