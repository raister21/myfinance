import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:myfinance/features/registration/domain/entities/profile.dart';
import 'package:myfinance/services/hive_service.dart';

import '../../../../injection.dart';

abstract class ProfileDataSourceLocal {
  Profile getProfileInformation();
  bool setProfileInformation({required Profile profile});
  void initializeApplication();
}

@Injectable(as: ProfileDataSourceLocal)
class ProfileDataSourceLocalImpl extends ProfileDataSourceLocal {
  final HiveService hiveService;

  ProfileDataSourceLocalImpl({required this.hiveService});
  @override
  Profile getProfileInformation() {
    Box<Profile> profileBox =
        hiveService.getBox(boxName: boxes.profileBox) as Box<Profile>;

    Profile profile = profileBox.get('profile')!;
    return profile;
  }

  @override
  bool setProfileInformation({required Profile profile}) {
    return hiveService.saveProfileSetting(
        boxName: boxes.profileBox, profile: profile);
  }

  @override
  void initializeApplication() {
    hiveService.initializeApplication();
  }
}
