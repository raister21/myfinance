import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myfinance/features/registration/domain/usecases/initialize_application.dart';

import '../../data/datasource/profile_datasource_local_test.mocks.dart';
import '../../data/repositories/profile_repossitory_impl_test.mocks.dart';

void main() {
  late final InitializeApplication usecase;
  late final MockProfileRepositoryImpl repository;

  setUp(() {
    repository = MockProfileRepositoryImpl();
    usecase = InitializeApplication(profileRepository: repository);
  });

  test('should run initializeApplication use case', () async {
    // arrange
    // when(repository.initializeApplication());
    // act
    usecase.execute();
    // assert
    verify(repository.initializeApplication());
  });
}
