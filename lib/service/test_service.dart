import 'dart:convert';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:loopy_friends/provider/test_api.dart';

import '../model/test_model.dart';

abstract class AbstractTestService {
  Future<List<TestModel>> getTest();
}

class TestSevice extends GetxService implements AbstractTestService {
  final TestApi _testApi = TestApi();

  @override
  Future<List<TestModel>> getTest() async {
    try {
      Response res = await _testApi.getTest();
      print(res.body);
      print("-----------------");
      List<TestModel> testModel = res.body['name']
          .map<TestModel>((json) => TestModel.fromJson(json))
          .toList();

      return testModel;
    } catch (e) {
      rethrow;
    }
  }
}
