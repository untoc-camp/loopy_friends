import 'package:flutter/material.dart';
import '../constants/colors.dart';

final ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    backgroundColor: MaterialStateProperty.resolveWith(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey;
        }
        return MainColor;
      },
    ),
    foregroundColor: MaterialStateProperty.all(Colors.white),
  ),
);

final TextButtonThemeData textButtonThemeData = TextButtonThemeData(
  style: ButtonStyle(
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    foregroundColor: MaterialStateProperty.all(MainColor),
  ),
);

final OutlinedButtonThemeData outlinedButtonThemeData = OutlinedButtonThemeData(
  style: ButtonStyle(
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    foregroundColor: MaterialStateProperty.all(MainColor),
    backgroundColor: MaterialStateProperty.all(Colors.white),
  ),
);
