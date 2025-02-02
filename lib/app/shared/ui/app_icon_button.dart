import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:general_app/app/shared/index.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    required this.text,
    required this.icon,
    this.onPressed,
    this.width,
    this.height,
    this.borderRadius,
    this.isLoading = false,
    super.key,
  });

  final String text;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Widget icon;
  final bool isLoading;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width ?? 240, height ?? 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            borderRadius ?? 12,
          ),
        ),
      ),
      child: Wrap(
        children: <Widget>[
          const AppIcon(iconData: FontAwesomeIcons.rightFromBracket, size: 24),
          const SizedBox(
            width: 10,
          ),
          AppText(text: text),
        ],
      ),
    );
  }
}
