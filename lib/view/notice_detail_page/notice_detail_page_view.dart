import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/model/notice_list_model.dart';
import 'package:loopy_friends/model/notice_info.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../constants/url.dart';

class DetailPageView extends StatelessWidget {
  const DetailPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final Notice notice = Get.arguments as Notice;

    return FutureBuilder<Notice_info>(
      future: fetchNoticeInfo(notice.id), 
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              title: Text(notice.title),
            ),
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text(notice.title),
            ),
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else if (!snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text(notice.title),
            ),
            body: Center(child: Text('No data available')),
          );
        } else {
          final noticeInfo = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: Text(noticeInfo.title),
            ),
            backgroundColor: Color.fromARGB(255, 212, 221, 232),
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
                  child: Container(
                    width: 340,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            noticeInfo.title,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            noticeInfo.created_at,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            noticeInfo.content,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Future<Notice_info> fetchNoticeInfo(int id) async {
    final response = await http.get(Uri.parse('${Urls.apiUrl}notice/$id'));

    if (response.statusCode == 200) {
      String bodyUtf8 = utf8.decode(response.bodyBytes);
      return Notice_info.fromJson(json.decode(bodyUtf8));
    } else {
      throw Exception('데이터 로드 실패');
    }
  }
}
