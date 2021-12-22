import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myfinance/features/registration/domain/entities/profile.dart';

enum boxes { initializationBox, profileBox }

class HiveService {
  Future<void> initHive() async {
    await Hive.initFlutter();
    registerTypeAdapters();

    if (!Hive.isBoxOpen(boxes.initializationBox.toString())) {
      Box _box = await Hive.openBox(boxes.initializationBox.toString());
      _box.put("isInitialized", false);
    }
  }

  void registerTypeAdapters() {
    // register adpates here
  }

  Box getBox({required boxes boxName}) {
    return Hive.box(boxName.toString());
  }

  void clearBox({required boxes boxName}) {
    Box _box = getBox(boxName: boxName);
    _box.clear();
  }

  void saveProfileSetting({required boxes boxName, required Profile profile}) {
    Box _box = HiveService().getBox(boxName: boxName);
    clearBox(boxName: boxName);
    _box.put("profile", profile);
  }

  bool isApplicationInitialized() {
    Box _box = HiveService().getBox(boxName: boxes.initializationBox);
    bool isInitialized = _box.get("isInitialized") == null ? false : true;
    return isInitialized;
  }
}
