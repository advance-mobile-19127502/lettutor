import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lettutor/models/from_api/account_info.dart';
import 'package:lettutor/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository repository;
  AuthBloc(this.repository) : super(UnAuthenticated()) {
    on<LoginEvent>((event, emit) async {
      if (state is UnAuthenticated || state is AuthError) {
        emit(AuthLoading());
        try {
          AccountInfo accountInfo =
              await repository.login(event.email, event.password);
          emit(Authenticated(accountInfo));
        } catch (err) {
          emit(AuthError(err.toString()));
        }
      }
    });
  }
}
