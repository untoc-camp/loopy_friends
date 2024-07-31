import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    // 여기에 데이터를 받아오는 메서드를 호출
    // e.g.) List<Map<String, String?>> data = await getContactHistory();
    // 아래는 예시 데이터
    List<Map<String, String?>> data = [
      {'inquiry': '대충긴제목을잘간략하게줄여서보여줄수있는지테스트하는내용입니다대충긴제목을잘간략하게줄여서보여줄수있는지테스트하는내용입니다', 'response': '답변 내용 1'},
      {'inquiry': '문의 내용 2', 'response': 'not yet'},
      {'inquiry': '문의 내용 3', 'response': '대충긴답변을잘간략하게줄여서보여줄수있는지테스트하는내용입니다대충긴답변을잘간략하게줄여서보여줄수있는지테스트하는내용입니다'},
    ];

    setState(() {
      contactHistory = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
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
