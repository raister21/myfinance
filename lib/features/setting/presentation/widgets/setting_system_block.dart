import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myfinance/core/config/app_config.dart';

class SettingSystemBlock extends StatelessWidget {
  final double widgetHeight;
  final double widgetWidth;
  const SettingSystemBlock(
      {Key? key, required this.widgetHeight, required this.widgetWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Container(
        padding: EdgeInsets.only(
          top: widgetHeight / 30,
          bottom: widgetHeight / 20,
          left: widgetWidth / 20,
          right: widgetWidth / 20,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          color: transBlack,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "System",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: widgetHeight / 40),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Auto increment salary",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "17 th",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/icons/navigationArrowRight.svg",
                      color: Colors.white,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
