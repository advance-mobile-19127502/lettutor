import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lettutor/models/from_api/account_info.dart';
import 'package:lettutor/repositories/auth_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  AuthRepository repository;
  RegisterBloc(this.repository) : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) async {
      emit(RegisterLoading());
      try {
        AccountInfo accountInfo =
            await repository.register(event.email, event.password);
        emit(RegisterSuccess(accountInfo));
      } catch (error) {
        emit(RegisterFailure(error.toString()));
      }
    });
  }
}
