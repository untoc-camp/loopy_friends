import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/components/bottom_navigation/bottom_navigation_bar_controller.dart';
import 'package:loopy_friends/constants/colors.dart';
import 'package:loopy_friends/controller/main_page_controller.dart';
import 'package:loopy_friends/controller/notice_list_controller.dart'; // NoticeController import 추가
import 'package:loopy_friends/view/notice_detail_page/notice_detail_page_view.dart'; // DetailPageView import 추가
import 'package:url_launcher/url_launcher.dart';

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
              child: Text(
                "공지",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: TextColor, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width - 16,
                child: Obx(() {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 8,
                      children: List.generate(5, (index) {
                        final reversedIndex = data.length - 1 - index;
                        return GestureDetector(
                          onTap: () {
                            if (data.isNotEmpty && reversedIndex >= 0) {
                              Get.to(() => DetailPageView(),
                                  arguments: data[reversedIndex]);
                            }
                          },
                          child: Container(
                            height: 100,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 241, 241, 241),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: Color.fromARGB(255, 215, 215, 215)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          data.isNotEmpty && reversedIndex >= 0
                                              ? (data[reversedIndex]
                                                          .title
                                                          .length >
                                                      16
                                                  ? "${data[reversedIndex].title.substring(0, 16)}..."
                                                  : data[reversedIndex].title)
                                              : "Invalid Error",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        "D-2", // 기한 텍스트
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
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
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: TextColor, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      _bottomNavController.changeIndex(2);
                    },
                    child: Text(
                      "바로 가기",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: TextColor, fontWeight: FontWeight.bold),
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
                child: Center(
                  child: Text(
                    "커뮤니티 콘텐츠",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildIconColumn(
    BuildContext context, String image, String title, String url) {
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
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: TextColor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
