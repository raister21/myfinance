// Mocks generated by Mockito 5.0.17 from annotations
// in myfinance/test/features/data/repositories/profile_repossitory_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:myfinance/features/registration/data/datasources/profile_datasource_local.dart'
    as _i3;
import 'package:myfinance/features/registration/data/repositories/profile_repository_imp.dart'
    as _i5;
import 'package:myfinance/features/registration/domain/entities/profile.dart'
    as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeProfile_0 extends _i1.Fake implements _i2.Profile {}

class _FakeProfileDataSourceLocal_1 extends _i1.Fake
    implements _i3.ProfileDataSourceLocal {}

/// A class which mocks [ProfileDataSourceLocal].
///
/// See the documentation for Mockito's code generation for more information.
class MockProfileDataSourceLocal extends _i1.Mock
    implements _i3.ProfileDataSourceLocal {
  MockProfileDataSourceLocal() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Profile> getProfileInformation() =>
      (super.noSuchMethod(Invocation.method(#getProfileInformation, []),
              returnValue: Future<_i2.Profile>.value(_FakeProfile_0()))
          as _i4.Future<_i2.Profile>);
  @override
  _i4.Future<bool> setProfileInformation({_i2.Profile? profile}) =>
      (super.noSuchMethod(
          Invocation.method(#setProfileInformation, [], {#profile: profile}),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
}

/// A class which mocks [ProfileRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockProfileRepositoryImpl extends _i1.Mock
    implements _i5.ProfileRepositoryImpl {
  MockProfileRepositoryImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.ProfileDataSourceLocal get profileDataSourceLocal =>
      (super.noSuchMethod(Invocation.getter(#profileDataSourceLocal),
              returnValue: _FakeProfileDataSourceLocal_1())
          as _i3.ProfileDataSourceLocal);
  @override
  _i4.Future<_i2.Profile> getProfileInformation() =>
      (super.noSuchMethod(Invocation.method(#getProfileInformation, []),
              returnValue: Future<_i2.Profile>.value(_FakeProfile_0()))
          as _i4.Future<_i2.Profile>);
  @override
  _i4.Future<bool> setProfileInformation({_i2.Profile? profile}) =>
      (super.noSuchMethod(
          Invocation.method(#setProfileInformation, [], {#profile: profile}),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
}
