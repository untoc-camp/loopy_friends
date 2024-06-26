import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideBarController extends GetxController {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  bool isSelected(String route) {
    return Get.currentRoute.contains(route);
  }
}
