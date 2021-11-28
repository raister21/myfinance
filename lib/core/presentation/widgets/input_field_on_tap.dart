import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:myfinance/core/config/app_config.dart';

class InputFieldOnTap extends StatefulWidget {
  final double widgetWidth;
  final String header;
  final Function onClickEvent;
  final SvgPicture? icon;
  final String displayName;

  const InputFieldOnTap({
    Key? key,
    required this.widgetWidth,
    required this.header,
    required this.onClickEvent,
    this.icon,
    required this.displayName,
  }) : super(key: key);

  @override
  State<InputFieldOnTap> createState() => _InputFieldOnTapState();
}

class _InputFieldOnTapState extends State<InputFieldOnTap> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            widget.header,
            style: const TextStyle(
              color: grey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        widget.icon == null
            ? baseInputField()
            : Stack(
                alignment: Alignment.centerRight,
                children: [
                  baseInputField(),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: widget.icon!,
                  )
                ],
              ),
      ],
    );
  }

  Widget baseInputField() {
    return InkWell(
      onTap: () {
        widget.onClickEvent();
      },
      child: Container(
        width: widget.widgetWidth,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        decoration: BoxDecoration(
          color: lighterGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          widget.displayName,
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
