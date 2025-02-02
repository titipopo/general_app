import 'package:flutter/material.dart';

@immutable
class CustomThemes extends ThemeExtension<CustomThemes> {
  const CustomThemes(
      {required this.backgroundColor,
      required this.buttonColor,
      required this.errorColor,
      required this.iconColor,
      required this.loadingIndicatorColor,
      required this.primaryColor,
      required this.outlineColor,
      required this.secondaryColor,
      required this.textColor,
      required this.unselectedColor});

  final Color? backgroundColor;
  final Color? buttonColor;
  final Color? errorColor;
  final Color? iconColor;
  final Color? loadingIndicatorColor;
  final Color? primaryColor;
  final Color? outlineColor;
  final Color? secondaryColor;
  final Color? textColor;
  final Color? unselectedColor;

  // the light theme
  static const light = CustomThemes(
    backgroundColor: Color(0xFFF3F4F6),
    buttonColor: Colors.white,
    errorColor: Colors.red,
    iconColor: Color(0xFF0891B2),
    loadingIndicatorColor: Colors.white,
    primaryColor: Color(0xFFF3F4F6),
    outlineColor: Color(0xFF0891B2),
    secondaryColor: Colors.white,
    textColor: Colors.black,
    unselectedColor: Colors.grey,
  );

  // the dark theme
  static const dark = CustomThemes(
    backgroundColor: Color(0xFF363A46),
    buttonColor: Color(0xFF151A28),
    errorColor: Colors.red,
    iconColor: Color(0xFF0891B2),
    loadingIndicatorColor: Colors.white,
    primaryColor: Color(0xFF151A28),
    outlineColor: Color(0xFF0891B2),
    secondaryColor: Color(0xFF363A46),
    textColor: Colors.white,
    unselectedColor: Colors.grey,
  );

  @override
  ThemeExtension<CustomThemes> copyWith(
      {Color? backgroundColor,
      Color? buttonColor,
      Color? errorColor,
      Color? iconColor,
      Color? loadingIndicatorColor,
      Color? primaryColor,
      Color? outlineColor,
      Color? secondaryColor,
      Color? textColor,
      Color? unselectedColor}) {
    return CustomThemes(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      buttonColor: buttonColor ?? this.buttonColor,
      errorColor: errorColor ?? this.errorColor,
      iconColor: iconColor ?? this.iconColor,
      loadingIndicatorColor: loadingIndicatorColor ?? this.loadingIndicatorColor,
      primaryColor: primaryColor ?? this.primaryColor,
      outlineColor: outlineColor ?? this.outlineColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      textColor: textColor ?? this.textColor,
      unselectedColor: unselectedColor ?? this.unselectedColor,
    );
  }

  @override
  ThemeExtension<CustomThemes> lerp(
      covariant ThemeExtension<CustomThemes>? other, double t) {
    if (other is! CustomThemes) {
      return this;
    }
    return CustomThemes(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      buttonColor: Color.lerp(buttonColor, other.buttonColor, t),
      errorColor: Color.lerp(errorColor, other.errorColor, t),
      iconColor: Color.lerp(iconColor, other.iconColor, t),
      loadingIndicatorColor: Color.lerp(loadingIndicatorColor, other.loadingIndicatorColor, t),
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
      outlineColor: Color.lerp(outlineColor, other.outlineColor, t),
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t),
      textColor: Color.lerp(textColor, other.textColor, t),
      unselectedColor: Color.lerp(unselectedColor, other.unselectedColor, t),
    );
  }
}
