import 'package:injectable/injectable.dart';
import 'package:myfinance/features/registration/domain/repositories/profile_repository.dart';

@Injectable()
class InitializeApplication {
  final ProfileRepository profileRepository;

  InitializeApplication({required this.profileRepository});

  void execute() {
    profileRepository.initializeApplication();
  }
}
