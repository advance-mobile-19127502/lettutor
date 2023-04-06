part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();
}

class SettingsInitial extends SettingsState {
  final String newLanguage;

  const SettingsInitial(this.newLanguage);
  @override
  List<Object> get props => [newLanguage];
}
