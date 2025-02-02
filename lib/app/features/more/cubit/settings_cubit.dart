import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general_app/app/features/more/models/settings_models.dart';
import 'package:general_app/core/index.dart';

part 'settings_state.dart';

enum Mode { dark, light, system }

enum Language { en, ja, vi }

extension ThemeType on Mode {
  String get type => name;
}

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(const SettingsState(settings: SettingsModel.settingsDefault)) {
    _loadSettings();
  }

  static const String localeKey = '__locale__key__';
  static const String themeKey = '__theme__key__';

  ThemeMode getThemeMode(Mode theme) {
    switch (theme) {
      case Mode.dark:
        return ThemeMode.dark;
      case Mode.light:
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  void _loadSettings() {
    String themeMode = SharedPrefs.getString(themeKey);
    String locale = SharedPrefs.getString(localeKey, Language.en.name);

    Mode theme = Mode.values
        .firstWhere((e) => e.name == themeMode, orElse: () => Mode.system);
    SettingsModel newSettings =
        SettingsModel(locale: Locale(locale), themeMode: getThemeMode(theme));

    emit(state.copyWith(settings: newSettings));
  }

  void changeLanguage(String localeName) {
    String themeMode = SharedPrefs.getString(themeKey);

    Mode theme = Mode.values
        .firstWhere((e) => e.name == themeMode, orElse: () => Mode.system);

    SettingsModel newSettings = SettingsModel(
        locale: Locale(localeName), themeMode: getThemeMode(theme));
    emit(state.copyWith(settings: newSettings));
    SharedPrefs.setString(localeKey, localeName);
  }

  void toggleTheme(Mode theme) async {
    String locale = SharedPrefs.getString(localeKey, Language.en.name);

    SettingsModel newSettings =
        SettingsModel(locale: Locale(locale), themeMode: getThemeMode(theme));
    emit(state.copyWith(settings: newSettings));
    SharedPrefs.setString(themeKey, theme.name);
  }
}
