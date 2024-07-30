import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/components/bottom_navigation/bottom_navigation_bar_controller.dart';
import 'package:loopy_friends/constants/colors.dart';
import 'package:loopy_friends/controller/main_page_controller.dart';
import 'package:loopy_friends/controller/notice_list_controller.dart'; // NoticeController import 추가
import 'package:loopy_friends/view/notice_detail_page/notice_detail_page_view.dart'; // DetailPageView import 추가
import 'package:url_launcher/url_launcher.dart';
import 'package:loopy_friends/controller/write_page_controller.dart';
import 'package:loopy_friends/model/notice_list_model.dart';
import 'package:loopy_friends/view/notice_detail_page/notice_recruit_view_page.dart';

Future<void> launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}

class MainPageView extends StatelessWidget {
  MainPageView({super.key});

  final _controller = Get.put(MainPageController());
  final NoticeTop5Controller noticeController = Get.put(NoticeTop5Controller());
  final _bottomNavController = Get.put(MyBottomNavgationBarController());
  final PostController postController = Get.put(PostController());

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
    final data = noticeController.noticeTop5List;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 246, 246),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/selon_Logo_with_text.png",
                  height: 45,
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(Icons.account_circle, size: 35),
                  onPressed: () {
                    _bottomNavController.changeIndex(3);
                  },
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "공지",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(color: TextColor, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 5),
                  IconButton(
                      onPressed: () {
                        noticeController.fetchNoticeTop5();
                      },
                      icon: Icon(Icons.refresh, size: 20))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width - 16,
                child: Obx(() {
                  if (data.isEmpty) {
                    return Center(
                      child: Text(
                        "공지사항이 없습니다.",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    );
                  }

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 8,
                      children: List.generate(5, (index) {
                        // final reversedIndex = data.length - 1 - index;
                        DateTime? deadline;

                        if (data[index].deadline.isNotEmpty && data[index].deadline != '없음') {
                          try {
                            deadline = parseDeadline(data[index].deadline);
                          } catch (e) {
                            print('Date parsing error: $e');
                          }
                        }
                        return GestureDetector(
                          onTap: () {
                            if (data.isNotEmpty && index >= 0) {
                              final notice = Notice.fromNoticeTop5(data[index]);
                              if (data[index].deadline != '없음') {
                                Get.to(() => RecruitPageView(), arguments: notice);
                              } else {
                                Get.to(() => DetailPageView(), arguments: notice);
                              }
                            }
                          },
                          child: Container(
                            height: 100,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 241, 241, 241),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Color.fromARGB(255, 215, 215, 215)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  if (data[index].deadline != '없음')
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            data.isNotEmpty && index >= 0 ? (data[index].title.length > 16 ? "${data[index].title.substring(0, 16)}..." : data[index].title) : "Invalid Error",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          calculateDday(deadline), // 기한 텍스트
                                          style: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )
                                  else
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            data.isNotEmpty && index >= 0 ? (data[index].title.length > 16 ? "${data[index].title.substring(0, 16)}..." : data[index].title) : "Invalid Error",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIconColumn(
                  context,
                  "assets/PNU_logo.png",
                  "부산대\n홈",
                  "https://pusan.ac.kr/kor/Main.do",
                ),
                _buildIconColumn(
                  context,
                  "assets/Onestop_logo.png",
                  "부산대\n학지시",
                  "https://onestop.pusan.ac.kr/login",
                ),
                _buildIconColumn(
                  context,
                  "assets/CSE_logo.png",
                  "부산대\n정컴",
                  "https://cse.pusan.ac.kr/cse/index.do",
                ),
                _buildIconColumn(
                  context,
                  "assets/Schedule_logo.png",
                  "학사\n일정",
                  "https://www.pusan.ac.kr/kor/CMS/Haksailjung/view.do?mCode=MN076",
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "커뮤니티",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(color: TextColor, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      _bottomNavController.changeIndex(2);
                    },
                    child: Text(
                      "바로 가기",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TextColor, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Container(
                height: 200,
                width: 340,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Obx(() {
                    var reversedPosts = postController.posts.reversed.toList();
                    return ListView.builder(
                      itemCount: reversedPosts.length,
                      itemBuilder: (context, index) {
                        final post = reversedPosts[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _bottomNavController.changeIndex(2);
                              },
                              child: Text(
                                post.title,
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Divider(
                              thickness: 0.5,
                              color: Colors.blueGrey,
                            ),
                          ],
                        );
                      },
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildIconColumn(BuildContext context, String image, String title, String url) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: () {
        launchURL(url);
      },
      child: Column(
        children: [
          Image.asset(
            image,
            height: 50,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TextColor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
