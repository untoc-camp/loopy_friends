import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constants/url.dart'; // Urls.apiUrl이 정의된 파일을 임포트합니다.

class LoadingPageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkAccessToken();
  }

  Future<void> checkAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');

    if (token == null) {
      // 토큰이 없으면 로그인 페이지로 라우팅
      Get.offAllNamed('/login');
      return;
    }

    // 서버에 토큰 유효성 검사 요청
    const url = '${Urls.apiUrl}check_token'; // 실제 API URL로 변경해야 합니다.
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        // 토큰이 유효하면 메인 페이지로 라우팅
        Get.offAllNamed('/main');
      } else {
        // 토큰이 유효하지 않으면 로그인 페이지로 라우팅
        Get.offAllNamed('/login');
      }
    } catch (e) {
      // 예외 발생 시 로그인 페이지로 라우팅
      Get.offAllNamed('/login');
    }
  }
}
