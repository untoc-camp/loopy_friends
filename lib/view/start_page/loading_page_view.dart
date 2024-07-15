import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/controller/loading_page_controller.dart';

class LoadingPageView extends StatelessWidget {
  LoadingPageView({super.key});

  final _controller = Get.put(LoadingPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // 배경색을 추가하여 로딩 화면을 더 깔끔하게 보이게 합니다.
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(), // 돌아가는 동그라미
            SizedBox(height: 20), // 동그라미와 텍스트 사이에 간격을 줍니다.
            Text(
              '로딩 중...',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
