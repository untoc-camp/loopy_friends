import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/components/side_Bar/side_bar_controller.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
    required this.controller,
  });

  final SideBarController controller;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: controller.closeDrawer,
          )
        ],
      ),
    );
  }
}
