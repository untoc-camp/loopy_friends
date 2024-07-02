import 'package:get/get.dart';
import 'package:loopy_friends/model/notice_list_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NoticeController extends GetxController {
  var totalCouncilData = <Notice>[].obs;
  var departmentCouncilData = <Notice>[].obs;
  var departmentNoticeData = <Notice>[].obs;
  var applyRecruitData = <Notice>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTotalCouncilData();
    fetchDepartmentCouncilData();
    fetchDepartmentNoticeData();
    fetchApplyRecruitData();
  }

  Future<void> fetchTotalCouncilData() async {
    final response = await http.get(Uri.parse('http://61.79.18.241:8000/notice'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      totalCouncilData.value = data.map((json) => Notice.fromJson(json)).toList();
    } else {
      throw Exception('정보 읽어오기를 실패하였습니다.');
    }
  }

  Future<void> fetchDepartmentCouncilData() async {
    final response = await http.get(Uri.parse('http://61.79.18.241:8000/notice'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      departmentCouncilData.value = data.map((json) => Notice.fromJson(json)).toList();
    } else {
      throw Exception('정보 읽어오기를 실패하였습니다.');
    }
  }

  Future<void> fetchDepartmentNoticeData() async {
    final response = await http.get(Uri.parse('http://61.79.18.241:8000/notice'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      departmentNoticeData.value = data.map((json) => Notice.fromJson(json)).toList();
    } else {
      throw Exception('정보 읽어오기를 실패하였습니다.');
    }
  }

  Future<void> fetchApplyRecruitData() async {
    final response = await http.get(Uri.parse('http://61.79.18.241:8000/notice'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      applyRecruitData.value = data.map((json) => Notice.fromJson(json)).toList();
    } else {
      throw Exception('정보 읽어오기를 실패하였습니다.');
    }
  }

  Future<void> addNotice(String category, Notice notice) async {
    String url;
    switch (category) {
      case 'totalCouncil':
        url = 'http://61.79.18.241:8000/notice';
        break;
      case 'departmentCouncil':
        url = 'http://61.79.18.241:8000/notice';
        break;
      case 'departmentNotice':
        url = 'http://61.79.18.241:8000/notice';
        break;
      case 'applyRecruit':
        url = 'http://61.79.18.241:8000/notice';
        break;
      default:
        throw Exception('잘못된 카테고리입니다.');
    }

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(notice.toJson()),
    );

    if (response.statusCode == 201) {
      switch (category) {
        case 'totalCouncil':
          totalCouncilData();
          break;
        case 'departmentCouncil':
          departmentCouncilData();
          break;
        case 'departmentNotice':
          departmentNoticeData();
          break;
        case 'applyRecruit':
          applyRecruitData();
          break;
      }
    } else {
      throw Exception('정보 추가를 실패하였습니다.');
    }
  }
}
