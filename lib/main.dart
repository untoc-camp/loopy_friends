import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loopy_friends/router/main_rotuer.dart';

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
        // colorScheme: ColorScheme.fromSeed(
        //   seedColor: primaryColor,
        // ),
        // primaryColor: primaryColor,
        // primaryColorLight: primaryColorLight,
        // primaryColorDark: primaryColorDark,
        // hintColor: hintColor,
        // elevatedButtonTheme: elevatedButtonTheme,
        // textButtonTheme: textButtonThemeData,
        // outlinedButtonTheme: outlinedButtonThemeData,
        // cardTheme: cardTheme,
        // toggleButtonsTheme: toggleButtonsTheme,
        // inputDecorationTheme: inputTheme,
        // progressIndicatorTheme: progressIndicatorTheme,
        // dataTableTheme: dataTableTheme,
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
