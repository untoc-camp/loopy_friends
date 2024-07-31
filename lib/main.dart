import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/constants/colors.dart';
import 'package:loopy_friends/home_screen.dart';
import 'package:loopy_friends/router/main_rotuer.dart';
import 'package:loopy_friends/themes/button_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loopy_friends/service/notification_services.dart';
import 'package:shared_preferences/shared_preferences.dart'; // SharedPreferences 추가
import 'firebase_options.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'constants/url.dart';

void main() async {
  await dotenv.load(fileName: 'assets/config/.env');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final NotificationServices notificationServices = Get.put(NotificationServices());

  @override
  void initState() {
    super.initState();
    initializeNotificationServices();
  }

  Future<void> initializeNotificationServices() async {
    await notificationServices.requestNotificationPermission();
    notificationServices.firebaseInit();
    notificationServices.getDeviceToken().then((value) async {
      print('device token');
      print(value);
      await sendDeviceTokenToServerIfNeeded(value);
    });
  }

  Future<void> sendDeviceTokenToServerIfNeeded(String? token) async {
    if (token == null) return;

    final prefs = await SharedPreferences.getInstance();
    final storedToken = prefs.getString('device_token');

    if (storedToken != token) {
      final url = '${Urls.apiUrl}api/device-token'; // FastAPI 서버 URL을 여기에 입력하세요.
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'device_token': token,
          "check_totalcouncil": true,
          "check_departcouncil": true,
          "check_depart": true,
          "check_apply": true
        }),
      );

      if (response.statusCode == 200) {
        print('Device token successfully sent to the server.');
        await prefs.setString('device_token', token);
      } else {
        print('Failed to send device token to the server. Status code: ${response.statusCode}');
      }
    } else {
      print('Device token is unchanged, no need to send to the server.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'LoopyFriends',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Nanum Gothic',
        colorScheme: ColorScheme.fromSeed(
          seedColor: MainColor,
        ),
        primaryColor: MainColor,
        primaryColorLight: MainColorLight,
        primaryColorDark: MainColorDark,
        hintColor: HintColor,
        elevatedButtonTheme: elevatedButtonTheme,
        textButtonTheme: textButtonThemeData,
        outlinedButtonTheme: outlinedButtonThemeData,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      defaultTransition: Transition.noTransition,
      transitionDuration: Duration.zero,
      getPages: MainRouter.routes,
      initialBinding: BindingsBuilder(() {
        // Get.put(AuthService());
      }),
    );
  }
}
