import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myfinance/core/config/app_config.dart';

class SettingProfileBlock extends StatelessWidget {
  final double widgetHeight;
  final double widgetWidth;
  const SettingProfileBlock(
      {Key? key, required this.widgetHeight, required this.widgetWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Padding(
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: widgetHeight / 40),
                    ),
                    RichText(
                      text: const TextSpan(
                          text: "Name: ",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: "Mandip Rai",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: widgetHeight / 80),
                    ),
                    RichText(
                      text: const TextSpan(
                          text: "Salary: ",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: "17,000 Rps",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: widgetHeight / 80),
                    ),
                    RichText(
                      text: const TextSpan(
                        text: "Pay day: ",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: "17th",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration:
                      const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                      color: transBlack,
                      offset: Offset(0, 4),
                      blurRadius: 6,
                    ),
                  ]),
                  child: CircleAvatar(
                    maxRadius: widgetHeight / 16,
                    backgroundImage:
                        const AssetImage("assets/images/demoPic.png"),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            right: widgetWidth / 20,
          ),
          child: Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: transBlack,
                    offset: Offset(0, 4),
                    blurRadius: 6,
                  )
                ]),
            child: Center(
              child: SvgPicture.asset("assets/icons/editIcon.svg"),
            ),
          ),
        )
      ],
    );
  }
}
