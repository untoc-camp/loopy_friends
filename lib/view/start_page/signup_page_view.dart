import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/controller/signup_page_controller.dart';

class SignUpPageView extends StatefulWidget {
  const SignUpPageView({super.key});

  @override
  _SignUpPageViewState createState() => _SignUpPageViewState();
}

class _SignUpPageViewState extends State<SignUpPageView> {
  final _controller = Get.put(SignUpController());

  bool _isPasswordHidden = true;
  bool _isPasswordCheckHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), // 화면을 터치하면 키보드 숨기기
        child: SingleChildScrollView(
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
                obscureText: _isPasswordHidden,
                decoration: InputDecoration(
                  labelText: '비밀번호',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordHidden
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordHidden = !_isPasswordHidden;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _controller.pwdCheckController,
                obscureText: _isPasswordCheckHidden,
                decoration: InputDecoration(
                  labelText: '비밀번호확인',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordCheckHidden
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordCheckHidden = !_isPasswordCheckHidden;
                      });
                    },
                  ),
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
      ),
      resizeToAvoidBottomInset: true, // 키보드가 올라올 때 화면을 자동으로 조정
    );
  }
}
