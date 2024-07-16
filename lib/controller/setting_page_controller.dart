import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:loopy_friends/model/user_info.dart';
import '../constants/url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SettingPageController extends GetxController {
  final pwController = TextEditingController();
  final newPwController = TextEditingController();
  final newPwCheckController = TextEditingController();

  var realname = ''.obs;
  var nickname = ''.obs;

  @override
  void onInit() {
    super.onInit();
    showInfo();
  }

  Future<void> deleteTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    await prefs.remove('refresh_token');
  }

  Future<void> logout() async {
    await deleteTokens();
    Get.offAllNamed('/login');
  }

  Future<void> showInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('access_token');
    String apiUrl = '${Urls.apiUrl}users/info';
    try {
      var response = await http.get(Uri.parse(apiUrl), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      });

      if (response.statusCode == 200) {
        String bodyUtf8 = utf8.decode(response.bodyBytes);
        var data = User_info.fromJson(json.decode(bodyUtf8));
        realname.value = data.realname;
        nickname.value = data.nickname;
      } else {}
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to connect to the server',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void changePwdButton() async {
    String apiUrl = '${Urls.apiUrl}users/changepwd';
    try {
      // 모든 필드가 비어있는 경우 처리
      if (pwController.text.isEmpty ||
          newPwController.text.isEmpty ||
          newPwCheckController.text.isEmpty) {
        Get.snackbar(
          '비밀번호 변경 실패',
          '모든 칸을 채워주세요.',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      // 새 비밀번호 일치 여부 확인
      if (newPwController.text != newPwCheckController.text) {
        Get.snackbar(
          '비밀번호 변경 실패',
          '새 비밀번호가 일치하지 않습니다.',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      // 비밀번호 유효성 검사
      final RegExp idPwdRegExp = RegExp(r'^[a-zA-Z0-9]+$');
      if (!idPwdRegExp.hasMatch(newPwController.text)) {
        Get.snackbar(
          '비밀번호 변경 실패',
          '비밀번호는 영어와 숫자만 입력 가능합니다.',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      // SharedPreferences에서 access_token 가져오기
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? accessToken = prefs.getString('access_token');

      if (accessToken == null) {
        Get.snackbar(
          'Error',
          '로그인 토큰이 없습니다. 다시 로그인 해주세요.',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      var response = await http.patch(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonEncode({
          "password": pwController.text,
          "new_password": newPwController.text,
        }),
      );

      if (response.statusCode == 200) {
        // 비밀번호 변경 성공 처리
        Get.snackbar(
          '비밀번호 변경 성공',
          '비밀번호가 성공적으로 변경되었습니다.',
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.offAllNamed('/setting');
      } else {
        // 비밀번호 변경 실패 처리
        Get.snackbar(
          '비밀번호 변경 실패',
          '비밀번호 변경에 실패했습니다. ${response.body}',
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

  
  final nicknameController = TextEditingController();

  Future<void> changeNickname() async {
    String apiUrl = '${Urls.apiUrl}users/changenickname';
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? accessToken = prefs.getString('access_token');

      if (accessToken == null) {
        Get.snackbar(
          'Error',
          '로그인 토큰이 없습니다. 다시 로그인 해주세요.',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      var response = await http.patch(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonEncode({
          "nickname": nicknameController.text,
        }),
      );

      if (response.statusCode == 200) {
        Get.snackbar(
          '닉네임 변경 성공',
          '닉네임이 성공적으로 변경되었습니다.',
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.offAllNamed('/setting');
      }else if(response.statusCode == 409){
        String bodyUtf8 = utf8.decode(response.bodyBytes);
        var responseJson = json.decode(bodyUtf8);
        String detailMessage = responseJson['detail'];
        Get.snackbar(
          '닉네임 변경 실패',
          detailMessage,
          snackPosition: SnackPosition.BOTTOM,
        );
      } 
      else {
        Get.snackbar(
          '닉네임 변경 실패',
          '닉네임 변경에 실패했습니다. ${response.body}',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        '서버 연결에 실패했습니다: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // 문의하기 기능 추가
  final inquiryMessageController = TextEditingController();

  Future<void> sendContactInquiry() async {
    String apiUrl = '${Urls.apiUrl}users/contact';
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? accessToken = prefs.getString('access_token');

      if (accessToken == null) {
        Get.snackbar(
          'Error',
          '로그인 토큰이 없습니다. 다시 로그인 해주세요.',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      var response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonEncode({
          "message": inquiryMessageController.text,
          "user_info": {
            "realname": realname.value,
            "nickname": nickname.value,
          },
        }),
      );

      if (response.statusCode == 200) {
        Get.snackbar(
          '문의 전송 성공',
          '문의 내용이 성공적으로 전송되었습니다.',
          snackPosition: SnackPosition.BOTTOM,
        );
        inquiryMessageController.clear();
      } else {
        Get.snackbar(
          '문의 전송 실패',
          '문의 전송에 실패했습니다. ${response.body}',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        '서버 연결에 실패했습니다: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
