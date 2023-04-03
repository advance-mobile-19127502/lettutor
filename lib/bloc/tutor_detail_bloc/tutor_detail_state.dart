part of 'tutor_detail_bloc.dart';

abstract class TutorDetailState extends Equatable {
  const TutorDetailState();
  @override
  List<Object> get props => [];
}

class TutorDetailInitial extends TutorDetailState {}

class TutorDetailSuccess extends TutorDetailState {
  final TutorInfoSearch tutorInfo;

  const TutorDetailSuccess(this.tutorInfo);

  @override
  List<Object> get props => [tutorInfo];
}

class TutorDetailLoading extends TutorDetailState {}

class TutorDetailError extends TutorDetailState {
  final String message;

  const TutorDetailError(this.message);
}
