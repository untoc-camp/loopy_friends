import 'package:flutter/material.dart';

<<<<<<< Updated upstream
class SettingController extends GetxController {
  // 여기에 필요한 상태 변수와 메서드 추가
}

class SettingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('내 정보'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.arrow_back_sharp),
                  SizedBox(width: 8),
                  Text('내 정보', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              color: Colors.black,
              width: double.infinity,
              height: 400,
              margin: const EdgeInsets.all(8.0),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.orange,
                child: Icon(Icons.person, color: Colors.white, size: 40),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('이름', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('부산대 정보컴퓨터공학부'),
                  Text('N학번 / 재학생'),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('아이디'),
              subtitle: Text('0122heart'),
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
              subtitle: Text('7.0.28'),
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
=======
class SettingView extends StatelessWidget {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [Icon(Icons.arrow_back_sharp), Text('내 정보')],
        ),
        Container(
          color: Colors.black,
          width: double.infinity,
          height: 400,
          margin: const EdgeInsets.all(8.0),
        )
      ],
>>>>>>> Stashed changes
    );
  }
}
