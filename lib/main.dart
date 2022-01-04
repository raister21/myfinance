import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:myfinance/core/presentation/pages/splash_screen.dart';
import 'package:myfinance/injection.dart';
import 'package:myfinance/route/router.dart';
import 'package:myfinance/services/bloc_observer.dart';
import 'package:myfinance/services/hive_service.dart';

import 'core/config/app_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveService().initHive();

  configutreInjection(Env.prod);

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
