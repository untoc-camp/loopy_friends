import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/constants/colors.dart';
import 'package:loopy_friends/router/main_rotuer.dart';
import 'package:loopy_friends/themes/button_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PlacePlanPlatform',
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
