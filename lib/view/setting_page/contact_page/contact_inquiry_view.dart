import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/controller/setting_page_controller.dart';

class ContactInquiryView extends StatefulWidget {
  const ContactInquiryView({super.key});

  @override
  _ContactInquiryViewState createState() => _ContactInquiryViewState();
}

class _ContactInquiryViewState extends State<ContactInquiryView> {
  final _formKey = GlobalKey<FormState>();
  final _controller = Get.put(SettingPageController());  // 컨트롤러 인스턴스 추가

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('문의하기'),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), // 화면을 터치하면 키보드 숨기기
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _controller.inquiryMessageController,  // 컨트롤러에 있는 inquiryMessageController 사용
                      maxLines: 10,  // 텍스트 창을 키우기 위해 maxLines 설정
                      decoration: InputDecoration(
                        labelText: '문의 내용',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '문의 내용을 입력해주세요';
                        }
                        if (value.length < 10) {
                          return '문의 내용은 10자 이상이어야 합니다';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _controller.sendContactInquiry();  // 문의 내용을 전송하는 메서드 호출
                            Get.back();
                          }
                        },
                        child: Text('문의 내용 전송'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red, 
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      '※ 문의 내용은 10자 이상이어야 합니다.',
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
