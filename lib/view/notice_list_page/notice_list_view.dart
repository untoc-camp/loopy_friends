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
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Obx(() {
          return RefreshIndicator(
            onRefresh: _refreshData,
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final reversedIndex = data.length - 1 - index;
                DateTime? deadline;

                if (data[reversedIndex].deadline.isNotEmpty && data[reversedIndex].deadline != '없음') {
                  try {
                    deadline = parseDeadline(data[reversedIndex].deadline);
                  } catch (e) {
                    print('Date parsing error: $e');
                  }
                }
                return GestureDetector(
                  onTap: () {
                    if (data[reversedIndex].deadline != '없음') {
                      Get.to(() => RecruitPageView(), arguments: data[reversedIndex]);
                    } else {
                      Get.to(() => DetailPageView(), arguments: data[reversedIndex]);
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 13),
                    width: double.infinity,
                    constraints: BoxConstraints(minHeight: 100),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(2, 5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data[reversedIndex].title,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          if (data[reversedIndex].deadline != '없음')
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    data[reversedIndex].created_at,
                                    style: TextStyle(
                                      color: Color(0xFF5C5F64),
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Text(
                                  calculateDday(deadline),
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          else
                            Text(
                              data[reversedIndex].created_at,
                              style: TextStyle(
                                color: Color(0xFF5C5F64),
                                fontSize: 12,
                              ),
                            ),
                        ],
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
