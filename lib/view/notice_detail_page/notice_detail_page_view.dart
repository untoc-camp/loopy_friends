import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/model/notice_list_model.dart';

class DetailPageView extends StatelessWidget {
  const DetailPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final Notice notice = Get.arguments as Notice;

    return Scaffold(
        appBar: AppBar(
          title: Text(notice.title),
        ),
        backgroundColor: Color.fromARGB(255, 212, 221, 232),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
              child: Container(
                  width: 340,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(notice.title,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(height: 10),
                        Text(notice.date,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )),
                        SizedBox(height: 10),
                        Text(notice.detail,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                      ])))),
        ));
  }
}
