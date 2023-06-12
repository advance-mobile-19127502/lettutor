part of 'register_bloc.dart';

class RegisterEvent extends Equatable {
  final String email;
  final String password;
  const RegisterEvent(this.email, this.password);
  @override
  List<Object?> get props => [];
}
