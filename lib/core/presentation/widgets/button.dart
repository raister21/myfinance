import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myfinance/config/app_config.dart';

class CustomButton extends StatelessWidget {
  final Function onClickEvent;
  final double widgetWidth;
  final double widgetHeight;
  final String buttonName;
  const CustomButton(
      {Key? key,
      required this.onClickEvent,
      required this.widgetWidth,
      required this.widgetHeight,
      required this.buttonName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClickEvent();
      },
      child: Container(
        width: widgetWidth,
        padding: EdgeInsets.symmetric(
            vertical: widgetHeight / 50, horizontal: widgetWidth / 20),
        decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            buttonName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
