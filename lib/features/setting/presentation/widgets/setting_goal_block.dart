import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myfinance/core/config/app_config.dart';
import 'package:myfinance/core/presentation/widgets/goal_indicator_bar.dart';

class SettingGoalBlock extends StatelessWidget {
  final double widgetHeight;
  final double widgetWidth;
  const SettingGoalBlock(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Goal",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: widgetHeight / 40),
                ),
                GoalIndicatorBar(widgetWidth: widgetWidth),
                Padding(
                  padding: EdgeInsets.only(top: widgetHeight / 40),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: "Needs: ",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: "50%",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                        text: "Wants: ",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: "30%",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                        text: "Save: ",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: "20%",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
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
