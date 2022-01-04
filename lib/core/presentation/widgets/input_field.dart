import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:myfinance/core/config/app_config.dart';

class InputField extends StatefulWidget {
  const InputField(
      {Key? key,
      required this.widgetWidth,
      required this.header,
      // required this.changeState,
      this.requiredField = false,
      this.keyboardType,
      this.controller})
      : super(key: key);
  final double widgetWidth;
  final String header;
  final TextEditingController? controller;
  final bool? requiredField;
  // final Function(String) changeState;
  final TextInputType? keyboardType;

  @override
  InputFieldState createState() => InputFieldState();
}

class InputFieldState extends State<InputField> {
  final GlobalKey<FormFieldState> formKey = GlobalKey<FormFieldState>();
  bool hasBeenValidatedOnce = false;

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
        SizedBox(
          width: widget.widgetWidth,
          child: TextFormField(
              key: formKey,
              controller: widget.controller,
              style: const TextStyle(fontSize: 14),
              keyboardType: widget.keyboardType,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 12),
                filled: true,
                fillColor: lighterGrey,
                errorStyle: const TextStyle(color: red),
                focusedErrorBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: red, width: 5),
                ),
                errorBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: red, width: 5),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: primary, width: 5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: lighterGrey, width: 5),
                ),
              ),
              validator: MultiValidator(
                [
                  if (widget.requiredField!)
                    RequiredValidator(errorText: "Required *")
                ],
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
                if ((widget.requiredField ?? false) && hasBeenValidatedOnce) {
                  formKey.currentState?.validate();
                }
              }),
        )
      ],
    );
  }

  bool validate() {
    if (widget.requiredField!) {
      bool? validation = formKey.currentState?.validate();
      hasBeenValidatedOnce = true;
      if (validation != null) {
        return validation;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }
}
