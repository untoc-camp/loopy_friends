import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/constants/url.dart';
import 'package:http/http.dart' as http;

class SignUpController extends GetxController {
  final idController = TextEditingController();
  final pwdController = TextEditingController();
  final pwdCheckController = TextEditingController();
  final nameController = TextEditingController();
  final nicknameController = TextEditingController();
  final gradeController = TextEditingController();

  void signUpButton() async {
    String apiUrl = '${Urls.apiUrl}users';
    try {
      if (pwdController.text != pwdCheckController.text) {
        Get.snackbar(
          'Error',
          '비밀번호가 일치하지 않습니다.',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      var response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "user_id": idController.text,
          "password": pwdController.text,
          "realname": nameController.text,
          "nickname": nicknameController.text,
          "grade": int.parse(gradeController.text)
        }),
      );

      if (response.statusCode == 200) {
        // 회원가입 성공 처리
        Get.snackbar(
          '회원가입 성공',
          '회원가입이 완료되었습니다.',
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.offAllNamed('/login');
      } else {
        // 회원가입 실패 처리
        Get.snackbar(
          '회원가입 실패',
          '회원가입에 실패했습니다.',
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

  void onclose() {
    idController.dispose();
    pwdController.dispose();
    pwdCheckController.dispose();
    nameController.dispose();
    nicknameController.dispose();
    gradeController.dispose();
    super.onClose();
  }
}
