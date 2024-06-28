import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/layout/main_layout.dart';
import 'package:loopy_friends/layout/start_layout.dart';
import 'package:loopy_friends/view/community_page/community_page_view.dart';
import 'package:loopy_friends/view/main_page_view.dart';
import 'package:loopy_friends/view/notice_page/notice_page_view.dart';
import 'package:loopy_friends/view/setting_page/setting_page_view.dart';
import 'package:loopy_friends/view/setting_view.dart';
import 'package:loopy_friends/view/start_page/start_page_view.dart';
import 'package:loopy_friends/view/test_1_view.dart';
import 'package:loopy_friends/view/test_view.dart';
import 'package:loopy_friends/view/write_page/write_page_view.dart';
import 'package:loopy_friends/view/notice_detail_page/notice_detail_page_view.dart';

class MainRouter {
  static final List<GetPage> routes = [
    GetPage(
      name: '/',
      page: () => StartLayout(
        child: StartPageView(),
      ),
      // children: empty.routes
    ),
    GetPage(
      name: '/main',
      page: () => MainLayout(
        child: MainPageVIew(),
      ),
    ),
    GetPage(
      name: '/login',
      page: () => const Scaffold(
        body: Center(
          child: Text('Second Page'),
        ),
      ),
    ),
    GetPage(
      name: '/signup',
      page: () => const Scaffold(
        body: Center(
          child: Text('Third Page'),
        ),
      ),
    ),
    GetPage(
      name: '/notice',
      page: () => MainLayout(
        child: NoticePageView(),
      ),
    ),
    GetPage(
      name: '/community',
      page: () => MainLayout(
        child: CommunityPageView(),
      ),
    ),
    GetPage(
      name: '/setting',
      page: () => MainLayout(
        child: SettingPageView(),
      ),
    ),
    GetPage(
      name: '/test',
      page: () => StartLayout(
        child: TestView(),
      ),
    ),
    GetPage(
      name: '/test1',
      page: () => StartLayout(
        child: Test1View(),
      ),
    ),
    GetPage(
      name: '/setting',
      page: () => MainLayout(
        child: SettingView(),
      ),
    ),
    GetPage(
      name: '/write',
      page: () => MainLayout(
        child: WritePageView(),
      ),
    ),
    GetPage(
      name: '/detail',
      page: () => MainLayout(
        child: DetailPageView(),
      ),
    ),
  ];
}
