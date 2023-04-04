import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lettutor/models/from_api/course_info.dart';
import 'package:lettutor/repositories/course_repository.dart';

part 'course_detail_event.dart';
part 'course_detail_state.dart';

class CourseDetailBloc extends Bloc<CourseDetailEvent, CourseDetailState> {
  CourseRepository repository;
  CourseDetailBloc(this.repository) : super(CourseDetailInitial()) {
    on<CourseDetailEvent>((event, emit) async {
      emit(CourseDetailLoading());
      try {
        CourseInfo courseInfo = await repository.getCourseInfo(event.courseId);
        emit(CourseDetailSuccess(courseInfo));
      } catch (error) {
        print(error);
        emit(CourseDetailError(error.toString()));
      }
    });
  }
}
