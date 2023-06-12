part of 'become_tutor_bloc.dart';

abstract class BecomeTutorState extends Equatable {
  const BecomeTutorState();
  @override
  List<Object> get props => [];
}

class BecomeTutorInitial extends BecomeTutorState {}

class BecomeTutorInvalid extends BecomeTutorState {
  final String messageValid;

  const BecomeTutorInvalid(this.messageValid);
  @override
  List<Object> get props => [messageValid];
}

class BecomeTutorLoading extends BecomeTutorState {}

class BecomeTutorSuccess extends BecomeTutorState {}

class BecomeTutorNext extends BecomeTutorState {
  const BecomeTutorNext();
}

class BecomeTutorBack extends BecomeTutorState {
  const BecomeTutorBack();
}

class BecomeTutorErrorSendReq extends BecomeTutorState {
  const BecomeTutorErrorSendReq();
}
