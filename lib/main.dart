import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfinance/core/presentation/pages/splash_screen.dart';
import 'package:myfinance/features/registration/presentation/bloc/registration/registration_bloc_bloc.dart';
import 'package:myfinance/route/router.dart';
import 'package:myfinance/services/bloc_observer.dart';

import 'config/app_config.dart';

void main() {
  BlocOverrides.runZoned(
    () {},
    blocObserver: AppBlocObserver(),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final RouteGenerator _routeGenerator = RouteGenerator();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppConfig().themeData,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _routeGenerator.generateRoute,
      home: const SplashScreen(),
    );
  }
}
