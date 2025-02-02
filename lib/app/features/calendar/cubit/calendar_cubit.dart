import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general_app/app/features/calendar/models/day_model.dart';
import 'package:general_app/app/shared/index.dart';

part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit()
      : super(CalendarState(dateTime: _now, index: 0, days: const [])) {
    _initial();
  }

  static final _now = DateTime.now();
  final bool _isDarkMode =
      PlatformDispatcher.instance.platformBrightness == Brightness.dark;

  void changeMonth(DateTime dateTime, int index) {
    final List<DayModel> days = _getDaysInMonth(_isDarkMode, dateTime);
    emit(state.copyWith(dateTime: dateTime, index: index, days: days));
  }

  void changeDay(DateTime dateTime, int index) {
    emit(state.copyWith(dateTime: dateTime, index: index));
  }

  void _initial() {
    final List<DayModel> days = _getDaysInMonth(_isDarkMode, _now);
    int index = days.indexWhere(
        (item) => item.fulldate == DateTime(_now.year, _now.month, _now.day));
    emit(state.copyWith(dateTime: _now, index: index, days: days));
  }

  List<DayModel> _getDaysInMonth(bool isDarkMode, DateTime now) {
    final List<DayModel> days = [];

    final firstDayOfMonth = DateTime.utc(now.year, now.month, 1);
    final int startDayIndex = firstDayOfMonth.weekday;

    int previousMonthLastDay =
        DateTime.utc(now.year, now.month, 0).day + 1 - startDayIndex;
    for (int i = 0; i < startDayIndex; i++) {
      final color = _getColors(days, isDarkMode, now, previousMonthLastDay,
          currentMonth: false);
      days.add(_buildDayModel(
        day: '$previousMonthLastDay',
        color: color,
        date: DateTime(now.year, now.month, previousMonthLastDay),
      ));
      previousMonthLastDay += 1;
    }

    for (int i = 1; i <= DateUtils.getDaysInMonth(now.year, now.month); i++) {
      final color = _getColors(days, isDarkMode, now, i);
      days.add(_buildDayModel(
        day: '$i',
        color: color,
        date: DateTime(now.year, now.month, i),
      ));
    }

    // final totalDays = (days.length / 7).ceil() * 7;
    const totalDays = 42;
    final remainingDays = totalDays - days.length;

    int nextMonthFirstDay = 1;
    for (int i = 0; i < remainingDays; i++) {
      final color = _getColors(days, isDarkMode, now, nextMonthFirstDay,
          currentMonth: false);
      days.add(_buildDayModel(
        day: '$nextMonthFirstDay',
        color: color,
        date: DateTime(now.year, now.month + 1, nextMonthFirstDay),
      ));
      nextMonthFirstDay += 1;
    }

    return days;
  }

  Color _getColors(
      List<DayModel> days, bool isDarkMode, DateTime date, int loop,
      {bool currentMonth = true}) {
    Color color;
    switch (days.length % 7) {
      // Saturday
      case 6:
        color = currentMonth ? AppColors.blue : AppColors.blue.withOpacity(0.4);
        break;
      // Sunday
      case 0:
        color =
            currentMonth ? AppColors.tomato : AppColors.tomato.withOpacity(0.4);
        break;
      default:
        color = isDarkMode
            ? (currentMonth
                ? AppColors.lightGrey
                : AppColors.white.withOpacity(0.4))
            : (currentMonth
                ? AppColors.darkGrey
                : AppColors.black.withOpacity(0.4));
        break;
    }

    return color;
  }

  DayModel _buildDayModel({
    required String day,
    required Color color,
    required DateTime date,
  }) {
    return DayModel(
      day: day,
      color: color,
      fulldate: date,
    );
  }
}
