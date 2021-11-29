import 'package:flutter/material.dart';
import 'package:myfinance/core/config/app_config.dart';

class GoalIndicatorBar extends StatelessWidget {
  final double widgetWidth;
  const GoalIndicatorBar({Key? key, required this.widgetWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: widgetWidth,
      decoration: BoxDecoration(
          color: red,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0, 4),
                blurRadius: 4)
          ]),
      child: const Text("gg"),
    );
  }
}
