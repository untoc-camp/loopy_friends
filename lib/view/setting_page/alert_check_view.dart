import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../constants/url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

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
    final prefs = await SharedPreferences.getInstance();
    final deviceToken = prefs.getString('device_token');
    if (deviceToken != null) {
      String url = '${Urls.apiUrl}api/get_alarm_status?token=$deviceToken';
      final response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        String bodyUtf8 = utf8.decode(response.bodyBytes);
        Map<String, dynamic> userSettings = json.decode(bodyUtf8);
        setState(() {
          isChecked1 = userSettings['check_totalcouncil'] ?? false;
          isChecked2 = userSettings['check_departcouncil'] ?? false;
          isChecked3 = userSettings['check_depart'] ?? false;
          isChecked4 = userSettings['check_apply'] ?? false;
        });
      } else {
        print('오류가 발생했습니다. Status code: ${response.statusCode}');
      }
    } else {
      print('토큰 존재하지않음');
    }
  }

  void submitUserSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final deviceToken = prefs.getString('device_token');

    if (deviceToken != null) {
      String url = '${Urls.apiUrl}api/update_alarm_status';

      final response = await http.patch(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'device_token': deviceToken,
          'check_totalcouncil': isChecked1,
          'check_departcouncil': isChecked2,
          'check_depart': isChecked3,
          'check_apply': isChecked4,
        }),
      );

      if (response.statusCode == 200) {
        print('정상적으로 알람설정이 완료되었습니다');
      } else {
        print('오류가 발생했습니다. Status code: ${response.statusCode}');
      }
    } else {
      print('토큰 존재하지않음');
    }
  }

  void validateAndSubmit() {
    int selectedCount = (isChecked1 ? 1 : 0) +
        (isChecked2 ? 1 : 0) +
        (isChecked3 ? 1 : 0) +
        (isChecked4 ? 1 : 0);

    if (selectedCount >= 2) {
      submitUserSettings();
      Get.back(); // 전송 성공 시 이전 페이지로 돌아감
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('최소 2개 이상을 선택해야 합니다'),
          duration: Duration(seconds: 1),
        ),
      );
    }
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
            Text(
              '최소 2개 이상을 선택해야 합니다',
              style: TextStyle(color: Colors.red),
            ),
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
                onPressed: validateAndSubmit,
                child: Text('완료'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
