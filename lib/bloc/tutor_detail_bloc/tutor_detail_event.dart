part of 'tutor_detail_bloc.dart';

abstract class TutorDetailEvent extends Equatable {
  const TutorDetailEvent();
}

class FetchTutorDetailEvent extends TutorDetailEvent {
  final String? tutorId;

  const FetchTutorDetailEvent(this.tutorId);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
