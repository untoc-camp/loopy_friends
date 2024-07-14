import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
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

  void navigteMain() {
    Get.toNamed('/login');
  }

  get testListValue => testList.value;
}


class NoticeTop5 {
  final String title;
  // 다른 필드도 추가할 수 있습니다.

  NoticeTop5({required this.title});

  factory NoticeTop5.fromJson(Map<String, dynamic> json) {
    return NoticeTop5(
      title: json['title'],
      // 다른 필드도 초기화
    );
  }
}

class NoticeTop5Controller extends GetxController {
  var noticeTop5List = <NoticeTop5>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchNoticeTop5();
    super.onInit();
  }

  void fetchNoticeTop5() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse('YOUR_API_ENDPOINT'));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body) as List;
        noticeTop5List.value = jsonData.map((json) => NoticeTop5.fromJson(json)).toList();
      } else {
        // 오류 처리
      }
    } finally {
      isLoading(false);
    }
  }
}