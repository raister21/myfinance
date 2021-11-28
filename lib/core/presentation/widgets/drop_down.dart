import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myfinance/core/config/app_config.dart';

import 'package:myfinance/features/registration/presentation/bloc/registration/registration_bloc_bloc.dart';

class DropDown extends StatefulWidget {
  final List<dynamic> items;
  final Function(dynamic) callBack;
  final double widgetWidth;
  final String header;
  final String displayText;
  final bool? disabled;
  const DropDown(
      {Key? key,
      required this.items,
      required this.callBack,
      required this.widgetWidth,
      required this.header,
      required this.displayText,
      this.disabled = false})
      : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
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
        IgnorePointer(
          ignoring: widget.disabled!,
          child: Container(
            width: widget.widgetWidth,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: lighterGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButton<dynamic>(
              isExpanded: true,
              hint: Text(
                widget.displayText,
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ),
              icon: Align(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset("assets/icons/navigationArrow.svg")),
              items: getItems(list: widget.items),
              underline: Container(),
              onChanged: (value) {
                widget.callBack(value);
              },
            ),
          ),
        ),
      ],
    );
  }
}

List<DropdownMenuItem> getItems({required List<dynamic> list}) {
  List<DropdownMenuItem> dropDownItems = [];

  for (dynamic item in list) {
    String displayName = item.toString();
    if (item.runtimeType == AutomaticSavingOption) {
      displayName = (item as AutomaticSavingOption).name;
    }
    dropDownItems.add(DropdownMenuItem(
        value: item,
        child: Text(
          displayName,
          style: const TextStyle(fontSize: 14, color: Colors.black),
        )));
  }

  return dropDownItems;
}
