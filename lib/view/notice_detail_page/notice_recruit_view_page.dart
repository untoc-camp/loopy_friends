import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/model/notice_list_model.dart';
import 'package:loopy_friends/model/notice_info.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../../constants/url.dart';

class RecruitPageView extends StatelessWidget {
  const RecruitPageView({super.key});

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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  noticeInfo.title,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 3,
                                ),
                              ),
                              URLButton(urllink: noticeInfo.urllink),
                            ],
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

class URLButton extends StatelessWidget {
  final String urllink;
  const URLButton({required this.urllink, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 70,
        height: 70,
        child: ElevatedButton(
            onPressed: () {
              _launchURL(urllink);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 179, 197, 218),
              padding: EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Column(
              children: [
                Text(
                  '신청하기',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'URL',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(width: 2),
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 134, 162, 193),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Icon(
                        Icons.link,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }

  void _launchURL(String urllink) async {
    Uri url = Uri.parse(urllink);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw '잘못된 주소입니다';
    }
  }
}
