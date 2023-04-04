part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent(this.email, this.password);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CheckTokenEvent extends AuthEvent {
  final String? accessTokenStorage;
  final String? refreshTokenStorage;

  const CheckTokenEvent(this.accessTokenStorage, this.refreshTokenStorage);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LogoutEvent extends AuthEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
