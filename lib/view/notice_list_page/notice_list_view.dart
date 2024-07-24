import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/controller/notice_list_controller.dart';
import 'package:loopy_friends/model/notice_list_model.dart';
import 'package:loopy_friends/view/notice_detail_page/notice_detail_page_view.dart';
import 'package:loopy_friends/view/notice_detail_page/notice_recruit_view_page.dart';
import 'package:intl/intl.dart';

class NoticeListView extends StatelessWidget {
  final NoticeController noticeController = Get.put(NoticeController());
  final String category;

  NoticeListView({super.key, required this.category});

  Future<void> _refreshData() async {
    noticeController.refreshData(category);
  }

  String calculateDday(DateTime? deadline) {
    if (deadline == null) {
      return '무기한';
    }
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final targetDate = DateTime(deadline.year, deadline.month, deadline.day);
    final difference = targetDate.difference(today).inDays;
    if (difference < 0) {
      return '마감';
    } else if (difference == 0) {
      return 'D-day';
    } else {
      return 'D-$difference';
    }
  }

  DateTime? parseDeadline(String deadline) {
    try {
      int year = int.parse(deadline.substring(0, 4));
      int month = int.parse(deadline.substring(4, 6));
      int day = int.parse(deadline.substring(6, 8));
      return DateTime(year, month, day);
    } catch (e) {
      print('Date parsing error: $e');
      return null;
    }
  }

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
          return RefreshIndicator(
            onRefresh: _refreshData,
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final reversedIndex = data.length - 1 - index;
                DateTime? deadline;

                if (category == 'applyRecruit' && data[reversedIndex].deadline.isNotEmpty && data[reversedIndex].deadline != '없음') {
                  try {
                    deadline = parseDeadline(data[reversedIndex].deadline);
                  } catch (e) {
                    print('Date parsing error: $e');
                  }
                }
                return GestureDetector(
                  onTap: () {
                    if (category == 'applyRecruit') {
                      Get.to(() => RecruitPageView(), arguments: data[reversedIndex]);
                    } else {
                      Get.to(() => DetailPageView(), arguments: data[reversedIndex]);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 3.0),
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(minHeight: 100),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 212, 221, 232),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (category == 'applyRecruit' && data[reversedIndex].deadline != '없음')
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    data[reversedIndex].title,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    calculateDday(deadline),
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )
                            else
                              Text(
                                data[reversedIndex].title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            SizedBox(height: 10),
                            Text(
                              data[reversedIndex].created_at,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
