part of 'become_tutor_bloc.dart';

abstract class BecomeTutorEvent extends Equatable {
  const BecomeTutorEvent();
}

class NextTutorProfile extends BecomeTutorEvent {
  const NextTutorProfile();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class BackTutorProfile extends BecomeTutorEvent {
  const BackTutorProfile();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SendBecomeATutorEvent extends BecomeTutorEvent {
  const SendBecomeATutorEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
