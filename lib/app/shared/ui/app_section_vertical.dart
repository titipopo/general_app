import 'package:flutter/material.dart';
import 'package:general_app/app/shared/constants/app_sizes.dart';

class VerticalSection extends StatelessWidget {
  const VerticalSection(
      {super.key, required this.label, required this.child, this.isInput});

  final String label;
  final Widget child;
  final bool? isInput;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              margin: EdgeInsets.all(AppSizes.s5),
              child: Text(label,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: AppSizes.s18)))
        ],
      ),
      isInput == null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [child],
            )
          : child,
    ]);
  }
}
