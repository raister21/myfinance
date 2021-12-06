import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myfinance/core/config/app_config.dart';

class MonthlySingleDate extends StatelessWidget {
  final double widgetWidth;
  final double widgetHeight;
  final bool isSelected;
  const MonthlySingleDate({
    Key? key,
    required this.widgetWidth,
    required this.widgetHeight,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? transWhite : transBlack,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: widgetWidth / 20,
        vertical: widgetHeight / 40,
      ),
      child: Column(
        children: const [
          Text(
            "18",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            "Fri",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
