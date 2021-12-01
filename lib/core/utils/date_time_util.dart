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

  String getHourMinuteString(DateTime dateTime) {
    int hour = dateTime.hour == 0 ? 12 : dateTime.hour;
    int minute = dateTime.minute;
    String suffix = dateTime.hour >= 12 ? "Pm" : "Am";
    return "${hour.toString()} : ${minute.toString().padRight(2, '0')} $suffix";
  }
}
