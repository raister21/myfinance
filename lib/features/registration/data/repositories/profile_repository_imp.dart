import 'package:myfinance/features/registration/data/datasources/profile_datasource_local.dart';
import 'package:myfinance/features/registration/domain/entities/profile.dart';
import 'package:myfinance/features/registration/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileDataSourceLocal profileDataSourceLocal;

  ProfileRepositoryImpl({required this.profileDataSourceLocal});

  @override
  Future<Profile> getProfileInformation() async {
    return await profileDataSourceLocal.getProfileInformation();
  }

  @override
  Future<bool> setProfileInformation({required Profile profile}) async {
    return await profileDataSourceLocal.setProfileInformation(profile: profile);
  }
}
