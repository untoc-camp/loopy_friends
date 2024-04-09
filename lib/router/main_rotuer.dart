import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainRouter {
  static final List<GetPage> routes = [
    GetPage(
      name: '/',
      page: () => const Scaffold(
        body: Center(
          child: Text('Main Page'),
        ),
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
