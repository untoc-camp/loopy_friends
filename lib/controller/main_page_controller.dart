import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constants/url.dart';

class MainPageController extends GetxController {
  void navigteMain() {
    Get.toNamed('/login');
  }
}

class NoticeTop5 {
  final int id;
  final String title;
  final String created_at;
  final String deadline;

  NoticeTop5({required this.title, required this.created_at, required this.id, required this.deadline});

  factory NoticeTop5.fromJson(Map<String, dynamic> json) {
    return NoticeTop5(title: json['title'], created_at: json['created_at'], id: json['id'], deadline: json['deadline']
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
    isLoading(true);
    try {
      var response = await http.get(Uri.parse('${Urls.apiUrl}notice_top5'));
      if (response.statusCode == 200) {
        String bodyUtf8 = utf8.decode(response.bodyBytes);
        List<dynamic> jsonData = json.decode(bodyUtf8);
        noticeTop5List.value = jsonData.map((json) => NoticeTop5.fromJson(json)).toList();
      } else {
        Get.snackbar('오류', '데이터를 불러오는데 실패했습니다');
      }
    } catch (e) {
      Get.snackbar('오류', '데이터를 불러오는 중 문제가 발생했습니다: $e');
    } finally {
      isLoading(false);
    }
  }
}
