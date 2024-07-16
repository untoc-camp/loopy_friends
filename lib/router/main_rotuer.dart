import 'package:get/get.dart';
import 'package:loopy_friends/layout/main_layout.dart';
import 'package:loopy_friends/layout/start_layout.dart';
import 'package:loopy_friends/view/community_page/community_page_view.dart';
import 'package:loopy_friends/view/main_page_view.dart';
import 'package:loopy_friends/view/notice_page/notice_page_view.dart';
import 'package:loopy_friends/view/setting_page/change_pwd_view.dart';
import 'package:loopy_friends/view/start_page/loading_page_view.dart';

import 'package:loopy_friends/view/setting_page/setting_page_view.dart';
import 'package:loopy_friends/view/setting_page/terms_of_service_view.dart';
import 'package:loopy_friends/view/setting_page/privacy_policy_view.dart';
import 'package:loopy_friends/view/setting_page/usage_restriction_view.dart';
import 'package:loopy_friends/view/start_page/signup_page_view.dart';

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
        child: LoadingPageView(),
      ), // children: empty.routes
    ),
    GetPage(
      name: '/main',
      page: () => MainLayout(
        child: MainPageView(),
      ),
    ),
    GetPage(
      name: '/login',
      page: () => StartLayout(
        child: StartPageView(),
      ),
    ),
    GetPage(
      name: '/signup',
      page: () => StartLayout(
        child: SignUpPageView(),
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
      name: '/usage_restriction',
      page: () => MainLayout(
        child: const UsageRestrictionPage(),
      ),
    ),
    GetPage(
      name: '/terms_of_service',
      page: () => MainLayout(
        child: const TermsOfServicePage(),
      ),
    ),
    GetPage(
      name: '/privacy_policy',
      page: () => MainLayout(
        child: const PrivacyPolicyPage(),
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
    GetPage(
      name: '/pwdChange',
      page: () => StartLayout(
        child: ChangePwdView(),
      ),
    ),
  ];
}
