import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:general_app/app/features/calendar/cubit/calendar_cubit.dart';
import 'package:general_app/app/features/calendar/models/day_model.dart';
import 'package:general_app/app/shared/index.dart';
import 'package:general_app/core/index.dart';
import 'package:general_app/l10n/l10n.dart';

class MonthView extends StatefulWidget {
  const MonthView(
      {super.key, required this.now, required this.days, required this.index});

  final DateTime now;
  final List<DayModel> days;
  final int index;

  @override
  State<MonthView> createState() => _MonthViewState();
}

class _MonthViewState extends State<MonthView> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    String language = Localizations.localeOf(context).toString();
    List<DayModel> days = widget.days;

    return Container(
        padding: EdgeInsets.all(AppSizes.s5),
        margin: EdgeInsets.all(AppSizes.s5),
        decoration: BoxDecoration(
          color: context.appTheme.colorScheme.surface,
          borderRadius: BorderRadius.all(Radius.circular(AppSizes.s20)),
        ),
        child: Column(
          children: [
            _buildMonthHeader(context, language),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:
                    List.generate(DateStrings.shortWeekdays.length, (index) {
                  return Expanded(
                      child: Center(
                          child: AppText(
                    text: DateStrings.shortWeekdays[index],
                    fontWeight: FontWeight.bold,
                  )));
                })),
            Expanded(child: _buildGridView(context, days)),
          ],
        ));
  }

  Widget _buildMonthHeader(BuildContext context, String language) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildNavigationButton(context, -1),
        AppText(
          text: _buildMonthYearText(context, language),
          size: AppSizes.s24,
          fontWeight: FontWeight.bold,
        ),
        _buildNavigationButton(context, 1),
      ],
    );
  }

  Widget _buildNavigationButton(BuildContext context, int monthOffset) {
    return GestureDetector(
      onTap: () => context.read<CalendarCubit>().changeMonth(
          DateTime(
            widget.now.year,
            widget.now.month + monthOffset,
            widget.now.day,
          ),
          _index),
      child: AppIcon(
        iconData:
            // monthOffset == -1 ? Icons.navigate_before : Icons.navigate_next,
            monthOffset == -1 ? FontAwesomeIcons.chevronLeft : FontAwesomeIcons.chevronRight,
      ),
    );
  }

  String _buildMonthYearText(BuildContext context, String language) {
    int monthIndex = widget.now.month - 1;
    String month = language == "en"
        ? DateStrings.months[monthIndex]
        : '${widget.now.month}'.padLeft(2, '0');
    return AppLocalizations.of(context).calendarYM(month, '${widget.now.year}');
  }

  Widget _buildGridView(BuildContext context, List<DayModel> days) {
    _index = widget.index;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7, childAspectRatio: 1.5),
      itemCount: days.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => context
              .read<CalendarCubit>()
              .changeDay(days[index].fulldate!, index),
          child: Container(
            padding: EdgeInsets.all(AppSizes.s5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (days[index].fulldate?.month == DateTime.now().month &&
                      days[index].fulldate?.day == DateTime.now().day)
                  ? context.appTheme.colorScheme.primary
                  : context.appTheme.colorScheme.surface,
              border: index == _index
                  ? Border.all(
                      width: 2.0, color: context.appTheme.colorScheme.outline)
                  : Border.all(width: 2.0, color: AppColors.transparent),
            ),
            child: Center(
              child: AppText(
                text: days[index].day,
                color: days[index].color,
              ),
            ),
          ),
        );
      },
    );
  }
}
