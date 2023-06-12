import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lettutor/utils/hive_helper.dart';

part 'settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final HiveHelper hiveHelper;
  String languageSelected;

  SettingsBloc(this.hiveHelper, this.languageSelected)
      : super(SettingsInitial(languageSelected)) {
    on<ChangeSettingsEvent>((event, emit) {
      languageSelected = event.languageSelected;
      hiveHelper.saveLanguage(languageSelected);
      emit(SettingsInitial(languageSelected));
    });
  }
}
