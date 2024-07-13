import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({Key? key}) : super(key: key);

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
        title: Text('서비스 이용약관'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('제1조(목적)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '이 약관은 주식회사 무브먼트(이하 "회사"라 한다)가 제공하는 웹사이트 및 모바일 애플리케이션 서비스(이하 "서비스"라 한다)의 이용과 관련하여 회사와 이용자의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text('제2조(정의)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '1. "서비스"라 함은 회사가 제공하는 무브먼트 및 무브먼트 관련 제반 서비스를 의미합니다.\n'
              '2. "이용자"라 함은 이 약관에 따라 회사가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.\n'
              '3. "회원"이라 함은 회사와 서비스 이용계약을 체결하고 이용자 아이디(ID)를 부여받은 자를 말합니다.\n'
              '4. "비회원"이라 함은 회원에 가입하지 않고 회사가 제공하는 서비스를 이용하는 자를 말합니다.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text('제3조(약관의 명시와 개정)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '1. 회사는 이 약관의 내용을 이용자가 쉽게 알 수 있도록 서비스 초기 화면에 게시합니다.\n'
              '2. 회사는 "약관의 규제에 관한 법률", "정보통신망 이용촉진 및 정보보호 등에 관한 법률"(이하 "정보통신망법") 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.\n'
              '3. 회사가 약관을 개정할 경우에는 적용 일자 및 개정 사유를 명시하여 현행 약관과 함께 서비스 내 공지사항에 그 적용일자 7일 전부터 적용일 이후 상당한 기간 동안 공지합니다. 다만, 회원에게 불리한 약관의 개정의 경우에는 공지 외에 일정 기간 회원의 전자우편 주소로 전자우편을 발송하여 통지합니다.\n'
              '4. 회원이 개정 약관의 적용에 동의하지 않는 경우 회사 또는 회원은 이용계약을 해지할 수 있습니다. 다만, 회사는 이러한 사실을 회원에게 통지하면서 약관 개정에 대한 동의를 구하고, 회원이 명시적으로 거부 의사를 밝히지 않는 경우에는 개정 약관에 동의한 것으로 간주합니다.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text('제4조(서비스의 제공 및 변경)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '1. 회사는 다음과 같은 서비스를 제공합니다:\n'
              '   - 정보 제공 서비스\n'
              '   - 커뮤니티 서비스\n'
              '   - 기타 회사가 추가 개발하거나 다른 회사와의 제휴 계약 등을 통해 회원에게 제공할 일체의 서비스\n'
              '2. 회사는 서비스의 기술적 사양의 변경 등의 경우에는 서비스의 내용을 변경할 수 있습니다. 이 경우 변경된 서비스의 내용 및 제공 일자를 명시하여 현재의 서비스 내용을 게시한 곳에 즉시 공지합니다.\n'
              '3. 회사는 서비스의 변경 사항을 공지하거나 회원에게 통지함으로써 약관에서 정한 바에 따라 변경된 서비스의 제공을 할 수 있습니다.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text('제5조(서비스의 중단)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '1. 회사는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.\n'
              '2. 회사는 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대해 배상합니다. 단, 회사가 고의 또는 과실이 없음을 입증한 경우에는 그러하지 아니합니다.\n'
              '3. 회사는 서비스의 제공을 위해 회사와 이용계약을 체결한 제3자의 사유로 인하여 서비스를 제공할 수 없는 경우 서비스의 전부 또는 일부를 중단할 수 있습니다. 이 경우 회사는 이용자에게 사전 통지합니다.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text('제6조(회원가입)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '1. 이용자는 회사가 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로써 회원가입을 신청합니다.\n'
              '2. 회사는 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다:\n'
              '   - 가입신청자가 이 약관 제7조 제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 회사의 회원 재가입 승낙을 얻은 경우에는 예외로 한다.\n'
              '   - 등록 내용에 허위, 기재누락, 오기가 있는 경우\n'
              '   - 기타 회원으로 등록하는 것이 회사의 기술상 현저히 지장이 있다고 판단되는 경우\n'
              '3. 회원가입 계약의 성립 시기는 회사의 승낙이 회원에게 도달한 시점으로 합니다.\n'
              '4. 회원은 등록사항에 변경이 있는 경우, 즉시 전자우편 또는 기타 방법으로 회사에 대하여 그 변경사항을 알려야 합니다.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text('제7조(회원 탈퇴 및 자격 상실 등)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '1. 회원은 회사에 언제든지 탈퇴를 요청할 수 있으며 회사는 즉시 회원탈퇴를 처리합니다.\n'
              '2. 회원이 다음 각 호의 사유에 해당하는 경우, 회사는 회원자격을 제한 및 정지시킬 수 있습니다:\n'
              '   - 가입 신청 시에 허위 내용을 등록한 경우\n'
              '   - 다른 사람의 서비스 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우\n'
              '   - 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우\n'
              '3. 회사가 회원 자격을 제한ㆍ정지 시킨 후 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 회사는 회원 자격을 상실시킬 수 있습니다.\n'
              '4. 회사가 회원 자격을 상실시키는 경우에는 회원 등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원 등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text('제8조(회원의 ID 및 비밀번호에 대한 의무)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '1. ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.\n'
              '2. 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안 됩니다.\n'
              '3. 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 회사에 통보하고 회사의 안내가 있는 경우에는 그에 따라야 합니다.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text('제9조(회원에 대한 통지)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '1. 회사가 회원에 대한 통지를 하는 경우, 회원이 회사와 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.\n'
              '2. 회사는 불특정다수 회원에 대한 통지의 경우 1주일 이상 서비스 내 공지사항에 게시함으로서 개별 통지에 갈음할 수 있습니다.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text('제10조(회사의 의무)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '1. 회사는 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 서비스를 제공하는데 최선을 다하여야 합니다.\n'
              '2. 회사는 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함) 보호를 위한 보안 시스템을 갖추어야 합니다.\n'
              '3. 회사는 서비스 제공과 관련하여 알게 된 회원의 개인정보를 본인의 승낙 없이 제3자에게 누설, 제공하지 않습니다. 다만, 관계법령에 의한 경우는 예외로 합니다.\n'
              '4. 회사는 회원이 수신 동의를 하지 않은 영리 목적의 광고성 전자우편, SMS 문자메시지 등을 발송하지 않습니다.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text('제11조(회원의 의무)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '1. 회원은 다음 행위를 하여서는 안 됩니다:\n'
              '   - 신청 또는 변경 시 허위 내용의 등록\n'
              '   - 타인의 정보 도용\n'
              '   - 회사가 게시한 정보의 변경\n'
              '   - 회사가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시\n'
              '   - 회사와 기타 제3자의 저작권 등 지적재산권에 대한 침해\n'
              '   - 회사 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위\n'
              '   - 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 서비스에 공개 또는 게시하는 행위\n'
              '   - 회사의 동의 없이 영리를 목적으로 서비스를 사용하는 행위\n'
              '   - 기타 불법적이거나 부당한 행위\n'
              '2. 회원은 관계법령, 이 약관의 규정, 이용 안내 및 서비스와 관련하여 공지한 주의사항, 회사가 통지하는 사항 등을 준수하여야 하며, 기타 회사의 업무에 방해되는 행위를 하여서는 안 됩니다.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text('제12조(서비스 이용계약 해지 및 이용제한)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '1. 회원이 이용계약을 해지하고자 하는 때에는 회원 본인이 서비스 내의 회원탈퇴 기능을 이용하여 이용계약 해지를 신청할 수 있습니다.\n'
              '2. 회사는 회원이 제11조 회원의 의무를 위반한 경우 서비스 이용을 제한하거나 일방적으로 본 계약을 해지할 수 있습니다.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text('제13조(책임제한)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '1. 회사는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.\n'
              '2. 회사는 회원의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지 않습니다.\n'
              '3. 회사는 회원이 서비스와 관련하여 게재한 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 관하여는 책임을 지지 않습니다.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text('제14조(분쟁해결)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '1. 회사는 회원이 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상 처리하기 위하여 피해보상처리기구를 설치ㆍ운영합니다.\n'
              '2. 회사는 회원으로부터 제출되는 불만사항 및 의견을 신속하게 처리합니다. 다만, 신속한 처리가 곤란한 경우는 회원에게 그 사유와 처리 일정을 즉시 통보합니다.\n'
              '3. 회사와 회원 간에 발생한 전자상거래 분쟁과 관련하여 회원의 피해구제 신청이 있는 경우 공정거래위원회 또는 시ㆍ도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text('제15조(재판권 및 준거법)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '1. 회사와 회원 간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 회원의 주소에 의하고, 주소가 없는 경우 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 회원의 주소 또는 거소가 분명하지 아니한 경우의 관할법원은 민사소송법에 따라 정합니다.\n'
              '2. 회사와 회원 간에 제기된 전자상거래 소송에는 한국법을 적용합니다.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
