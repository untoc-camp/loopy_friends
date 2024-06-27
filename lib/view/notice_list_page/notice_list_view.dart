import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/model/notice_list_model.dart';
import 'package:loopy_friends/view/notice_detail_page/notice_detail_page_view.dart';

class NoticeListView extends StatelessWidget {
  final RxList<Notice> data;

  const NoticeListView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 246, 246, 246),
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Obx(() {
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final reversedIndex = data.length - 1 - index;
                  return GestureDetector(
                      onTap: () {
                        Get.to(() => DetailPageView(), arguments: data[reversedIndex]);
                      },
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 3.0),
                          child: Container(
                            height: 100,
                            width: 340,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 212, 221, 232),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data[reversedIndex].title,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    SizedBox(height: 10),
                                    Text(data[reversedIndex].date,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ))
                                  ],
                                )),
                          )));
                });
          }),
        ));
  }
}
