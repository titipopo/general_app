import 'package:flutter/material.dart';

class DayModel {
  final String day;
  final String? lunarDay;
  final Color? color;
  final DateTime? fulldate;
  DayModel({
    required this.day,
    this.lunarDay,
    this.color,
    this.fulldate,
  });
}
