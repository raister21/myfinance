import 'dart:convert';
import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:myfinance/features/registration/data/datasources/profile_datasource_local.dart';
import 'package:myfinance/features/registration/data/models/profile_model.dart';
import 'package:myfinance/features/registration/data/repositories/profile_repository_imp.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../domain/usecases/get_profile_information_test.mocks.dart';
import 'profile_repossitory_impl_test.mocks.dart';

@GenerateMocks([ProfileDataSourceLocal, ProfileRepositoryImpl])
void main() {
  late ProfileRepositoryImpl repository;
  late MockProfileDataSourceLocal mockProfileDataSourceLocal;

  setUp(() {
    mockProfileDataSourceLocal = MockProfileDataSourceLocal();
    repository = ProfileRepositoryImpl(
        profileDataSourceLocal: mockProfileDataSourceLocal);
  });

  ProfileModel profileModel =
      ProfileModel.fromJson(json.decode(fixture("profile")));

  test('should get profile from local datasource', () async {
    // arrange
    when(mockProfileDataSourceLocal.getProfileInformation())
        .thenAnswer((realInvocation) async => profileModel);
    // act
    final result = await repository.getProfileInformation();
    // assert
    expect(result, profileModel);
    verify(mockProfileDataSourceLocal.getProfileInformation());
  });
}
