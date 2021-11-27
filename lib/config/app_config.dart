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
const Color darkGrey = Color(0xFF707070);
const Color grey = Color(0xFFACACAC);
const Color lighterGrey = Color(0xFFF2F2F2);
