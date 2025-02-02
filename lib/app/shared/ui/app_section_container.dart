import "package:flutter/material.dart";
import "package:general_app/app/shared/constants/app_sizes.dart";
import "package:general_app/core/index.dart";


class AppSectionContainer extends StatefulWidget {
  const AppSectionContainer({super.key, required this.children});

  final List<Widget> children;
  @override
  State<AppSectionContainer> createState() => _AppSectionContainerState();
}

class _AppSectionContainerState extends State<AppSectionContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: context.width * 0.9,
        margin: EdgeInsets.symmetric(vertical: AppSizes.s10),
        padding: EdgeInsets.symmetric(
            horizontal: AppSizes.s20, vertical: AppSizes.s5),
        decoration: BoxDecoration(
            color: context.appTheme.colorScheme.surface,
            borderRadius: BorderRadius.all(Radius.circular(AppSizes.s30))),
        child: Column(children: widget.children));
  }
}
