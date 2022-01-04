import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:myfinance/features/registration/data/datasources/profile_datasource_local.dart';
import 'package:myfinance/features/registration/domain/entities/profile.dart';
import 'package:myfinance/services/hive_service.dart';

import 'profile_datasource_local_test.mocks.dart';

@GenerateMocks([HiveService, Box])
void main() {
  late ProfileDataSourceLocalImpl dataSourceLocalImpl;
  late MockHiveService mockHiveService;
  late MockBox<Profile> box;

  setUp(() async {
    mockHiveService = MockHiveService();

    dataSourceLocalImpl =
        ProfileDataSourceLocalImpl(hiveService: mockHiveService);

    box = MockBox<Profile>();
  });

  // Box<Profile> box = Hive.openBox(boxes.initializationBox.toString())
  Profile profile = const Profile(name: 'mandip rai');

  test('should get profile from hive', () async {
    // arrange
    when(mockHiveService.getBox(boxName: boxes.profileBox)).thenReturn(box);
    when(box.get('profile')).thenReturn(profile);
    // act
    final result = dataSourceLocalImpl.getProfileInformation();
    // assert
    expect(result, profile);
    verify(mockHiveService.getBox(boxName: boxes.profileBox));
    verify(box.get('profile'));
  });

  test('should return true if profile was set', () async {
    // arrange
    when(mockHiveService.saveProfileSetting(
            boxName: boxes.profileBox, profile: profile))
        .thenReturn(true);
    // act
    final result = dataSourceLocalImpl.setProfileInformation(profile: profile);
    // assert
    expect(result, true);
    verify(mockHiveService.saveProfileSetting(
        boxName: boxes.profileBox, profile: profile));
  });

  test('should initialize application', () async {
    // arrange
    // act
    dataSourceLocalImpl.initializeApplication();
    // assert
    verify(mockHiveService.initializeApplication());
  });
}
