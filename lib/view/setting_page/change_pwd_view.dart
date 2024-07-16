import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/controller/setting_page_controller.dart';

class ChangePwdView extends StatefulWidget {
  const ChangePwdView({super.key});

  @override
  _SignUpPageViewState createState() => _SignUpPageViewState();
}

class _SignUpPageViewState extends State<ChangePwdView> {
  final _controller = Get.put(SettingPageController());

  bool _islastPasswordHidden = true;
  bool _isPasswordHidden = true;
  bool _isPasswordCheckHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('비밀번호 변경'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), // 화면을 터치하면 키보드 숨기기
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: _controller.pwController,
                obscureText: _islastPasswordHidden,
                decoration: InputDecoration(
                  labelText: '이전 비밀번호',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _islastPasswordHidden
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _islastPasswordHidden = !_islastPasswordHidden;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _controller.newPwController,
                obscureText: _isPasswordHidden,
                decoration: InputDecoration(
                  labelText: '새 비밀번호',
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
                controller: _controller.newPwCheckController,
                obscureText: _isPasswordCheckHidden,
                decoration: InputDecoration(
                  labelText: '새 비밀번호 확인',
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
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _controller.changePwdButton();
                  },
                  child: Text('비밀번호 변경'),
                ),
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true, // 키보드가 올라올 때 화면을 자동으로 조정
    );
  }
}
