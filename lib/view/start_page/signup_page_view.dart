import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/controller/signup_page_controller.dart';

class SignUpPageView extends StatelessWidget {
  SignUpPageView({super.key});

  final _controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _controller.idController,
              decoration: InputDecoration(
                labelText: '아이디',
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _controller.pwdController,
              decoration: InputDecoration(
                labelText: '비밀번호',
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _controller.pwdCheckController,
              decoration: InputDecoration(
                labelText: '비밀번호확인',
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _controller.nameController,
              decoration: InputDecoration(
                labelText: '이름',
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _controller.nicknameController,
              decoration: InputDecoration(
                labelText: '닉네임',
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _controller.gradeController,
              decoration: InputDecoration(
                labelText: '학년',
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _controller.signUpButton();
                },
                child: Text('회원가입'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
