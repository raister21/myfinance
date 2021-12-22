import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:myfinance/features/registration/domain/entities/profile.dart';
import 'package:myfinance/features/registration/domain/repositories/profile_repository.dart';

import 'package:mockito/mockito.dart';
import 'package:myfinance/features/registration/domain/usecases/set_profile_information.dart';

import 'get_profile_information_test.mocks.dart';

void main() {
  late SetProfileInformation usecase;
  late MockProfileRepository mockProfileRepository;

  setUp(() {
    mockProfileRepository = MockProfileRepository();
    usecase = SetProfileInformation(profileRepository: mockProfileRepository);
  });

  final profile = Profile(name: "Mandip Rai");

  test("Should get validation for creating profile from the repository",
      () async {
    when(mockProfileRepository.setProfileInformation(profile: profile))
        .thenAnswer((_) async => true);

    final result = await usecase.execute(profile);

    expectLater(result, true);
    verify(mockProfileRepository.setProfileInformation(profile: profile));
  });
}
