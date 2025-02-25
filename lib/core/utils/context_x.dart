import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:general_app/core/themes/custom_theme.dart';

extension ContextX on BuildContext {
  /// Returns same as Theme.of(context)
  // CustomThemes get appTheme => Theme.of(this).extension<CustomThemes>()!;
  ThemeData get appTheme => Theme.of(this);

  /// Returns same as MediaQuery.of(context)
  MediaQueryData get _mediaQuery => MediaQuery.of(this);

  /// Returns if Orientation is landscape
  bool get isLandscape => _mediaQuery.orientation == Orientation.landscape;

  /// Returns same as MediaQuery.of(context).size
  Size get size => _mediaQuery.size;

  /// Returns same as MediaQuery.of(context).size.width
  double get width => size.width;

  /// Returns same as MediaQuery.of(context).height
  double get height => size.height;

  /// Returns diagonal screen pixels
  double get diagonal {
    final s = size;
    return sqrt((s.width * s.width) + (s.height * s.height));
  }
}
