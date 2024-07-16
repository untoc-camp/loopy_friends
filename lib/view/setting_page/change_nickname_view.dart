import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/controller/setting_page_controller.dart';

class ChangeNicknameView extends StatefulWidget {
  const ChangeNicknameView({super.key});

  @override
  _ChangeNicknameViewState createState() => _ChangeNicknameViewState();
}

class _ChangeNicknameViewState extends State<ChangeNicknameView> {
  final _controller = Get.put(SettingPageController());
  final _formKey = GlobalKey<FormState>();  // formKey 추가

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('닉네임 설정'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), // 화면을 터치하면 키보드 숨기기
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Form(
                key: _formKey,  // formKey 수정
                child: Column(
                  children: [
                    TextFormField(
                      controller: _controller.nicknameController,
                      decoration: InputDecoration(
                        labelText: '닉네임',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '닉네임을 입력해주세요';
                        }
                        if (value.length < 2 || value.length > 10) {
                          return '닉네임은 2자 이상 10자 이하로 입력해주세요';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {  // formKey 수정
                            bool isUnique = await _controller.isUniqueNickname(_controller.nicknameController.text);
                            bool isAllowed = await _controller.isNicknameChangeAllowed();

                            if (!isUnique) {
                              Get.snackbar(
                                '닉네임 변경 실패',
                                '이미 사용 중인 닉네임입니다.',
                                snackPosition: SnackPosition.BOTTOM,
                              );
                              return;
                            }

                            if (!isAllowed) {
                              Get.snackbar(
                                '닉네임 변경 실패',
                                '닉네임은 30일에 한 번만 변경할 수 있습니다.',
                                snackPosition: SnackPosition.BOTTOM,
                              );
                              return;
                            }

                            _controller.changeNickname();
                          }
                        },
                        child: Text('닉네임 설정'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red, // primary를 backgroundColor로 수정
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      '※ 닉네임을 설정하면 30일간 변경할 수 없습니다.',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
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
