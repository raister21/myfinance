import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:myfinance/features/registration/domain/entities/profile.dart';
import 'package:myfinance/features/registration/domain/repositories/profile_repository.dart';
import 'package:myfinance/features/registration/domain/usecases/get_profile_information.dart';
import 'package:myfinance/injection.dart';
import 'package:myfinance/services/hive_service.dart';

import 'features/data/datasource/profile_datasource_local_test.mocks.dart';

void main() {
  late MockHiveService mockHiveService;
  late MockBox<dynamic> box;

  setUp(() async {
    mockHiveService = MockHiveService();
    box = MockBox();
    await HiveService().initHive();
    configutreInjection(Env.dev);
  });
  Profile profile = Profile(name: "Mandip");
  test('should do shit', () async {
    // arrange

    final useCase = getIt<GetProfileInformation>();
    // act
    when(useCase.execute()).thenAnswer((realInvocation) async => profile);

    final res = useCase.execute();

    expect(res, profile);
    verify(useCase.execute());
  });
}
