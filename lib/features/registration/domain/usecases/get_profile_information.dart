import 'package:injectable/injectable.dart';
import 'package:myfinance/features/registration/domain/entities/profile.dart';
import 'package:myfinance/features/registration/domain/repositories/profile_repository.dart';

@Injectable()
class GetProfileInformation {
  final ProfileRepository profileRepository;

  GetProfileInformation({required this.profileRepository});

  Future<Profile> execute() async {
    return await profileRepository.getProfileInformation();
  }
}
