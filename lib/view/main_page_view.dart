import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/constants/colors.dart';
import 'package:loopy_friends/controller/main_page_controller.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}

class MainPageVIew extends StatelessWidget {
  MainPageVIew({super.key});

  final _controller = Get.put(MainPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 246, 246),
      body: Padding(
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
                Stack(
                  children: [
                    const Icon(
                      Icons.notifications_none_outlined,
                      size: 35,
                    ),
                    Positioned(
                        right: 6,
                        top: 4,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Center(
                              child: Text(
                            "3",
                            style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
                          )),
                        ))
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  icon: Icon(Icons.account_circle, size: 35),
                  onPressed: () {
                    Get.toNamed('/setting');
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
                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: TextColor, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width - 16,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 8,
                      children: List.generate(5, (index) {
                        return Container(
                          height: 100,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 241, 241, 241),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Color.fromARGB(255, 215, 215, 215)),
                          ),
                          child: Center(
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "${index + 1}번째 공지사항",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ))),
                        );
                      }),
                    )),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Wrap(
                  spacing: 30,
                  children: [
                    const SizedBox(
                      width: 1,
                    ),
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
                      "https://www.pusan.ac.kr/pusan/index.do",
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "커뮤니티",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: TextColor, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/community');
                  },
                  child: Text(
                    "바로 가기",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: TextColor, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: 200,
              width: 340,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  "커뮤니티 콘텐츠",
                  style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
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
