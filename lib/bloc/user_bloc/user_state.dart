part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final AccountInfo accountInfo;

  const UserSuccess(this.accountInfo);
  @override
  List<Object> get props => [accountInfo];
}

class UserError extends UserState {}

class UploadingAvatarFailed extends UserState {}

class UpdateInfoFailed extends UserState {}
