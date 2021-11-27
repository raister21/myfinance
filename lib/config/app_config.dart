import 'package:flutter/material.dart';

class AppConfig {
  ThemeData themeData = ThemeData(
      fontFamily: "Roboto",
      textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.white)),
      elevatedButtonTheme: const ElevatedButtonThemeData(style: ButtonStyle()),
      primaryColor: primary);
}

const Color primary = Color(0xFF6847A8);
const Color primaryLight = Color(0xFFCB50F4);
