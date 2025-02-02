import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText(
      {super.key,
      required this.text,
      this.size = 20.0,
      this.fontWeight = FontWeight.normal,
      this.color,
      this.decoration});

  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color? color;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
          decoration: decoration),
    );
  }
}
