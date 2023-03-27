part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class Authenticated extends AuthState {
  final AccountInfo accountInfo;

  const Authenticated(this.accountInfo);
  @override
  List<Object> get props => [];
}

class UnAuthenticated extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);
  @override
  List<Object> get props => [];
}
