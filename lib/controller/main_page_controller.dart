import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service/test_service.dart';
import '../model/test_model.dart';

class MainPageController extends GetxController {
  final Rx<List<TestModel>> testList = Rx<List<TestModel>>([]);

  final TestService _testSevice = TestService();

  @override
  void onInit() {
    super.onInit();
    getTest();
  }

  Future<void> getTest() async {
    var res = await _testSevice.getTest();
    testList.value = res;
  }

  get testListValue => testList.value;
}
