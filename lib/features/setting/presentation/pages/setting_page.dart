import 'package:flutter/material.dart';
import 'package:myfinance/features/setting/presentation/widgets/setting_goal_block.dart';
import 'package:myfinance/features/setting/presentation/widgets/setting_profile_block.dart';
import 'package:myfinance/features/setting/presentation/widgets/setting_system_block.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return _settingPageStructure(context);
  }

  Widget _settingPageStructure(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width / 20,
          MediaQuery.of(context).size.height / 40,
          MediaQuery.of(context).size.width / 20,
          0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Setting",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.normal,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 40,
              ),
            ),
            SettingProfileBlock(
              widgetHeight: MediaQuery.of(context).size.height,
              widgetWidth: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 40,
              ),
            ),
            SettingGoalBlock(
              widgetHeight: MediaQuery.of(context).size.height,
              widgetWidth: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 40,
              ),
            ),
            SettingSystemBlock(
              widgetHeight: MediaQuery.of(context).size.height,
              widgetWidth: MediaQuery.of(context).size.width,
            ),
          ],
        ),
      ),
    );
  }
}
