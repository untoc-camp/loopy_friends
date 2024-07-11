import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPageView extends StatelessWidget {
  const SettingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_sharp),
                    onPressed: () {
                      Get.toNamed('/main');
                    },
                  ),
                  SizedBox(width: 8),
                  Text('내 프로필', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(width: 16),
                    Container(
                      width: 300, // 원하는 너비로 설정
                      child: ProfileCard(
                        name: '이름',
                        details: '김아무개',
                      ),
                    ),
                    SizedBox(width: 16),
                    Container(
                      width: 300, // 원하는 너비로 설정
                      child: ProfileCard(
                        name: '닉네임',
                        details: 'superman',
                      ),
                    ),
                    SizedBox(width: 16),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('아이디'),
              subtitle: Text('user id'),
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('비밀번호 변경'),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('이메일 변경'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.block),
              title: Text('이용 제한 내역'),
            ),
            ListTile(
              leading: Icon(Icons.rule),
              title: Text('커뮤니티 이용규칙'),
            ),
            ListTile(
              leading: Icon(Icons.dark_mode),
              title: Text('다크 모드'),
              subtitle: Text('시스템 기본값'),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('알림 설정'),
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('암호/지문 잠금'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('앱 버전'),
              subtitle: Text('1.0.0'),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('문의하기'),
            ),
            ListTile(
              leading: Icon(Icons.announcement),
              title: Text('공지사항'),
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip),
              title: Text('서비스 이용약관'),
            ),
            ListTile(
              leading: Icon(Icons.security),
              title: Text('개인정보 처리방침'),
            ),
            ListTile(
              leading: Icon(Icons.child_care),
              title: Text('청소년 보호정책'),
            ),
            ListTile(
              leading: Icon(Icons.code),
              title: Text('오픈소스 라이선스'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('정보 동의 설정'),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('회원 탈퇴'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('로그아웃'),
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

  const ProfileCard({
    Key? key,
    required this.name,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.orange,
            child: Icon(Icons.person, color: Colors.white, size: 40),
          ),
          SizedBox(height: 8.0),
          Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 4.0),
          Text(details, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}