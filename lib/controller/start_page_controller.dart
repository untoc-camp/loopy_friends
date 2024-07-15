import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constants/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartPageController extends GetxController {
  final idTextController = TextEditingController();
  final pwTextController = TextEditingController();

  void loginButton() async {
    String apiUrl = '${Urls.apiUrl}users/login';
    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'user_id': idTextController.text,
          'password': pwTextController.text,
        }),
      );

      if (response.statusCode == 200) {
        // 로그인 성공 처리
        var data = jsonDecode(response.body);
        var accessToken = data['access_token'];
        await saveAccessToken(accessToken);
        Get.offAllNamed('/main');
      } else {
        // 로그인 실패 처리
        Get.snackbar(
          'Login Failed',
          'Invalid user_id or password',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to connect to the server',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

Future<void> saveAccessToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('access_token', token);
}
