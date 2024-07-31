import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertCheckView extends StatefulWidget {
  const AlertCheckView({super.key});

  @override
  _AlertCheckViewState createState() => _AlertCheckViewState();
}

class _AlertCheckViewState extends State<AlertCheckView> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;

  @override
  void initState() {
    super.initState();
    fetchUserSettings();
  }

  void fetchUserSettings() async {
    // 백에서 사용자 설정 정보 가져오는 메서드 필요
    // 예시로, 아래와 같이 사용자 설정 정보를 가져온다고 가정합니다.
    // 실제로는 HTTP 요청 등을 통해 데이터를 가져올 수 있습니다.

    // example data
    Map<String, bool> userSettings = {
      '총학생회': true,
      '과학생회': false,
      '학과 공지': true,
      '신청/모집': true,
    };

    setState(() {
      isChecked1 = userSettings['총학생회'] ?? false;
      isChecked2 = userSettings['과학생회'] ?? false;
      isChecked3 = userSettings['학과 공지'] ?? false;
      isChecked4 = userSettings['신청/모집'] ?? false;
    });
  }

  void submitUserSettings() async {
    Map<String, bool> selectedData = {
      "총학생회": isChecked1,
      "과학생회": isChecked2,
      "학과 공지": isChecked3,
      "신청/모집": isChecked4,
    };

    // 데이터 전송 로직 추가 필요
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text('알림 설정'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckboxListTile(
              title: Text('총학생회'),
              value: isChecked1,
              onChanged: (bool? value) {
                setState(() {
                  isChecked1 = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: Text('과학생회'),
              value: isChecked2,
              onChanged: (bool? value) {
                setState(() {
                  isChecked2 = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: Text('학과 공지'),
              value: isChecked3,
              onChanged: (bool? value) {
                setState(() {
                  isChecked3 = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: Text('신청/모집'),
              value: isChecked4,
              onChanged: (bool? value) {
                setState(() {
                  isChecked4 = value ?? false;
                });
              },
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: submitUserSettings,
                child: Text('완료'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
