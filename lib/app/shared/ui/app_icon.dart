import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,
    required this.iconData,
    this.size,
  });
  final IconData iconData;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return FaIcon(iconData, size: size);
  }
}
