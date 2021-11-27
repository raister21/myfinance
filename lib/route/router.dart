import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfinance/core/presentation/pages/splash_screen.dart';
import 'package:myfinance/features/registration/presentation/bloc/registration/registration_bloc_bloc.dart';
import 'package:myfinance/features/registration/presentation/pages/infographic_page.dart';
import 'package:myfinance/features/registration/presentation/pages/registration_page.dart';

class RouteGenerator {
  // final RegistrationBlocBloc _registerBloc = RegistrationBlocBloc();

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case (InfoGraphicScreen.routeName):
        return MaterialPageRoute(builder: (BuildContext context) {
          return const InfoGraphicScreen();
        });

      case (RegistrationScreen.routeName):
        return MaterialPageRoute(builder: (BuildContext context) {
          return BlocProvider(
            create: (context) => RegistrationBlocBloc(),
            child: const RegistrationScreen(),
          );
        });

      default:
        return MaterialPageRoute(builder: (BuildContext context) {
          return const SplashScreen();
        });
    }
  }
}
