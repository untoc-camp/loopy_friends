import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/constants/url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpController extends GetxController {
  final idController = TextEditingController();
  final pwdController = TextEditingController();
  final pwdCheckController = TextEditingController();
  final nameController = TextEditingController();
  final nicknameController = TextEditingController();
  final gradeController = TextEditingController();

  final RegExp idPwdRegExp = RegExp(r'^[a-zA-Z0-9]+$');
  final RegExp generalRegExp = RegExp(r'^[a-zA-Z0-9ㄱ-ㅎ가-힣]+$');

  void signUpButton() async {
    String apiUrl = '${Urls.apiUrl}users/';
    try {
      // 모든 필드가 비어있는 경우 처리
      if (idController.text.isEmpty ||
          pwdController.text.isEmpty ||
          pwdCheckController.text.isEmpty ||
          nameController.text.isEmpty ||
          nicknameController.text.isEmpty ||
          gradeController.text.isEmpty) {
        Get.snackbar(
          '회원가입 실패',
          '모든 칸을 채워주세요.',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      // 비밀번호 일치 여부 확인
      if (pwdController.text != pwdCheckController.text) {
        Get.snackbar(
          '회원가입 실패',
          '비밀번호가 일치하지 않습니다.',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      // 아이디와 비밀번호 유효성 검사
      if (!idPwdRegExp.hasMatch(idController.text) ||
          !idPwdRegExp.hasMatch(pwdController.text)) {
        Get.snackbar(
          '회원가입 실패',
          '아이디와 비밀번호는 영어와 숫자만 입력 가능합니다.',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      // 일반 필드 유효성 검사 (특수문자 포함 여부)
      if (!generalRegExp.hasMatch(nameController.text) ||
          !generalRegExp.hasMatch(nicknameController.text)) {
        Get.snackbar(
          '회원가입 실패',
          '이름과 닉네임에 특수문자를 입력할 수 없습니다.',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      // 학년이 숫자가 아닐 경우 처리
      int? grade = int.tryParse(gradeController.text);
      if (grade == null || grade < 1 || grade > 6) {
        Get.snackbar(
          '회원가입 실패',
          '학년에는 1에서 6 사이의 숫자만 입력해주세요.',
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
          "grade": grade
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
      } else if (response.statusCode == 409) {
        String bodyUtf8 = utf8.decode(response.bodyBytes);
        var responseJson = json.decode(bodyUtf8);
        String detailMessage = responseJson['detail'];
        Get.snackbar(
          '회원가입 실패',
          detailMessage,
          snackPosition: SnackPosition.BOTTOM,
        );
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
        'Failed to connect to the server: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    idController.dispose();
    pwdController.dispose();
    pwdCheckController.dispose();
    nameController.dispose();
    nicknameController.dispose();
    gradeController.dispose();
    super.onClose();
  }
}
