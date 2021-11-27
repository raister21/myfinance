import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:myfinance/config/app_config.dart';
import 'package:myfinance/config/validator.dart';

class InputField extends StatefulWidget {
  const InputField(
      {Key? key,
      required this.widgetWidth,
      required this.header,
      required this.changeState,
      this.keyboardType})
      : super(key: key);
  final double widgetWidth;
  final String header;
  final Function(String) changeState;
  final TextInputType? keyboardType;

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
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
        Container(
          width: widget.widgetWidth,
          decoration: BoxDecoration(
            color: lighterGrey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            style: const TextStyle(fontSize: 14),
            keyboardType: widget.keyboardType,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.deny(
                RegExp(r"\s\b|\b\s"),
                replacementString: "",
              ),
              if (widget.keyboardType != null)
                FilteringTextInputFormatter.allow(
                  RegExp(r"^[0-9]*"),
                )
            ],
            onChanged: (value) {
              widget.changeState(value);
            },
          ),
        )
      ],
    );
  }
}
