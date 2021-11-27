import 'package:flutter/material.dart';
import 'package:myfinance/core/presentation/pages/splash_screen.dart';
import 'package:myfinance/features/registration/presentation/pages/infographic_page.dart';
import 'package:myfinance/features/registration/presentation/pages/registration_page.dart';

class RouteGenerator {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case (InfoGraphicScreen.routeName):
        return MaterialPageRoute(builder: (BuildContext context) {
          return const InfoGraphicScreen();
        });

      case (RegistrationScreen.routeName):
        return MaterialPageRoute(builder: (BuildContext context) {
          return const RegistrationScreen();
        });

      default:
        return MaterialPageRoute(builder: (BuildContext context) {
          return const SplashScreen();
        });
    }
  }
}
