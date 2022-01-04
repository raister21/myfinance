import 'package:injectable/injectable.dart';
import 'package:myfinance/features/registration/data/repositories/profile_repository_imp.dart';
import 'package:myfinance/features/registration/domain/entities/profile.dart';

import '../../../../injection.dart';

abstract class ProfileRepository {
  Future<Profile> getProfileInformation();
  Future<bool> setProfileInformation({required Profile profile});
  void initializeApplication();
}
