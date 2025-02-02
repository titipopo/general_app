import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general_app/app/features/index.dart';

extension CubitContext on BuildContext {
  ThemeMode get themeMode => read<SettingsCubit>().state.settings.themeMode;
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  // bool get isDarkMode => PlatformDispatcher.instance.platformBrightness == Brightness.dark;
}
