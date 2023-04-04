part of 'total_time_bloc.dart';

abstract class TotalTimeState extends Equatable {
  const TotalTimeState();
  @override
  List<Object> get props => [];
}

class TotalTimeInitial extends TotalTimeState {}

class TotalTimeSuccess extends TotalTimeState {
  final String totalLessonLearned;

  const TotalTimeSuccess(this.totalLessonLearned);
  @override
  List<Object> get props => [totalLessonLearned];
}

class TotalTimeFailure extends TotalTimeState {}
