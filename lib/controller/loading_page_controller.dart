import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../constants/url.dart'; // Urls.apiUrl이 정의된 파일을 임포트합니다.

class LoadingPageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkAccessToken();
  }

  Future<void> checkAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('access_token');

    if (accessToken == null) {
      Get.offAllNamed('/login');
      return;
    }

    // 서버에 토큰 유효성 검사 요청
    final url = '${Urls.apiUrl}check_token'; 
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData['status'] == 'valid') {
          Get.offAllNamed('/main');
        } else if (responseData['detail'] == 'Token expired') {
          await _refreshToken();
        } else {
          Get.offAllNamed('/login');
        }
      } else {
        Get.offAllNamed('/login');
      }
    } catch (e) {
      Get.offAllNamed('/login');
    }
  }

  Future<void> _refreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    final refreshToken = prefs.getString('refresh_token');

    if (refreshToken == null) {
      Get.offAllNamed('/login');
      return;
    }

    final url = '${Urls.apiUrl}refresh_token'; 
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $refreshToken',
    };

    try {
      final response = await http.post(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        var newAccessToken = responseData['access_token'];
        await saveAccessToken(newAccessToken);
        Get.offAllNamed('/main');
      } else {
        Get.offAllNamed('/login');
      }
    } catch (e) {
      Get.offAllNamed('/login');
    }
  }

  Future<void> saveAccessToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', token);
  }
}
