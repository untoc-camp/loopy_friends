import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/layout/main_layout.dart';
import 'package:loopy_friends/view/main_page_view.dart';

class MainRouter {
  static final List<GetPage> routes = [
    GetPage(
      name: '/',
      page: () => MainLayout(
          child: MainPageVIew(),
        ),
      // children: empty.routes
      ),
    
    GetPage(
      name: '/SignIn',
      page: () => const Scaffold(
        body: Center(
          child: Text('Second Page'),
        ),
      ),
    ),
    GetPage(
      name: '/SignUp',
      page: () => const Scaffold(
        body: Center(
          child: Text('Third Page'),
        ),
      ),
    ),
  ];
}
