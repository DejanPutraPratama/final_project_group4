import 'package:final_project_group4/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomWidgets {
  final _customColors = CustomColors();
  Widget greenCircle(double width, double height) {
    return Container(
      width: width * 4.5,
      height: height * 0.35,
      decoration: BoxDecoration(
          color: _customColors.green,
          borderRadius:
              BorderRadius.all(Radius.elliptical(width * 3, height * 0.3))),
    );
  }

  Widget lightGreenCircle(double width, double height) {
    return Container(
      width: width * 2.5,
      height: height * 0.5,
      decoration: BoxDecoration(
          color: _customColors.lightgreen,
          borderRadius:
              BorderRadius.all(Radius.elliptical(width * 2, height * 0.5))),
    );
  }

  Widget greyBox(double width, double height, Widget child) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 3),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20), child: child),
    );
  }

  Widget birthGreyBox(double width, double height, Widget child) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 3),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
          padding: const EdgeInsets.only(
            top: 5,
            left: 15,
          ),
          child: child),
    );
  }
}
