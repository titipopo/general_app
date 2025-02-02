part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final SettingsModel settings;

  const SettingsState({
    required this.settings,
  });

  SettingsState copyWith({required SettingsModel settings}) =>
      SettingsState(settings: settings);

  @override
  List<Object?> get props => [settings];
}
