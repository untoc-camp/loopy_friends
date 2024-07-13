import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // 뒤로가기 버튼을 눌렀을 때 이전 페이지로 이동
          },
        ),
        title: Text('개인정보 처리방침'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('1. 개인정보 처리방침', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '개인정보 처리방침은 회사가 이용자의 개인정보를 처리함에 있어 준수해야 할 사항을 규정한 것입니다. 회사는 이용자의 개인정보를 중요시하며, 개인정보보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률을 준수하고 있습니다.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text('2. 수집하는 개인정보의 항목', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '회사는 서비스 제공을 위하여 다음과 같은 개인정보를 수집하고 있습니다.\n'
              '- 필수항목: 이름, 생년월일, 성별, 로그인ID, 비밀번호, 자택 전화번호, 휴대전화번호, 이메일, 자택주소, 서비스 이용기록, 접속 로그, 쿠키, 접속 IP 정보\n'
              '- 선택항목: 개인 맞춤 서비스 제공을 위한 항목',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text('3. 개인정보의 수집방법', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '회사는 다음과 같은 방법으로 개인정보를 수집합니다.\n'
              '- 홈페이지, 서면양식, 전화/팩스를 통한 회원가입, 상담 게시판, 경품 행사 응모, 배송 요청\n'
              '- 제휴사로부터의 제공\n'
              '- 생성정보 수집 툴을 통한 수집',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text('4. 개인정보의 처리 및 보유 기간', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '회사는 법령에 따른 개인정보 보유·이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다.\n'
              '각각의 개인정보 처리 및 보유 기간은 다음과 같습니다.\n'
              '- 회원가입 정보: 회원 탈퇴 시까지\n'
              '- 대금 결제 및 재화 등의 공급에 관한 기록: 5년\n'
              '- 소비자의 불만 또는 분쟁 처리에 관한 기록: 3년',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text('5. 개인정보의 제3자 제공', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '회사는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.\n'
              '- 이용자들이 사전에 동의한 경우\n'
              '- 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text('6. 개인정보처리 위탁', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '회사는 서비스 이행을 위해 아래와 같이 개인정보 처리 업무를 외부 전문업체에 위탁하여 운영하고 있습니다.\n'
              '- 수탁업체: [수탁업체명]\n'
              '- 위탁업무 내용: [위탁업무 내용]',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text('7. 정보주체의 권리, 의무 및 행사방법', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '이용자는 개인정보주체로서 다음과 같은 권리를 행사할 수 있습니다.\n'
              '1) 개인정보 열람요구\n'
              '2) 오류 등이 있을 경우 정정 요구\n'
              '3) 삭제요구\n'
              '4) 처리정지 요구\n'
              '권리 행사는 개인정보보호법 시행령에 따라 서면, 전자우편 등을 통하여 하실 수 있으며, 회사는 이에 대해 지체 없이 조치하겠습니다.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text('8. 처리하는 개인정보의 항목', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '회사는 다음의 개인정보 항목을 처리하고 있습니다.\n'
              '- 필수항목: 이름, 생년월일, 성별, 로그인ID, 비밀번호, 자택 전화번호, 휴대전화번호, 이메일, 자택주소, 서비스 이용기록, 접속 로그, 쿠키, 접속 IP 정보\n'
              '- 선택항목: 개인 맞춤 서비스 제공을 위한 항목',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text('9. 개인정보의 안전성 확보 조치', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '회사는 개인정보보호법 제29조에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.\n'
              '- 개인정보 암호화\n'
              '- 해킹 등에 대비한 대책\n'
              '- 개인정보에 대한 접근 제한\n'
              '- 접속기록의 보관 및 위변조 방지',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text('10. 개인정보 자동 수집 장치의 설치·운영 및 거부에 관한 사항', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '회사는 이용자에게 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 쿠키(cookie)를 사용합니다.\n'
              '이용자는 쿠키 설치에 대한 선택권을 가지고 있으며, 웹 브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나 쿠키가 저장될 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text('11. 개인정보에 대한 열람청구', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '이용자는 개인정보 보호법 제35조에 따른 개인정보의 열람 청구를 할 수 있습니다. 회사는 정보주체의 개인정보 열람청구가 신속하게 처리되도록 노력하겠습니다.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text('12. 개인정보 보호책임자 및 담당자', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '회사는 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.\n'
              '- 개인정보 보호책임자: [성명]\n'
              '- 직책: [직책]\n'
              '- 연락처: [전화번호], [이메일], [팩스번호]',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text('13. 기타', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '회사는 이용자의 개인정보를 보호하기 위하여 최선을 다하고 있습니다. 개인정보 처리방침에 대한 변경 사항은 홈페이지 공지사항을 통하여 공지할 것입니다.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
