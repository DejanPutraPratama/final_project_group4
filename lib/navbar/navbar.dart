import 'package:final_project_group4/controller/theme_controller.dart';
import 'package:final_project_group4/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Navbar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;
  const Navbar({super.key, required this.pageIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find<ThemeController>();
    CustomColors customColors = CustomColors();
    return BottomAppBar(
      height: 70,
      color: Colors.transparent,
      padding: EdgeInsets.zero,
      elevation: 0,
      child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          child: Obx(
            () => Container(
              height: 60,
              color: themeController.themeMode.value == ThemeMode.light
                  ? customColors.greyGreen
                  : Colors.grey[850],
              child: Row(
                children: [
                  navItem(
                    Icons.home_outlined,
                    'Home',
                    pageIndex == 0,
                    onTap: () => onTap(0),
                  ),
                  navItem(
                    Icons.card_giftcard,
                    'Redeem',
                    pageIndex == 1,
                    onTap: () => onTap(1),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  navItem(
                    Icons.history,
                    'History',
                    pageIndex == 2,
                    onTap: () => onTap(2),
                  ),
                  navItem(
                    Icons.person,
                    'Profile',
                    pageIndex == 3,
                    onTap: () => onTap(3),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget navItem(IconData icon, String label, bool selected,
      {Function()? onTap}) {
    CustomColors customColors = CustomColors();
    return Expanded(
        child: InkWell(
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: selected ? Colors.black : customColors.redIcon),
          Text(
            label,
            style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.transparent,
                color: selected ? Colors.black : customColors.redIcon),
          )
        ],
      ),
    ));
  }
}
