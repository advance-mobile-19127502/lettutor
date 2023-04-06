part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
}

class ChangeSettingsEvent extends SettingsEvent {
  final String languageSelected;

  const ChangeSettingsEvent(this.languageSelected);

  @override
  // TODO: implement props
  List<Object?> get props => [languageSelected];
}
