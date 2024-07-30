import 'package:flutter/material.dart';
import 'package:loopy_friends/service/notification_services.dart';
import 'package:get/get.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotificationServices notificationServices = Get.put(NotificationServices());
  @override
  void initState(){
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.firebaseInit();

    // notificationServices.isTokenRefresh();
    notificationServices.getDeviceToken().then((value){
      print('device token');
      print(value);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}