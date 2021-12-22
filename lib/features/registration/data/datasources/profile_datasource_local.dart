import 'package:myfinance/features/registration/domain/entities/profile.dart';

abstract class ProfileDataSourceLocal {
  Future<Profile> getProfileInformation();
  Future<bool> setProfileInformation({required Profile profile});
}

class ProfileDataSourceLocalImpl extends ProfileDataSourceLocal{
  @override
  Future<Profile> getProfileInformation() {
    // TODO: implement getProfileInformation
    throw UnimplementedError();
  }

  @override
  Future<bool> setProfileInformation({required Profile profile}) {
    // TODO: implement setProfileInformation
    throw UnimplementedError();
  }

}
