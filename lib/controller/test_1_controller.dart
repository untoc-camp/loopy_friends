import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test1Controller extends GetxController {
  RxInt count = 0.obs;
  RxString name = "123".obs;
  final textController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getUserData();
  }

  Future<void> getUserData() async {
    await Future.delayed(Duration(seconds: 2));
    count.value = 10;
  }
  
  void increment() {
    count++;
  }

  void decrement() {
    count--;
  }

  void changeName() {
    name.value = textController.text;
  }

  get countValue => count.value;
  get nameValue => name.value;
}
