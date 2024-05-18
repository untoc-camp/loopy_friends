import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:loopy_friends/controller/test_controller.dart';

class TestView extends StatelessWidget {
  TestView({super.key});

  final _controller = Get.put(TestController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 20,
        ),
        Column(
          // 왼쪽 사이드바
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Instagram",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.home),
                      SizedBox(
                        width: 10,
                      ),
                      Text("홈")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(
                        width: 10,
                      ),
                      Text("검색")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.add_box),
                      SizedBox(
                        width: 10,
                      ),
                      Text("탐색 탭")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.movie),
                      SizedBox(
                        width: 10,
                      ),
                      Text("릴스")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.movie),
                      SizedBox(
                        width: 10,
                      ),
                      Text("릴스")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.movie),
                      SizedBox(
                        width: 10,
                      ),
                      Text("릴스")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.movie),
                      SizedBox(
                        width: 10,
                      ),
                      Text("릴스")
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 160,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(Icons.movie),
                      SizedBox(
                        width: 10,
                      ),
                      Text("릴스")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.movie),
                      SizedBox(
                        width: 10,
                      ),
                      Text("릴스")
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 200,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                    Text("data"),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
