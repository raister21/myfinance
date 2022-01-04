import 'package:injectable/injectable.dart';
import 'package:myfinance/features/registration/domain/entities/profile.dart';
import 'package:myfinance/features/registration/domain/repositories/profile_repository.dart';

@Injectable()
class SetProfileInformation {
  final ProfileRepository profileRepository;

  SetProfileInformation({required this.profileRepository});

  Future<bool> execute(Profile profile) async {
    return await profileRepository.setProfileInformation(profile: profile);
  }
}
