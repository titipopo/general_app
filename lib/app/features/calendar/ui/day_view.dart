import 'package:flutter/material.dart';
import 'package:general_app/app/shared/index.dart';
import 'package:general_app/core/index.dart';

class DayView extends StatefulWidget {
  const DayView({super.key, required this.now});

  final DateTime now;

  @override
  State<DayView> createState() => _DayViewState();
}

class _DayViewState extends State<DayView> {
  late List<dynamic> lunar;
  late int jd;
  late int lunarDay;
  late int lunarMonth;
  late int lunarYear;
  late int isLeap;
  late String dayOfW;
  late String monthName;
  late String yearCanChi;
  late String monthCanChi;
  late String dayCanChi;
  late String hourCanChi;
  late String tietKhi;
  late String dayEvent;
  late String gioHoangDao;

  @override
  Widget build(BuildContext context) {
    lunar = convertSolar2Lunar(
        widget.now.day, widget.now.month, widget.now.year, AppSizes.s7);
    jd = jdFromDate(widget.now.day, widget.now.month, widget.now.year);
    lunarDay = lunar[0];
    lunarMonth = lunar[1];
    lunarYear = lunar[2];
    isLeap = lunar[3];
    dayOfW = getDayOfWeek(jd);
    monthName = getMonthName(lunarMonth, isLeap);
    yearCanChi = getYearCanChi(lunarYear);
    monthCanChi = getMonthCanChi(lunarMonth, lunarYear);
    dayCanChi = getDayCanChi(jd);
    hourCanChi = getHourCanChi(jd);
    tietKhi = getTietKhi(jd);
    dayEvent = getDayInfo(lunarDay, lunarMonth);
    gioHoangDao = getGioHoangDao(jd);
    return Container(
        padding: EdgeInsets.all(AppSizes.s5),
        margin: EdgeInsets.all(AppSizes.s5),
        decoration: BoxDecoration(
          color: context.appTheme.colorScheme.surface,
          borderRadius: BorderRadius.all(Radius.circular(AppSizes.s20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppText(
              text:
                  'Tháng ${'${widget.now.month}'.padLeft(2, '0')} Năm ${widget.now.year}',
              fontWeight: FontWeight.bold,
            ),
            AppText(
              text: '${widget.now.day}',
              fontWeight: FontWeight.bold,
              size: AppSizes.s40,
            ),
            AppText(
              text: dayOfW,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildColumn(monthName, lunarDay.toString(), yearCanChi, null,
                    null, true),
                _buildColumn(
                    monthCanChi, dayCanChi, hourCanChi, tietKhi),
              ],
            ),
            AppText(
              text: dayEvent,
              color: AppColors.tomato,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: AppText(
                  text: gioHoangDao,
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildColumn(String text1, String text2,
      [String? text3, String? text4, double? size, bool isBold = false]) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AppText(text: text1),
        AppText(
          text: text2,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal
        ),
        if (text3 != null) AppText(text: text3),
        if (text4 != null) AppText(text: text4),
      ],
    );
  }
}
