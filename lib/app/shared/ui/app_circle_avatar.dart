import 'package:flutter/material.dart';

class AppCircleAvatar extends StatelessWidget {
  const AppCircleAvatar({super.key, required this.url, this.backgroundColor});

  final String url;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      minRadius: 40,
      maxRadius: 50,
      backgroundColor: backgroundColor,
      child: CircleAvatar(
        backgroundImage: NetworkImage(url),
        minRadius: 38,
        maxRadius: 48,
      ),
    );
  }
}
