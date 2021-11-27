import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myfinance/features/registration/presentation/pages/infographic_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final double screenHeight;
  late final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7E56B3),
      body: SafeArea(
        child: _splashScreenStructre(),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    super.didChangeDependencies();
  }

  Widget _splashScreenStructre() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, InfoGraphicScreen.routeName);
      },
      child: Container(
        height: screenHeight,
        width: screenWidth,
        padding: EdgeInsets.only(
            left: screenWidth / 20,
            right: screenWidth / 20,
            top: screenHeight / 6,
            bottom: screenHeight / 40),
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
