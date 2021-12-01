import 'package:flutter/material.dart';
import 'package:myfinance/core/config/app_config.dart';
import 'package:myfinance/core/utils/date_time_util.dart';

class InputItem extends StatefulWidget {
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
  State<InputItem> createState() => _InputItemState();
}

class _InputItemState extends State<InputItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: widget.widthPadding,
        vertical: widget.heightPadding,
      ),
      child: Row(
        children: [
          Flexible(
            flex: 4,
            child: CircleAvatar(
              minRadius: widget.widthPadding * 1.5,
              maxRadius: widget.widthPadding * 2,
              backgroundColor: darkGrey,
              backgroundImage: AssetImage(widget.imagePath!),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: widget.widthPadding),
          ),
          Flexible(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.itemName,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                widget.location != null
                    ? Text(
                        widget.location!,
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
                  DateTimeUtil().getHourMinuteString(widget.timeOfTranscation),
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
              "${AppConfig().numberFormat.format(widget.transactionAmount)} Rps",
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 20,
                color: widget.transactionType ? red : green,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
