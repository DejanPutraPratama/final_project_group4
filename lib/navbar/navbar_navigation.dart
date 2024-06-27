import 'package:final_project_group4/navbar/navbar.dart';
import 'package:final_project_group4/navbar/navbar_controller.dart';
import 'package:final_project_group4/navbar/navbar_model.dart';
import 'package:final_project_group4/navbar/tab_page.dart';
import 'package:final_project_group4/page/Donatepage.dart';
import 'package:final_project_group4/page/detail_profile.dart';
import 'package:final_project_group4/page/home_page.dart';
import 'package:final_project_group4/page/profile_page.dart';
import 'package:final_project_group4/page/redeem/redeem.dart';
import 'package:final_project_group4/utils/custom_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavbarNavigation extends StatefulWidget {
  NavbarNavigation({super.key});
  @override
  State<NavbarNavigation> createState() => _NavbarNavigationState();
}

class _NavbarNavigationState extends State<NavbarNavigation> {
  final userInfo = FirebaseAuth.instance.currentUser;
  final homeNavKey = GlobalKey<NavigatorState>();
  final redeemNavKey = GlobalKey<NavigatorState>();
  final historyNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();
  int selectedTab = 0;
  List<NavbarModel> items = [];
  final NavbarController navbarController = Get.find<NavbarController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items = [
      NavbarModel(
          page: HomePage(
            userId: userInfo!.uid,
          ),
          navkey: homeNavKey),
      NavbarModel(
          page: RedeemPage(userId: userInfo!.uid), navkey: redeemNavKey),
      NavbarModel(
          page: const TabPage(
            tab: 3,
          ),
          navkey: historyNavKey),
      NavbarModel(
          page: ProfilePage(userId: userInfo!.uid), navkey: profileNavKey),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final CustomColors customColors = CustomColors();
    return PopScope(
      onPopInvoked: (value) async {
        if (items[selectedTab].navkey.currentState?.canPop() ?? false) {
          items[selectedTab].navkey.currentState?.pop();
          return await Future.value(false);
        } else {
          return await Future.value(true);
        }
      },
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: IndexedStack(
          index: selectedTab,
          children: items
              .map((page) => Navigator(
                    key: page.navkey,
                    onGenerateInitialRoutes: (navigator, initialRoute) {
                      return [
                        MaterialPageRoute(builder: (context) => page.page)
                      ];
                    },
                  ))
              .toList(),
        ),
        bottomNavigationBar: Obx(() => navbarController.isBottomNavVisible.value
            ? Navbar(
                pageIndex: selectedTab,
                onTap: (index) {
                  if (index == selectedTab) {
                    items[index]
                        .navkey
                        .currentState
                        ?.popUntil((route) => route.isFirst);
                  } else {
                    setState(() {
                      selectedTab = index;
                    });
                  }
                },
              )
            : SizedBox.shrink()),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Obx(
          () => navbarController.isBottomNavVisible.value
              ? SizedBox(
                  width: 75,
                  height: 75,
                  child: FloatingActionButton(
                    foregroundColor: Colors.white,
                    backgroundColor: customColors.darkGreen,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DonateScreen()));
                    },
                    shape: const CircleBorder(
                        side: BorderSide(width: 0, color: Colors.green)),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.recycling,
                        ),
                        Text('Donate')
                      ],
                    ),
                  ),
                )
              : SizedBox.shrink(),
        ),
      ),
    );
  }
}
