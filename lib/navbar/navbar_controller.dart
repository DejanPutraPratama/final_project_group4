import 'package:get/get.dart';

class NavbarController extends GetxController {
  var isBottomNavVisible = true.obs;

  void showBottomNav() {
    isBottomNavVisible.value = true;
  }

  void hideBottomNav() {
    isBottomNavVisible.value = false;
  }
}
