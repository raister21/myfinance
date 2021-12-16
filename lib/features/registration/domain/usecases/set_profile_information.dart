import 'package:myfinance/features/registration/domain/entities/profile.dart';
import 'package:myfinance/features/registration/domain/repositories/profile_repository.dart';

class SetProfileInformation {
  final ProfileRepository profileRepository;

  SetProfileInformation({required this.profileRepository});

  Future<bool> execute(Profile profile) async {
    return await profileRepository.setProfileInformation(profile: profile);
  }
}
