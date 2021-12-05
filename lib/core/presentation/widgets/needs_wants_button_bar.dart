import 'package:flutter/material.dart';
import 'package:myfinance/core/config/app_config.dart';

class NeedsWantsButtonBar extends StatelessWidget {
  final double widgetHeight;
  final double widgetWidth;
  const NeedsWantsButtonBar(
      {Key? key, required this.widgetHeight, required this.widgetWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Container(
              width: widgetWidth,
              padding: EdgeInsets.symmetric(
                  vertical: widgetHeight / 50, horizontal: widgetWidth / 20),
              decoration: BoxDecoration(
                color: red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "Needs",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: widgetWidth / 20,
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Container(
              width: widgetWidth,
              padding: EdgeInsets.symmetric(
                  vertical: widgetHeight / 50, horizontal: widgetWidth / 20),
              decoration: BoxDecoration(
                color: blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "Wants",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
