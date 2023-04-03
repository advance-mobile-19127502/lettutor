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

class OnFavoriteTutorDetailEvent extends TutorDetailEvent {
  const OnFavoriteTutorDetailEvent();

  @override
  List<Object?> get props => [];
}
