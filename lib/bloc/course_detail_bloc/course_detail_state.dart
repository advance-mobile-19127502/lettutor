part of 'course_detail_bloc.dart';

abstract class CourseDetailState extends Equatable {
  const CourseDetailState();
  @override
  List<Object> get props => [];
}

class CourseDetailInitial extends CourseDetailState {}

class CourseDetailLoading extends CourseDetailState {}

class CourseDetailSuccess extends CourseDetailState {
  final CourseInfo courseInfo;

  const CourseDetailSuccess(this.courseInfo);
}

class CourseDetailError extends CourseDetailState {
  final String message;

  const CourseDetailError(this.message);
}
