import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RulesOfCommunityPage extends StatelessWidget {
  const RulesOfCommunityPage({Key? key}) : super(key: key);

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
        title: Text('커뮤니티 이용규칙'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('커뮤니티 이용규칙 안내', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '커뮤니티 이용규칙은 정보컴퓨터공학부 학우분들이 서로 여러 정보를 공유하고 기분좋게 참여할 수 있는 커뮤니티를 만들기위해 제정되었습니다. 학우분들을 위해 운영되는 커뮤니티는 해당 커뮤니티 이용규칙에 의거하여 운영되므로, 커뮤니티 이용 전 반드시 모든 내용을 숙지하여야 합니다.\n'
              '방송통신심의위원회의 정보통신에 관한 심의규정, 현행 법률, 서비스 이용약관 및 커뮤니티 이용규칙을 위반하거나, 사회 통념 및 관련 법령을 기준으로 타 이용자에게 악영향을 끼치는 경우, 게시물이 삭제되고 커뮤니티 및 앱 서비스 이용이 제한될 수 있습니다.\n'
              '커뮤니티 이용규칙은 불법 행위, 각종 차별 및 혐오, 사회적 갈등 조장, 타인의 권리 침해, 다른 이용자에게 불쾌감을 주는 행위, 커뮤니티 유출 행위, 시스템 장애를 유발하는 비정상 행위 등 커뮤니티 분위기 형성과 운영에 악영향을 미치는 행위들을 제한하기 위해 지속적으로 개정될 예정입니다. 중대한 변경 사항이 있는 경우에는 공지사항을 통해 고지하므로 반드시 확인해주시기 바랍니다.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            Text('커뮤니티 운영 시스템', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '커뮤니티 운영 시스템은 서비스 이용약관 및 커뮤니티 이용규칙 위반을 빠르게 감지하고 조치하기 위해 도입되었습니다.\n'
              '방송통신심의위원회의 정보통신에 관한 심의규정, 현행 법률, 서비스 이용약관 및 커뮤니티 이용규칙 위반 등이 확인될 경우, 게시물이 삭제되고 서비스 이용이 제한됩니다.\n'
              '이용 제한 시, 관련한 내용이 서비스 내부 알림 수단을 통해 개별 통지되며 별도의 제제기간이 부여되지 않을 시 영구적으로 이용이 제한될 수 있음을 알립니다.\n'
              '서비스 이용 중 서비스 이용 약관 및 커뮤니티 이용규칙에 어긋난다고 판단되는 게시물 작성, 닉네임 및 프로필 사진 지정, 악용행위 등을 발견하셨을 경우, 원활하고 신속한 처리를 위해 [더보기]의 문의하기 기능을 통해 문의해주시기 바랍니다. 신고 시 게시물 처리 및 시스템 운영을 위해 최소한의 로그가 수집 및 보관될 수 있습니다.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            Text('유출 방지 시스템', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '유출 방지 시스템은 게시물 및 자료를 외부로 유출하는 행위를 실시간으로 감지하고 조치하기 위해 도입되었습니다.\n'
              '커뮤니티의 게시물을 복사, 스크린샷, 촬영하여 외부 사이트, 대화방에 게시하거나, 타인에게 관련한 내용을 공유하는 등 게시물 및 자료유출이 적발될 경우 서비스 이용이 제한 될 수 있습니다. 만약 외부 유출을 발견하셨을 경우, 문의하기 기능을 통해 문의해주시기 바랍니다.\n'
              '모든 이용자는 외부 유출 행위로 인해 발생한 모든 피해에 대해 민형사상 책임과 손해를 배상할 책임이 있습니다.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            Text('금지 행위', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '1. 국제 평화, 국제 질서 및 국가 간의 우의를 현저히 해할 우려가 있는 행위\n'
              '2. 헌법에 위배되거나 국가의 존립을 해하는 행위\n'
              '3. 범죄 기타 법령에 위반되는 행위\n'
              '4. 사회통념상 일반인의 성욕을 자극하여 성적 흥분을 유발하고 정상적인 성적 수치심을 해하여 성적 도의관념에 반하는 행위\n'
              '5. 폭력성, 잔혹성, 혐오성 등이 심각한 행위\n'
              '6. 사회통합 및 사회질서를 저해하는 행위\n'
              '7. 타인의 권리를 침해하는 행위\n'
              '\t - 다른 이용자에게 불쾌감이나 불편함을 주는 행위\n'
              '\t - 개인정보 유포 등 사생활의 비밀과 자유를 침해할 우려가 현저한 행위\n'
              '\t - 정당한 권한 없이 타인의 사진, 영상 등을 게재하여 타인의 인격권을 현저히 침해하는 행위\n'
              '\t - 그 밖에 정당한 권한없이 타인의 권리를 침해하는 행위\n'
              '8. 자살예방법에 반하는 자살 및 자해 유발정보 유통 행위\n'
              '9. 의료법, 약사법, 관세법, 전파법, 외국환거래법 등 법률에 반하는 거래 불가능 품목 거래 행위\n'
              '10. 악용/오용 행위\n'
              '\t - 익명을 이용한 여론 조작 행위\n'
              '\t - 내용 없는 외부 링크 게시, 외부 서비스 이용 강제 등 서비스 이탈 유도 행위\n'
              '\t - 동일하거나 유사한 문자 및 문구를 하나의 게시물에 반복적으로 입력하는 행위\n'
              '\t - 서비스의 운영 목적 및 성격에 부합하지 않는 게시물 작성 행위\n'
              '\t - 이용자에게 혼란을 주기 위한 목적으로 거짓, 허위정보를 포함한 게시물을 작성하는 행위\n'
              '11. 비정상적 시스템 이용 행위',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            Text('게시물 작성, 삭제 규칙', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '1. 게시물 작성\n'
              '\t - 커뮤니티 이용규칙을 위반하지 않는 내용에 한해, 자유롭게 게시물을 작성할 수 있습니다.\n'
              '2. 게시물 삭제\n'
              '\t - 커뮤니티 이용규칙을 위반하지 않는 선에서 이용자는 자유롭게 본인이 작성한 게시물을 삭제할 수 있습니다.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            Text('기타', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              '커뮤니티 이용규칙은 쾌적한 서비스 운영을 위해 주기적으로 업데이트 됩니다.\n'
              '회사는 이용자가 커뮤니티 운영 시스템, 금지 행위, 게시물 작성,수정,삭제 규칙 등 커뮤니티 이용규칙을 숙지하지 않아 발생하는 피해에 대하여 회사의 고의 또는 중대한 과실이 없는 한 어떠한 책임도 지지 않습니다.\n'
              '이 커뮤니티 이용규칙은 2024년 08월 11일에 제정되었습니다.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 64),
          ],
        ),
      ),
    );
  }
}
