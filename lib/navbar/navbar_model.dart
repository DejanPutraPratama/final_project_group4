import 'package:flutter/material.dart';

class NavbarModel {
  final Widget page;
  final GlobalKey<NavigatorState> navkey;

  NavbarModel({required this.page, required this.navkey});
}
