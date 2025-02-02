import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SettingsModel with EquatableMixin {
  final Locale locale;
  final ThemeMode themeMode;

  const SettingsModel({
    required this.locale,
    required this.themeMode,
  });

  static const settingsDefault =
      SettingsModel(locale: Locale('en'), themeMode: ThemeMode.system);

  @override
  List<Object?> get props => [locale, themeMode];
}
