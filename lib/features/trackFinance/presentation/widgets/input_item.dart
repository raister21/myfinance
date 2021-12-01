import 'package:flutter/material.dart';
import 'package:myfinance/core/config/app_config.dart';
import 'package:myfinance/core/utils/date_time_util.dart';

class InputItem extends StatelessWidget {
  final double widthPadding;
  final double heightPadding;
  final String? imagePath;
  final String itemName;
  final String? location;
  final DateTime timeOfTranscation;
  final double transactionAmount;
  final bool transactionType;
  const InputItem({
    Key? key,
    required this.widthPadding,
    required this.heightPadding,
    this.imagePath = "assets/images/foodIcon.png",
    required this.itemName,
    this.location,
    required this.timeOfTranscation,
    required this.transactionAmount,
    required this.transactionType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: widthPadding,
        vertical: heightPadding,
      ),
      child: Row(
        children: [
          Flexible(
            flex: 4,
            child: CircleAvatar(
              minRadius: widthPadding * 1.5,
              maxRadius: widthPadding * 2,
              backgroundColor: darkGrey,
              backgroundImage: AssetImage(imagePath!),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: widthPadding),
          ),
          Flexible(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemName,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                location != null
                    ? Text(
                        location!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          color: grey,
                          fontWeight: FontWeight.w200,
                          height: 1.5,
                        ),
                      )
                    : Container(),
                Text(
                  DateTimeUtil().getHourMinuteString(timeOfTranscation),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    color: grey,
                    height: 1.5,
                    fontWeight: FontWeight.w200,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              "${transactionAmount.toInt().toString()} Rps",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 20,
                color: transactionType ? red : green,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
