part of 'list_course_bloc.dart';

abstract class ListCourseState extends Equatable {
  const ListCourseState();
  @override
  List<Object> get props => [];
}

class ListCourseInitial extends ListCourseState {}

class ListCourseLoading extends ListCourseState {}

class ListCourseSuccess extends ListCourseState {
  final List<CourseInfo> listCourse;

  const ListCourseSuccess(this.listCourse);
  @override
  List<Object> get props => [listCourse];
}

class ListCourseError extends ListCourseState {
  final String message;

  const ListCourseError(this.message);
  @override
  List<Object> get props => [message];
}
