import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartLayout extends StatelessWidget {
  final Widget child;
  const StartLayout({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: child,
    );
  }
}
