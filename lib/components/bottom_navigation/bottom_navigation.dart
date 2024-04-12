import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './bottom_navigation_bar_controller.dart';

class MyBottomNavgationBar extends GetView<MyBottomNavgationBarController> {
  const MyBottomNavgationBar({Key? key}) : super(key: key);

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
                icon: controller.selectedIndex.value == 0
                    ? Icon(
                        Icons.favorite,
                        color: Colors.pink,
                        size: 24.0,
                        semanticLabel:
                            'Text to announce in accessibility modes',
                      )
                    : Icon(
                        Icons.favorite,
                        color: Colors.blue,
                        size: 24.0,
                      ),
                label: "tap1"),
            BottomNavigationBarItem(
                icon: controller.selectedIndex.value == 1
                    ? Container(
                        color: Colors.red,
                      )
                    : Container(
                        color: Colors.blue,
                      ),
                label: "tap2"),
            BottomNavigationBarItem(
                icon: controller.selectedIndex.value == 2
                    ? Container(
                        color: Colors.red,
                      )
                    : Container(
                        color: Colors.blue,
                      ),
                label: "tap3"),
          ],
        ));
  }
}
