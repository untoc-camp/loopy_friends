import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/components/bottom_navigation/bottom_navigation.dart';
import 'package:loopy_friends/components/bottom_navigation/bottom_navigation_bar_controller.dart';
import 'package:sidebarx/sidebarx.dart';


class MainLayout extends StatelessWidget {
  final Widget child;
  MainLayout({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    Get.put(MyBottomNavgationBarController());
    return Scaffold(
      drawer: SidebarX(
        controller: SidebarXController(selectedIndex: 0, extended: true),
        items: const [
          SidebarXItem(icon: Icons.home, label: 'Home'),
          SidebarXItem(icon: Icons.search, label: 'Search'),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
