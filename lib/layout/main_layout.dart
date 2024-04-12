import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/components/bottom_navigation/bottom_navigation.dart';
import 'package:loopy_friends/components/bottom_navigation/bottom_navigation_bar_controller.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  MainLayout({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    Get.put(MyBottomNavgationBarController());
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 80,
              child: SingleChildScrollView(
                child: child,
              ),
            ),
          ],
        ),
      ),
      MyBottomNavgationBar(),
    ]);
  }
}
