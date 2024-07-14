import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class UsageRestrictionPage extends StatelessWidget {
  const UsageRestrictionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // 뒤로가기 버튼을 눌렀을 때 이전 페이지로 이동
          },
        ),
        title: Text('이용 제한 내역'),
      ),
      body: SingleChildScrollView(

      ),
    );
}
}