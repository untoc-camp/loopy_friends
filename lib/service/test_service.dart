import 'dart:convert';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:loopy_friends/provider/test_api.dart';

import '../model/test_model.dart';

abstract class AbstractTestService {
  Future<List<TestModel>> getTest();
}

class TestService extends GetxService implements AbstractTestService {
  final TestApi _testApi = TestApi();

  @override
  Future<List<TestModel>> getTest() async {
    try {
      Response res = await _testApi.getTest();

      // JSON 문자열을 디코드하여 Dart 객체로 변환
      Map<String, dynamic> json = jsonDecode(res.bodyString!);

      // JSON 맵을 TestModel 리스트로 변환
      List<TestModel> testModels = [];
      json.forEach((key, value) {
        testModels.add(TestModel.fromJson(key, value));
      });

      return testModels;
    } catch (e) {
      rethrow;
    }
  }
}
