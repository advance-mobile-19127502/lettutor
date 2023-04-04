import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lettutor/models/from_api/account_info.dart';
import 'package:lettutor/repositories/auth_repository.dart';
import 'package:lettutor/utils/secured_local_storage.dart';

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
          emit(Authenticated(accountInfo.tokens?.access?.token,
              accountInfo.tokens?.refresh?.token));
        } catch (err) {
          print(err);
          emit(AuthError(err.toString()));
        }
      }
    });
    on<CheckTokenEvent>((event, emit) async {
      emit(AuthLoading());

      try {
        SecuredLocalStorage _storage = SecuredLocalStorage();

        await repository.checkAuthentication(
            event.accessTokenStorage, event.refreshTokenStorage);
        if (repository.accessToken != null && repository.refreshToken != null) {
          await _storage.saveString(
              KEY_CONST.ACCESS_TOKEN_KEY, repository.accessToken!);
          await _storage.saveString(
              KEY_CONST.REFRESH_TOKEN_KEY, repository.refreshToken!);
          emit(Authenticated(repository.accessToken, repository.refreshToken));
        } else {
          await _storage.deleteAll();
          emit(UnAuthenticated());
        }
      } catch (error) {
        await SecuredLocalStorage().deleteAll();
        emit(UnAuthenticated());
      }
    });

    on<LogoutEvent>((event, emit) async {
      await SecuredLocalStorage().deleteAll();
      emit(UnAuthenticated());
      repository.accessToken = null;
      repository.refreshToken = null;
    });
  }
}
