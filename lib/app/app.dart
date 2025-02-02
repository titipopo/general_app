import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general_app/app/features/index.dart';
import 'package:general_app/app/shared/index.dart';
import 'package:general_app/core/index.dart';
import 'package:general_app/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(builder: (context, state) {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'General App',
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: state.settings.themeMode,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        locale: state.settings.locale,
        routerConfig: AppRouterConfig.goRouter,
      );
    });
  }
}
