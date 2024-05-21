import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:loopy_friends/controller/test_1_controller.dart';

class Test1View extends StatelessWidget {
  Test1View({super.key});

  final _controller = Get.put(Test1Controller());
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 800,
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed("/test");
                  },
                  child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text("data"))),
                ),
              ),
              Text("data"),
              ElevatedButton(onPressed: () {}, child: Text("data")),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - 200,
          child: SingleChildScrollView(
            child: Column(children: [
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
            ]),
          ),
        ),
        Obx(
          () => Column(
            children: [
              Text("${_controller.countValue}"),
              ElevatedButton(
                  onPressed: () {
                    _controller.increment();
                  },
                  child: Text("Increment")),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                width: 200,
                height: 40,
                child: TextFormField(
                  controller: _controller.textController,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    _controller.changeName();
                  },
                  child: Text("Change Name")),
              Text("${_controller.nameValue}")
            ],
          ),
        )
      ],
    );
  }
}
