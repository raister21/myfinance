import 'package:myfinance/features/registration/domain/entities/profile.dart';

abstract class ProfileRepository {
  Future<Profile> getProfileInformation();
  Future<bool> setProfileInformation({required Profile profile});
}
