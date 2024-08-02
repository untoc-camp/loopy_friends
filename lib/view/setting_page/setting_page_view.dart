import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/components/bottom_navigation/bottom_navigation_bar_controller.dart';
import 'package:loopy_friends/controller/my_written_post_controller.dart';
import 'package:loopy_friends/controller/setting_page_controller.dart';

class SettingPageView extends StatelessWidget {
  SettingPageView({super.key});

  final SettingPageController _controller = Get.put(SettingPageController());
  final _bottomNavController = Get.put(MyBottomNavgationBarController());
  final MyWrittenPostController myWrittenPostController = Get.put(MyWrittenPostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '━━━━⊱⋆ 내 정보 ⋆⊰━━━━',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '내 프로필',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          width: 150,
                          child: Obx(() => ProfileCard(
                                name: _controller.realname.value,
                                details: '이름',
                                profileColor: Color(0xFFB1589D),
                              )),
                        ),
                        SizedBox(width: 12),
                        SizedBox(
                          width: 200,
                          child: Obx(() => ProfileCard(
                                name: _controller.nickname.value,
                                details: '닉네임',
                                profileColor: Color(0xFF6ABFC8),
                              )),
                        ),
                        SizedBox(width: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ButtonTile(
              icon: Icons.account_circle,
              title: '닉네임 변경',
              onPressed: () {
                Get.toNamed('/nicknameChange');
              },
            ),
            ButtonTile(
              icon: Icons.lock,
              title: '비밀번호 변경',
              onPressed: () {
                Get.toNamed('/pwdChange');
              },
            ),
            ButtonTile(
              icon: Icons.article,
              title: '작성한 글 보기',
              onPressed: () {
                myWrittenPostController.loadMyPosts();
                Get.toNamed('/mywrite');
              },
            ),
            Divider(),
            ButtonTile(
              icon: Icons.block,
              title: '이용 제한 내역',
              onPressed: () {
                Get.toNamed('/usage_restriction');
              },
            ),
            ButtonTile(
              icon: Icons.rule,
              title: '커뮤니티 이용규칙',
              onPressed: () {
                Get.toNamed('/community_rules');
              },
            ),
            ButtonTile(
              icon: Icons.dark_mode,
              title: '다크 모드',
              subtitle: '시스템 기본값',
              onPressed: () {
                Get.toNamed('/dark_mode');
              },
            ),
            ButtonTile(
              icon: Icons.notifications,
              title: '알림 설정',
              onPressed: () {
                Get.toNamed('/notification_settings');
              },
            ),
            Divider(),
            ButtonTile(
              icon: Icons.info,
              title: '앱 버전',
              subtitle: '1.0.0',
              onPressed: () {},
            ),
            ButtonTile(
              icon: Icons.help,
              title: '문의하기',
              onPressed: () {
                Get.toNamed('/contact_collection');
              },
            ),
            ButtonTile(
              icon: Icons.announcement,
              title: '공지사항',
              onPressed: () {
                Get.toNamed('/announcements');
              },
            ),
            ButtonTile(
              icon: Icons.privacy_tip,
              title: '서비스 이용약관',
              onPressed: () {
                Get.toNamed('/terms_of_service');
              },
            ),
            ButtonTile(
              icon: Icons.security,
              title: '개인정보 처리방침',
              onPressed: () {
                Get.toNamed('/privacy_policy');
              },
            ),
            ButtonTile(
              icon: Icons.code,
              title: '오픈소스 라이선스',
              onPressed: () {
                Get.toNamed('/open_source_license');
              },
            ),
            Divider(),
            ButtonTile(
              icon: Icons.settings,
              title: '정보 동의 설정',
              onPressed: () {
                Get.toNamed('/consent_settings');
              },
            ),
            ButtonTile(
              icon: Icons.logout,
              title: '로그아웃',
              onPressed: () {
                _controller.logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String details;
  final Color profileColor;

  const ProfileCard({
    super.key,
    required this.name,
    required this.details,
    required this.profileColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: profileColor,
            child: Icon(Icons.person, color: Colors.white, size: 40),
          ),
          SizedBox(height: 8.0),
          Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(details, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

class ButtonTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onPressed;

  const ButtonTile({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent, // 배경색을 투명하게 설정
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: Colors.transparent), // 테두리를 투명하게 설정
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey[700]),
            SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 16.0, color: Colors.black)),
                if (subtitle != null) Text(subtitle!, style: TextStyle(fontSize: 12.0, color: Colors.grey[700])),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
