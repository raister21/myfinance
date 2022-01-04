import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:myfinance/features/registration/domain/entities/profile.dart';

enum boxes { initializationBox, profileBox }

@Injectable()
class HiveService {
  Future<void> initHive() async {
    await Hive.initFlutter();
    registerTypeAdapters();

    // TODO: OPEN BOX FUNCTION
    await openboxes();
  }

  Future<void> openboxes() async {
    await Hive.openBox(boxes.initializationBox.toString());
    await Hive.openBox(boxes.profileBox.toString());
  }

  void registerTypeAdapters() {
    Hive.registerAdapter(ProfileAdapter());
  }

  Box getBox({required boxes boxName}) {
    return Hive.box(boxName.toString());
  }

  void clearBox({required boxes boxName}) {
    Box _box = getBox(boxName: boxName);
    _box.clear();
  }

  bool saveProfileSetting({required boxes boxName, required Profile profile}) {
    try {
      Box _box = HiveService().getBox(boxName: boxName);
      clearBox(boxName: boxName);
      _box.put("profile", profile);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool isApplicationInitialized() {
    Box _box = HiveService().getBox(boxName: boxes.initializationBox);
    bool isInitialized = _box.get("isInitialized") == null ? false : true;
    return isInitialized;
  }

  void initializeApplication() {
    Box _box = HiveService().getBox(boxName: boxes.initializationBox);
    _box.put("isInitialized", true);
  }
}
