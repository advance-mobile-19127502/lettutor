part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class FetchUserInfo extends UserEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UploadAvatarEvent extends UserEvent {
  final String imagePath;

  const UploadAvatarEvent(this.imagePath);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UpdateInfoEvent extends UserEvent {
  final String name, country, birthDay;

  const UpdateInfoEvent(this.name, this.country, this.birthDay);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
