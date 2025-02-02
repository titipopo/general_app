
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general_app/app/features/calendar/cubit/calendar_cubit.dart';
import 'package:general_app/app/features/calendar/ui/day_view.dart';
import 'package:general_app/app/features/calendar/ui/month_view.dart';
import 'package:general_app/app/shared/index.dart';
import 'package:general_app/l10n/l10n.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});
  @override
  State<CalendarScreen> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarState>(builder: (_, state) {
      return Column(children: [
        AppPageHeader(name: AppLocalizations.of(context).calendar),
        Expanded(child: DayView(now: state.dateTime)),
        //DayView(now: state.dateTime),
        Expanded(
            child: MonthView(
          now: state.dateTime,
          days: state.days,
          index: state.index
        )),
      ]);
    });
  }
}