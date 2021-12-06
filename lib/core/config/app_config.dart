import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppConfig {
  ThemeData themeData = ThemeData(
      fontFamily: "Roboto",
      textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.white)),
      elevatedButtonTheme: const ElevatedButtonThemeData(style: ButtonStyle()),
      primarySwatch: primarySwatch,
      primaryColor: primary);

  NumberFormat numberFormat =
      NumberFormat.currency(customPattern: '##,##,###', decimalDigits: 0);
  // NumberFormat standardCurrency =
  //     NumberFormat.currency(customPattern: '##,##,###.#');
}

const primarySwatch = MaterialColor(
  0xFF6847A8,
  {
    50: Color(0xFF0a0711),
    100: Color(0xFF150e22),
    200: Color(0xFF2a1c43),
    300: Color(0xFF3e2b65),
    400: Color(0xFF533986),
    500: Color(0xFF6847a8),
    600: Color(0xFF866cb9),
    700: Color(0xFFa491cb),
    800: Color(0xFFc3b5dc),
    900: Color(0xFFe1daee),
  },
);

const Color primary = Color(0xFF6847A8);
const Color primaryLight = Color(0xFFCB50F4);
const Color darkGrey = Color(0xFF707070);
const Color grey = Color(0xFFACACAC);
const Color lighterGrey = Color(0xFFF2F2F2);
const Color green = Color(0xFF51F54E);
const Color red = Color(0xFFFF5858);
const Color blue = Color(0xFF77DBFB);
const Color transBlack = Color(0x400E0E0E);
const Color transWhite = Color(0x40FFFFFF);
