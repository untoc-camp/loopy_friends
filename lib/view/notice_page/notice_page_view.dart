import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/view/notice_list_page/notice_list_view.dart';
import 'package:loopy_friends/controller/notice_list_controller.dart';

class NoticePageView extends StatefulWidget {
  const NoticePageView({super.key});

  @override
  _NoticePageViewState createState() => _NoticePageViewState();
}

class _NoticePageViewState extends State<NoticePageView> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final NoticeController noticeController = Get.put(NoticeController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.index = 0;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(
        controller: _tabController,
        labelColor: Color.fromARGB(255, 179, 197, 218),
        unselectedLabelColor: Color.fromARGB(255, 70, 73, 77),
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        indicator: BoxDecoration(),
        indicatorColor: Colors.transparent,
        indicatorWeight: 0.0,
        dividerColor: Colors.transparent,
        tabs: [
          Tab(text: '총학생회'),
          Tab(text: '과학생회'),
          Tab(text: '학과 공지'),
          Tab(text: '신청/모집'),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          NoticeListView(data: noticeController.totalCouncilData),
          NoticeListView(data: noticeController.departmentCouncilData),
          NoticeListView(data: noticeController.departmentNoticeData),
          NoticeListView(data: noticeController.applyRecruitData),
        ],
      ),
    );
  }
}
