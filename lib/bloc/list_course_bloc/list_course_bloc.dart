import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lettutor/bloc/list_tutor_bloc/list_tutor_bloc.dart';
import 'package:lettutor/models/from_api/categories_course.dart';
import 'package:lettutor/models/from_api/course_info.dart';
import 'package:lettutor/repositories/course_repository.dart';
import 'package:lettutor/repositories/total_time_repository.dart';

part 'list_course_event.dart';

part 'list_course_state.dart';

class ListCourseBloc extends Bloc<ListCourseEvent, ListCourseState> {
  CourseRepository courseRepository;
  MainRepository mainRepository;
  List<Categories> listCategory = [];
  String nameCourse = "";
  Map<String, int> levelSelected = {};
  Map<String, String> categorySelected = {};
  Map<String, String> sortLevelSelected = {};

  ListCourseBloc(this.courseRepository, this.mainRepository)
      : super(ListCourseInitial()) {
    on<FetchListCourse>((event, emit) async {
      emit(ListCourseLoading());
      try {
        if (listCategory.isEmpty) {
          listCategory = await mainRepository.getCategories();
        }
        final courseResponse = await courseRepository.getListCourse(
            nameCourse, levelSelected, categorySelected, sortLevelSelected);
        emit(ListCourseSuccess(courseResponse));
      } catch (error) {
        print(error);
        emit(ListCourseError(error.toString()));
      }
    });

    on<OnFilterListCourseEvent>((event, emit) {
      nameCourse = event.nameCourse ?? nameCourse;
      levelSelected = event.selectedLevel ?? levelSelected;
      categorySelected = event.selectedCategory ?? categorySelected;
      sortLevelSelected = event.selectedSortLevel ?? sortLevelSelected;
      add(FetchListCourse());
    });
  }
}
