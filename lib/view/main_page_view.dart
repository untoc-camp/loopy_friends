import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/controller/main_page_controller.dart';

class MainPageVIew extends StatelessWidget {
  MainPageVIew({super.key});

  final _controller = Get.put(MainPageController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: MediaQuery.of(context).size.height - 120,
        child: _controller.testListValue.length > 0
            ? ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _controller.testListValue.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: SizedBox(
                      height: 20,
                      child: Text(_controller.testListValue[index].name),
                    ),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
