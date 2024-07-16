import 'package:flutter/material.dart';

class StartLayout extends StatelessWidget {
  final Widget child;
  const StartLayout({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: child),
      ),
    );
  }
}
