abstract class ProfileDataSourceLocal {
  Future<Profile> getProfileInformation();
  Future<bool> setProfileInformation({required Profile profile});
}
