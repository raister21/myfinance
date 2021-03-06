import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:myfinance/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configutreInjection(String environment) =>
    $initGetIt(getIt, environment: environment);

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prdo';
}
