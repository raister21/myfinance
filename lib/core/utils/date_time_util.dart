import 'package:flutter/material.dart';

class DateTimeUtil {
  Future<DateTime> pickDate(BuildContext context) async {
    final now = DateTime.now();
    final pickDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year, now.month - 2),
      lastDate: DateTime(now.year, now.month + 2),
    );

    return pickDate!;
  }
}
