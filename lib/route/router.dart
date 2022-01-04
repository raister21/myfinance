import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfinance/core/presentation/bloc/cubit/bottomnavigation_cubit.dart';
import 'package:myfinance/core/presentation/pages/main_screen.dart';
import 'package:myfinance/core/presentation/pages/splash_screen.dart';
import 'package:myfinance/features/registration/presentation/bloc/registration/profile/bloc/profile_bloc.dart';

import 'package:myfinance/features/registration/presentation/pages/infographic_page.dart';
import 'package:myfinance/features/registration/presentation/pages/registration_page.dart';
import 'package:myfinance/features/trackFinance/presentation/bloc/inputCubit/inputoverlay_cubit.dart';

import '../injection.dart';

class RouteGenerator {
  // final RegistrationBlocBloc _registerBloc = RegistrationBlocBloc();
  final BottomnavigationCubit _navBloc = BottomnavigationCubit();
  final InputoverlayCubit _inputoverlayCubit = InputoverlayCubit();

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case (InfoGraphicScreen.routeName):
        return MaterialPageRoute(builder: (BuildContext context) {
          return const InfoGraphicScreen();
        });

      // TODO: SEND BLOC FROM SPLASH
      case (RegistrationScreen.routeName):
        return MaterialPageRoute(builder: (BuildContext context) {
          return BlocProvider(
            create: (context) => getIt<ProfileBloc>(),
            child: const RegistrationScreen(),
          );
        });

      case (MainScreen.routeName):
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: _navBloc,
              ),
              BlocProvider.value(
                value: _inputoverlayCubit,
              ),
            ],
            child: const MainScreen(),
          ),
        );

      default:
        return MaterialPageRoute(builder: (BuildContext context) {
          return const SplashScreen();
        });
    }
  }
}
