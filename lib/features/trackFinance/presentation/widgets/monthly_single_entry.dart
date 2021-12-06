import 'package:flutter/material.dart';
import 'package:myfinance/core/config/app_config.dart';

class MonthlySingleEntry extends StatelessWidget {
  final double widgetHeight;
  final double widgetWidth;
  final Function onTapCallBack;
  const MonthlySingleEntry(
      {Key? key,
      required this.widgetHeight,
      required this.widgetWidth,
      required this.onTapCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapCallBack();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: widgetHeight / 50,
          horizontal: widgetWidth / 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Flexible(
              flex: 1,
              child: Text(
                "12 Am",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Text(
                "Momo",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Text(
                "Needs",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Text(
                "100 Rps",
                style: TextStyle(
                  fontSize: 12,
                  color: red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
