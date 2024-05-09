import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/controller/main_page_controller.dart';

class MainPageVIew extends StatelessWidget {
  MainPageVIew({super.key});

  final _controller = Get.put(MainPageController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 100,
      child: Obx(
        () => Column(
          children: [
            ListView.builder(
              itemCount: _controller.testListValue.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_controller.testListValue[index].name),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
