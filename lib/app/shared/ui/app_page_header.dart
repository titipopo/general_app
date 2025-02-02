import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:general_app/app/shared/constants/app_sizes.dart';
import 'package:general_app/app/shared/ui/app_text.dart';
import 'package:general_app/core/index.dart';

class AppPageHeader extends StatelessWidget {
  const AppPageHeader({super.key, required this.name, this.child});

  final String name;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: context.width,
        padding: EdgeInsets.symmetric(
            horizontal: AppSizes.s20, vertical: AppSizes.s10),
        margin: EdgeInsets.only(bottom: AppSizes.s10),
        decoration: BoxDecoration(
          color: context.appTheme.colorScheme.surface,
        ),
        child: Row(children: [
          Visibility(visible: child != null, child: child ?? const SizedBox()),
          FittedBox(
              child: AppText(
                  text: name, fontWeight: FontWeight.bold, size: AppSizes.s34))
        ]));
  }
}
