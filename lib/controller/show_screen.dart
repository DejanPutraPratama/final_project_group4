import 'package:final_project_group4/controller/history_controller.dart';
import 'package:final_project_group4/controller/points_controller.dart';
import 'package:final_project_group4/controller/user_controller.dart';
import 'package:final_project_group4/controller/waste_controller.dart';
import 'package:final_project_group4/model/redeemhistory_model.dart';
import 'package:final_project_group4/model/wastehistory_model.dart';
import 'package:final_project_group4/navbar/navbar_controller.dart';
import 'package:final_project_group4/navbar/navbar_navigation.dart';
import 'package:final_project_group4/page/login.dart';
import 'package:final_project_group4/page/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowScreen extends StatelessWidget {
  const ShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: autoLogin(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == 'AutoLogin') {
              Future.delayed(Durations.short4, () {
                Get.off(const NavbarNavigation());
              });
            } else if (snapshot.data == 'ShowLogin') {
              Future.delayed(Durations.short4, () {
                Get.off(const LoginScreen());
              });
            } else {
              Future.delayed(Durations.short4, () {
                Get.off(const SplashScreen());
              });
            }
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }

  Future<String> autoLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final NavbarController navbarController = Get.put(NavbarController());
    final UserController userController = Get.put(UserController());
    final PointsController pointsController = Get.put(PointsController());
    final WasteController wasteController = Get.put(WasteController());
    final HistoryController historyController = Get.put(HistoryController());
    if (prefs.getString('userId') != null) {
      String userId = prefs.getString('userId')!;
      var userData = await userController.getDataUser(userId);
      var userPoints = await pointsController.getUserPoints(userId);
      var wastedByUser = await wasteController.getWastedWeight(userId);
      List<WasteHistoryModel> wastedHistoryList =
          await historyController.getUserWasteHistory(userId);
      List<RedeemHistoryModel> redeemHistoryList =
          await historyController.getUserRedeemHistory(userId);

      userController.updateUsername(userData.data()['fullName']);
      userController.updatePhotoUrl(userData.data()['profilePhotoUrl']);
      pointsController.updatePoints(userPoints);
      wasteController.updateWeight(wastedByUser);
      historyController.updateWasteList(wastedHistoryList);
      historyController.updateRedeemList(redeemHistoryList);
      return 'AutoLogin';
    } else if (prefs.getBool('hasSplash') == false) {
      return 'ShowLogin';
    } else {
      return 'ShowSplash';
    }
  }
}
