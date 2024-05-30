
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartPageController extends GetxController {
  final idTextController = TextEditingController();
  final pwTextController = TextEditingController();
  
  void loginButton() {
    Get.toNamed('/main');
  }
}
