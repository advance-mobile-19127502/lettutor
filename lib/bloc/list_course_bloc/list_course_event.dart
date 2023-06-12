part of 'list_course_bloc.dart';

abstract class ListCourseEvent extends Equatable {
  const ListCourseEvent();
}

class FetchListCourse extends ListCourseEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnFilterListCourseEvent extends ListCourseEvent {
  final String? nameCourse;
  final Map<String, int>? selectedLevel;
  final Map<String, String>? selectedCategory;
  final Map<String, String>? selectedSortLevel;

  const OnFilterListCourseEvent(this.nameCourse, this.selectedLevel,
      this.selectedCategory, this.selectedSortLevel);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
