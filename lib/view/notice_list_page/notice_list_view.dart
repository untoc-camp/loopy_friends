import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/controller/notice_list_controller.dart';
import 'package:loopy_friends/model/notice_list_model.dart';
import 'package:loopy_friends/view/notice_detail_page/notice_detail_page_view.dart';

class NoticeListView extends StatelessWidget {
  final NoticeController noticeController = Get.put(NoticeController());
  final String category;

  NoticeListView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    RxList<Notice> data;
    switch (category) {
      case 'totalCouncil':
        data = noticeController.totalCouncilData;
        break;
      case 'departmentCouncil':
        data = noticeController.departmentCouncilData;
        break;
      case 'departmentNotice':
        data = noticeController.departmentNoticeData;
        break;
      case 'applyRecruit':
        data = noticeController.applyRecruitData;
        break;
      default:
        throw Exception('Invalid category');
    }

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
