// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'features/registration/data/datasources/profile_datasource_local.dart'
    as _i4;
import 'features/registration/data/repositories/profile_repository_imp.dart'
    as _i6;
import 'features/registration/domain/repositories/profile_repository.dart'
    as _i5;
import 'features/registration/domain/usecases/get_profile_information.dart'
    as _i8;
import 'features/registration/domain/usecases/initialize_application.dart'
    as _i9;
import 'features/registration/domain/usecases/set_profile_information.dart'
    as _i7;
import 'features/registration/presentation/bloc/registration/profile/bloc/profile_bloc.dart'
    as _i10;
import 'services/hive_service.dart' as _i3;

const String _dev = 'dev';
const String _prdo = 'prdo';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.HiveService>(() => _i3.HiveService());
  gh.factory<_i4.ProfileDataSourceLocal>(() =>
      _i4.ProfileDataSourceLocalImpl(hiveService: get<_i3.HiveService>()));
  gh.factory<_i5.ProfileRepository>(
      () => _i6.ProfileRepositoryImpl(
          profileDataSourceLocal: get<_i4.ProfileDataSourceLocal>()),
      registerFor: {_dev, _prdo});
  gh.factory<_i7.SetProfileInformation>(() => _i7.SetProfileInformation(
      profileRepository: get<_i5.ProfileRepository>()));
  gh.factory<_i8.GetProfileInformation>(() => _i8.GetProfileInformation(
      profileRepository: get<_i5.ProfileRepository>()));
  gh.factory<_i9.InitializeApplication>(() => _i9.InitializeApplication(
      profileRepository: get<_i5.ProfileRepository>()));
  gh.factory<_i10.ProfileBloc>(() => _i10.ProfileBloc(
      getProfileInformation: get<_i8.GetProfileInformation>(),
      setProfileInformation: get<_i7.SetProfileInformation>(),
      initializeApplication: get<_i9.InitializeApplication>()));
  return get;
}
