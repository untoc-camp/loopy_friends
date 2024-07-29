import 'package:get/get.dart';
import 'package:loopy_friends/model/notice_list_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/url.dart';

class NoticeController extends GetxController {
  var totalCouncilData = <Notice>[].obs;
  var departmentCouncilData = <Notice>[].obs;
  var departmentNoticeData = <Notice>[].obs;
  var applyRecruitData = <Notice>[].obs;

  @override
  void onInit() {
    super.onInit();
    refreshData('totalCouncil');
  }

  Future<void> fetchNoticeData(String category) async {
    String url = '${Urls.apiUrl}notice?category=$category';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String bodyUtf8 = utf8.decode(response.bodyBytes);
      List<dynamic> data = json.decode(bodyUtf8);
      RxList<Notice> targetList;
      switch (category) {
        case 'totalCouncil':
          targetList = totalCouncilData;
          break;
        case 'departmentCouncil':
          targetList = departmentCouncilData;
          break;
        case 'departmentNotice':
          targetList = departmentNoticeData;
          break;
        case 'applyRecruit':
          targetList = applyRecruitData;
          break;
        default:
          throw Exception('잘못된 카테고리입니다.');
      }
      targetList.value = data.map((json) => Notice.fromJson(json)).toList();
    } else {
      throw Exception('정보 읽어오기를 실패하였습니다. 응답 코드: ${response.statusCode}');
    }
  }

  void refreshData(String category) {
    fetchNoticeData(category);
  }

  void updateList(String category, List<dynamic> jsonData) {
    RxList<Notice> targetList;
    switch (category) {
      case 'totalCouncil':
        targetList = totalCouncilData;
        break;
      case 'departmentCouncil':
        targetList = departmentCouncilData;
        break;
      case 'departmentNotice':
        targetList = departmentNoticeData;
        break;
      case 'applyRecruit':
        targetList = applyRecruitData;
        break;
      default:
        throw Exception('잘못된 카테고리입니다.');
    }
    targetList.value = jsonData.map((json) => Notice.fromJson(json)).toList();
  }
}
