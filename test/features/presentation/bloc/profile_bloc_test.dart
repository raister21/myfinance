import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:myfinance/features/registration/domain/entities/profile.dart';
import 'package:myfinance/features/registration/domain/usecases/get_profile_information.dart';
import 'package:myfinance/features/registration/domain/usecases/initialize_application.dart';
import 'package:myfinance/features/registration/domain/usecases/set_profile_information.dart';
import 'package:myfinance/features/registration/presentation/bloc/registration/profile/bloc/profile_bloc.dart';

import 'profile_bloc_test.mocks.dart';

import 'package:bloc_test/bloc_test.dart';

class MockProfilerBloc extends MockBloc<ProfileEvent, ProfileState>
    implements ProfileBloc {}

@GenerateMocks(
    [GetProfileInformation, SetProfileInformation, InitializeApplication])
void main() {
  late ProfileBloc bloc;
  late MockGetProfileInformation mockGetProfileInformation;
  late MockSetProfileInformation mockSetProfileInformation;
  late MockInitializeApplication mockInitializeApplication;
  late MockProfilerBloc profilerBloc;
  setUp(() {
    mockSetProfileInformation = MockSetProfileInformation();
    mockGetProfileInformation = MockGetProfileInformation();
    mockInitializeApplication = MockInitializeApplication();
    bloc = ProfileBloc(
        getProfileInformation: mockGetProfileInformation,
        setProfileInformation: mockSetProfileInformation,
        initializeApplication: mockInitializeApplication);
    profilerBloc = MockProfilerBloc();
  });

  Profile profile = const Profile(name: 'mandip rai');

  void setUpBloc() {
    whenListen(
      profilerBloc,
      Stream.fromIterable(
          [ProfileInitial(), ProfileInitialized(profile: profile)]),
      initialState: ProfileInitial(),
    );
  }

  test('profile state should be [ProfileInitialized] when setProfile called',
      () async {
    // arrange
    setUpBloc();
    when(mockGetProfileInformation.execute())
        .thenAnswer((realInvocation) async => profile);
    // act
    profilerBloc.add(
      SetProfileInformationEvent(profile: profile),
    );

    await expectLater(
        profilerBloc.stream,
        emitsInOrder(<ProfileState>[
          ProfileInitial(),
          ProfileInitialized(profile: profile)
        ]));
  });

  test('initialState should be [ProfileInitial]', () async {
    // arrange
    setUpBloc();
    // act

    //assert
    expect(profilerBloc.state, isA<ProfileInitial>());
  });

  test('should emit [ProfileInitialzedState]', () async {
    // arrange
    when(mockGetProfileInformation.execute())
        .thenAnswer((realInvocation) async => profile);
    // act
    expectLater(bloc.stream, emits(ProfileInitialized(profile: profile)));

    bloc.add(GetProfileInformationEvent());
    await untilCalled(mockGetProfileInformation.execute());
    // assert
    verify(mockGetProfileInformation.execute());
  });

  test('should call initialize app event', () async {
    // arrange

    // act
    bloc.add(InitializeApplicationEvent());
    await untilCalled(mockInitializeApplication.execute());
    // assert
    verify(mockInitializeApplication.execute());
  });
}
