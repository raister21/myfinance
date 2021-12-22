import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:myfinance/features/registration/domain/entities/profile.dart';
import 'package:myfinance/features/registration/domain/repositories/profile_repository.dart';
import 'package:myfinance/features/registration/domain/usecases/get_profile_information.dart';
import 'package:mockito/mockito.dart';

import 'get_profile_information_test.mocks.dart';

@GenerateMocks([ProfileRepository])
void main() {
  late GetProfileInformation usecase;
  late MockProfileRepository mockProfileRepository;

  setUp(() {
    mockProfileRepository = MockProfileRepository();
    usecase = GetProfileInformation(profileRepository: mockProfileRepository);
  });

  final profile = Profile(name: "Mandip Rai");

  test("Should get profile from the repository", () async {
    when(mockProfileRepository.getProfileInformation())
        .thenAnswer((_) async => profile);

    final result = await usecase.execute();

    expectLater(result, profile);
    verify(mockProfileRepository.getProfileInformation());
  });
}
