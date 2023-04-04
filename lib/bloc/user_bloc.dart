import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lettutor/models/from_api/account_info.dart';
import 'package:lettutor/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository repository;
  AccountInfo? accountInfo;
  UserBloc(this.repository) : super(UserInitial()) {
    on<FetchUserInfo>((event, emit) async {
      emit(UserLoading());
      try {
        accountInfo = await repository.getAccountInfo();
        emit(UserSuccess());
      } catch (error) {
        emit(UserError());
      }
    });
  }
}
