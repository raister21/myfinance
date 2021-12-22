import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:myfinance/features/registration/domain/entities/profile.dart';
import 'package:myfinance/features/registration/domain/usecases/get_profile_information.dart';
import 'package:myfinance/features/registration/domain/usecases/set_profile_information.dart';
import 'package:myfinance/features/registration/presentation/bloc/registration/profile/bloc/profile_bloc.dart';

import 'profile_bloc_test.mocks.dart';

@GenerateMocks([GetProfileInformation, SetProfileInformation])
void main() {
  late ProfileBloc bloc;
  late MockGetProfileInformation mockGetProfileInformation;
  late MockSetProfileInformation mockSetProfileInformation;
  setUp(() {
    mockSetProfileInformation = MockSetProfileInformation();
    mockGetProfileInformation = MockGetProfileInformation();
    bloc = ProfileBloc(
        getProfileInformation: mockGetProfileInformation,
        setProfileInformation: mockSetProfileInformation);
  });

  test('initialState should be intial', () async {
    // assert
    expect(bloc.state, equals(ProfileInitial()));
  });

  Profile profile = const Profile(name: 'mandip rai');

  test("should return wether it was initialized or not", () async {
    // arrange
    when(mockSetProfileInformation.execute(profile))
        .thenAnswer((realInvocation) async => true);
    // assert later
    final expected = [
      ProfileInitial(),
      ProfileInitialized(profile: profile),
    ];
    expectLater(bloc.state, emitsInOrder(expected));
    // act
    bloc.add(SetProfileInformationEvent(profile: profile));
    // assert

    verify(mockSetProfileInformation.execute(profile));
  });

  test('should return Initialized state when getProfileInformationCalled',
      () async {
    // arrange
    when(mockGetProfileInformation.execute())
        .thenAnswer((realInvocation) async => profile);
    // act
    bloc.add(GetProfileInformationEvent());
    // assert
    expectLater(bloc.state, ProfileInitialized(profile: profile));
    verify(mockSetProfileInformation.execute(profile));
  });
}
