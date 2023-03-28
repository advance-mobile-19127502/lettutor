import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lettutor/repositories/user_repository.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  UserRepository repository;
  ForgotPasswordBloc(this.repository) : super(ForgotPasswordInitial()) {
    on<ForgotPasswordEvent>((event, emit) async {
      emit(ForgotPasswordLoading());
      try {
        await repository.forgotPassword(event.email);
        emit(ForgotPasswordSuccess());
      } catch (error) {
        print("error");
        emit(ForgotPasswordError(error.toString()));
      }
    });
  }
}
