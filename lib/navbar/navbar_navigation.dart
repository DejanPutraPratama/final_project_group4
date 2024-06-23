import 'package:final_project_group4/navbar/navbar.dart';
import 'package:final_project_group4/navbar/navbar_model.dart';
import 'package:final_project_group4/navbar/tab_page.dart';
import 'package:final_project_group4/page/home_page.dart';
import 'package:final_project_group4/page/profile_page.dart';
import 'package:final_project_group4/utils/custom_colors.dart';
import 'package:final_project_group4/widget/custom_widgets.dart';
import 'package:flutter/material.dart';

class NavbarNavigation extends StatefulWidget {
  const NavbarNavigation({super.key});

  @override
  State<NavbarNavigation> createState() => _NavbarNavigationState();
}

class _NavbarNavigationState extends State<NavbarNavigation> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final redeemNavKey = GlobalKey<NavigatorState>();
  final historyNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();
  int selectedTab = 0;
  List<NavbarModel> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items = [
      NavbarModel(page: HomePage(), navkey: homeNavKey),
      NavbarModel(
          page: TabPage(
            tab: 2,
          ),
          navkey: redeemNavKey),
      NavbarModel(
          page: TabPage(
            tab: 3,
          ),
          navkey: historyNavKey),
      NavbarModel(page: ProfilePage(), navkey: profileNavKey),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final CustomWidgets customWidgets = CustomWidgets();
    final CustomColors customColors = CustomColors();
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;

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
        bottomNavigationBar: Navbar(
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
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
          width: 75,
          height: 75,
          child: FloatingActionButton(
            foregroundColor: Colors.white,
            backgroundColor: customColors.darkGreen,
            onPressed: () {},
            shape:
                CircleBorder(side: BorderSide(width: 0, color: Colors.green)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.recycling,
                ),
                Text('Donate')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
