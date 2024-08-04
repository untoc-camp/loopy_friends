import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class ContactCollectionView extends StatefulWidget {
  const ContactCollectionView({super.key});

  @override
  _ContactCollectionViewState createState() => _ContactCollectionViewState();
}

class _ContactCollectionViewState extends State<ContactCollectionView> {
  List<Map<String, String?>> contactHistory = [];

  @override
  void initState() {
    super.initState();
    fetchContactHistory();
  }

  void fetchContactHistory() async {
  final prefs = await SharedPreferences.getInstance();
  final accessToken = prefs.getString('access_token');
  var url = Uri.parse('${Urls.apiUrl}mycontact');
  try {
    var response = await http.get(url, headers: {
      "Authorization": "Bearer $accessToken", // 필요하다면 토큰 추가
    });

    if (response.statusCode == 200) {
      String bodyUtf8 = utf8.decode(response.bodyBytes);
      var data = json.decode(bodyUtf8) as List;
      List<Map<String, String?>> contactData = data.map((item) => {
        'inquiry': item['content'] as String?,
        'response': item['answer'] as String?
      }).toList();

      setState(() {
        contactHistory = contactData;
      });
    } else {
      throw Exception('Failed to load contact history');
    }
  } catch (e) {
    print('Error: $e');
    setState(() {
      contactHistory = []; // 오류 시 데이터 초기화
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.toNamed('/setting');
          },
        ),
        title: Text('문의 내역'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: contactHistory.length,
              itemBuilder: (context, index) {
                final item = contactHistory[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        item['inquiry'] ?? '문의 내용 없음',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        item['response'] == 'not yet' ? '답변을 기다리는 중입니다' : item['response'] ?? '답변을 기다리는 중입니다',
                        style: TextStyle(
                          color: item['response'] == 'not yet' ? Colors.red : Colors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InquiryDetailPage(
                              inquiry: item['inquiry'],
                              response: item['response'],
                            ),
                          ),
                        );
                      },
                    ),
                    Divider(),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed('/contact_inquiry');
              },
              child: Text('새 문의하기'),
            ),
          ),
        ],
      ),
    );
  }
}

class InquiryDetailPage extends StatelessWidget {
  final String? inquiry;
  final String? response;

  const InquiryDetailPage({super.key, this.inquiry, this.response});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('문의 상세 내역'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('문의 내용:', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Text(inquiry ?? '문의 내용 없음'),
            SizedBox(height: 16.0),
            Text('답변 내용:', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Text(response == 'not yet' ? '답변을 기다리는 중입니다' : response ?? '답변을 기다리는 중입니다'),
          ],
        ),
      ),
    );
  }
}
