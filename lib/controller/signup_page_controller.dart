import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final idController = TextEditingController();
  final pwdController = TextEditingController();
  final pwdCheckController = TextEditingController();
  final nameController = TextEditingController();
  final nicknameController = TextEditingController();
  final gradeController = TextEditingController();

  void SignUpButton() {
    final id = idController.text;
    final pwd = pwdController.text;
    final pwdCheck = pwdCheckController.text;
    final name = nameController.text;
    final nickname = nicknameController.text;
    final grade = gradeController.text;

    print("회원가입 페이지에 온 것을 환영한다.");
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