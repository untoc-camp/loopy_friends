import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './bottom_navigation_bar_controller.dart';

class MyBottomNavgationBar extends GetView<MyBottomNavgationBarController> {
  const MyBottomNavgationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeIndex,
          selectedItemColor: context.theme.colorScheme.onBackground,
          unselectedItemColor: context.theme.colorScheme.onSurfaceVariant,
          unselectedLabelStyle: TextStyle(fontSize: 10),
          selectedLabelStyle: TextStyle(fontSize: 10),
          type: BottomNavigationBarType.fixed,
          backgroundColor: context.theme.colorScheme.background,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Icon(
                      Icons.home,
                      color: controller.selectedIndex.value == 0 ? Colors.black : Colors.grey,
                      size: 24.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                  ],
                ),
                label: "홈"),
            BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Icon(
                      Icons.campaign,
                      color: controller.selectedIndex.value == 1 ? Colors.black : Colors.grey,
                      size: 24.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                  ],
                ),
                label: "공지사항"),
            BottomNavigationBarItem(
                icon: Column(
                  children: [
                    Icon(
                      Icons.dvr,
                      color: controller.selectedIndex.value == 2 ? Colors.black : Colors.grey,
                      size: 24.0,
                      semanticLabel: 'Text to announce in accessibility modes',
                    ),
                  ],
                ),
                label: "커뮤니티"),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Icon(
                    Icons.more_horiz,
                    color: controller.selectedIndex.value == 3 ? Colors.black : Colors.grey,
                    size: 24.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                ],
              ),
              label: "더보기",
            ),
          ],
        ));
  }
}
