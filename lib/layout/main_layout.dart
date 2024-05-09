import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/components/bottom_navigation/bottom_navigation.dart';
import 'package:loopy_friends/components/bottom_navigation/bottom_navigation_bar_controller.dart';
import 'package:loopy_friends/components/side_Bar/side_bar.dart';
import 'package:loopy_friends/components/side_Bar/side_bar_controller.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  MainLayout({super.key, required this.child});
  final sidebarController = Get.put(SideBarController());
  @override
  Widget build(BuildContext context) {
    Get.put(MyBottomNavgationBarController());
    return Scaffold(
      appBar: AppBar(),
      key: sidebarController.scaffoldKey,
      drawer: SideBar(controller: sidebarController),
      body:
        Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 80,
                  child: SingleChildScrollView(
                    child: child,
                  ),
                ),
              ),
            ],
          ),
        ),
        MyBottomNavgationBar(),
      ]),
    );
  }
}
