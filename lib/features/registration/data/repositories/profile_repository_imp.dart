import 'package:injectable/injectable.dart';
import 'package:myfinance/features/registration/data/datasources/profile_datasource_local.dart';
import 'package:myfinance/features/registration/domain/entities/profile.dart';
import 'package:myfinance/features/registration/domain/repositories/profile_repository.dart';

import '../../../../injection.dart';

@Injectable(as: ProfileRepository, env: [Env.dev, Env.prod])
class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileDataSourceLocal profileDataSourceLocal;

  ProfileRepositoryImpl({required this.profileDataSourceLocal});

  @override
  Future<Profile> getProfileInformation() async {
    return profileDataSourceLocal.getProfileInformation();
  }

  @override
  Future<bool> setProfileInformation({required Profile profile}) async {
    return profileDataSourceLocal.setProfileInformation(profile: profile);
  }

  @override
  void initializeApplication() {
    profileDataSourceLocal.initializeApplication();
  }
}
