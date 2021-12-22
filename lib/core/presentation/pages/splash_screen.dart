import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myfinance/core/presentation/pages/main_screen.dart';
import 'package:myfinance/core/presentation/widgets/drop_down.dart';
import 'package:myfinance/features/registration/presentation/pages/infographic_page.dart';
import 'package:flutter/services.dart';
import 'package:myfinance/services/hive_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final bool _isApplicationInitialized;
  @override
  void initState() {
    // Removes keyboard when splash
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    _isApplicationInitialized = HiveService()
        .getBox(boxName: boxes.initializationBox)
        .get("isInitialized");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7E56B3),
      body: SafeArea(
        child: _splashScreenStructre(),
      ),
    );
  }

  Widget _splashScreenStructre() {
    return InkWell(
      onTap: () {
        _isApplicationInitialized
            ? Navigator.pushNamed(context, MainScreen.routeName)
            : Navigator.pushNamed(context, InfoGraphicScreen.routeName);
      },
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / 20,
            right: MediaQuery.of(context).size.width / 20,
            top: MediaQuery.of(context).size.height / 6,
            bottom: MediaQuery.of(context).size.height / 40),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SvgPicture.asset('assets/images/splashImage.svg'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Note that the application is offline.",
                  style:
                      TextStyle(height: 1.5, fontSize: 10, color: Colors.white),
                ),
                Text(
                  "All data saved will be deleted if application is deleted as well.",
                  style:
                      TextStyle(height: 1.5, fontSize: 10, color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
