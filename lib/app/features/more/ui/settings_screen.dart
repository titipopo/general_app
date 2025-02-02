import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general_app/app/features/index.dart';
import 'package:general_app/app/features/more/cubit/settings_cubit.dart';
import 'package:general_app/app/shared/index.dart';
import 'package:general_app/l10n/l10n.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SettingsView();
  }
}

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  Mode _lightMode = Mode.light;
  String language = "";

  String getlanguageName(String locale) {
    switch (locale) {
      case "en":
        return AppLocalizations.of(context).en;
      case "vi":
        return AppLocalizations.of(context).vi;
      case "ja":
        return AppLocalizations.of(context).ja;
      default:
        return AppLocalizations.of(context).en;
    }
  }

  Mode getThemeMode(ThemeMode locale) {
    switch (locale) {
      case ThemeMode.light:
        return Mode.light;
      case ThemeMode.dark:
        return Mode.dark;
      default:
        return Mode.system;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = context.isDarkMode;
    ThemeMode themeMode = context.themeMode;
    _lightMode = getThemeMode(themeMode);
    language = getlanguageName(Localizations.localeOf(context).toString());
    return AppScaffold(
        child: SafeArea(
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(children: [
                  AppPageHeader(
                    name: AppLocalizations.of(context).settings,
                    child: IconButton(
                        onPressed: () {
                          context.go(AppRouters.more);
                        },
                        icon: const AppIcon(iconData: Icons.navigate_before)),
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AppText(
                                  text: AppLocalizations.of(context).theme,
                                  fontWeight: FontWeight.bold,),
                            ],
                          ),
                          AppSectionContainer(children: [
                            AppHolizonSection(
                              label: AppLocalizations.of(context).light,
                              child: Radio<Mode>(
                                value: Mode.light,
                                groupValue: _lightMode,
                                onChanged: (Mode? value) {
                                  setState(() {
                                    _lightMode = value!;
                                  });
                                  context
                                      .read<SettingsCubit>()
                                      .toggleTheme(_lightMode);
                                },
                              ),
                            ),
                            AppHolizonSection(
                              label: AppLocalizations.of(context).dark,
                              child: Radio<Mode>(
                                value: Mode.dark,
                                groupValue: _lightMode,
                                onChanged: (Mode? value) {
                                  setState(() {
                                    _lightMode = value!;
                                  });
                                  context
                                      .read<SettingsCubit>()
                                      .toggleTheme(_lightMode);
                                },
                              ),
                            ),
                            AppHolizonSection(
                              label: AppLocalizations.of(context).system,
                              child: Radio<Mode>(
                                value: Mode.system,
                                groupValue: _lightMode,
                                onChanged: (Mode? value) {
                                  setState(() {
                                    _lightMode = value!;
                                  });
                                  context
                                      .read<SettingsCubit>()
                                      .toggleTheme(_lightMode);
                                },
                              ),
                            )
                          ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AppText(
                                  text: AppLocalizations.of(context)
                                      .languageSetting,
                                  fontWeight: FontWeight.bold,),
                            ],
                          ),
                          AppSectionContainer(children: [
                            AppHolizonSection(
                                label: AppLocalizations.of(context).language,
                                child: Row(children: [
                                  AppText(text: language),
                                  PopupMenuButton<Language>(
                                    color: isDarkMode
                                        ? AppColors.black2
                                        : AppColors.white2,
                                    elevation: 10,
                                    shadowColor: isDarkMode
                                        ? AppColors.white
                                        : AppColors.black,
                                    popUpAnimationStyle:
                                        AnimationStyle.noAnimation,
                                    icon: const AppIcon(
                                        iconData: Icons.navigate_next),
                                    onSelected: (Language item) {
                                      switch (item) {
                                        case Language.en:
                                          context
                                              .read<SettingsCubit>()
                                              .changeLanguage(item.name);
                                        case Language.vi:
                                          context
                                              .read<SettingsCubit>()
                                              .changeLanguage(item.name);
                                        case Language.ja:
                                          context
                                              .read<SettingsCubit>()
                                              .changeLanguage(item.name);
                                      }
                                    },
                                    itemBuilder: (BuildContext context) =>
                                        <PopupMenuEntry<Language>>[
                                      PopupMenuItem<Language>(
                                        value: Language.en,
                                        child: AppText(
                                            text: AppLocalizations.of(context)
                                                .en),
                                      ),
                                      PopupMenuItem<Language>(
                                        value: Language.vi,
                                        child: AppText(
                                            text: AppLocalizations.of(context)
                                                .vi),
                                      ),
                                      PopupMenuItem<Language>(
                                        value: Language.ja,
                                        child: AppText(
                                            text: AppLocalizations.of(context)
                                                .ja),
                                      ),
                                    ],
                                  ),
                                ]))
                          ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AppText(
                                  text: AppLocalizations.of(context).about,
                                  fontWeight: FontWeight.bold,),
                            ],
                          ),
                          AppSectionContainer(children: [
                            AppHolizonSection(
                                label: AppLocalizations.of(context).version,
                                child: AppText(
                                  text: AppLocalizations.of(context).versionNo,
                                )),
                            const Divider(),
                            AppHolizonSection(
                              label: AppLocalizations.of(context).auth,
                              child: AppText(
                                  text:
                                      AppLocalizations.of(context).authorName),
                            )
                          ]),
                        ],
                      )),
                ]))));
  }
}
