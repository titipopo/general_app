import 'package:flutter/material.dart';
import 'package:general_app/app/shared/index.dart';

class AppHolizonSection extends StatelessWidget {
  const AppHolizonSection(
      {super.key, required this.label, required this.child});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Flexible(
          child: FittedBox(
              fit: BoxFit.scaleDown,
              child: AppText(
                text: label,
                fontWeight: FontWeight.bold,
              ))),
      Expanded(child: child)
    ]);
  }
}
