import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lettutor/models/from_api/tutor_info_pagination.dart';
import 'package:lettutor/repositories/tutor_repository.dart';

part 'list_tutor_event.dart';

part 'list_tutor_state.dart';

class ListTutorBloc extends Bloc<ListTutorEvent, ListTutorState> {
  TutorRepository repository;
  int page = 1;
  List<TutorInfoPagination> listTutor = [];

  ListTutorBloc(this.repository) : super(ListTutorInitial()) {
    on<FetchListTutorEvent>((event, emit) async {
      if (state is! ListTutorEmpty || state is ListTutorLoading) {
        try {
          if (state is ListTutorInitial) {
            emit(ListTutorLoading());
          }
          if (state is ListTutorSuccess) {
            emit(ListTutorFetchMore());
          }

          print("before fetch : $page");
          final response =
              await repository.getListTutorsPerPage(event.perPage, page);
          page++;
          print("after fetch : $page");

          if (response.isEmpty) {
            emit(ListTutorEmpty());
          } else {
            listTutor.addAll(response);
            emit(ListTutorSuccess(listTutor));
          }
        } catch (error) {
          print(error);
          emit(ListTutorError(error.toString()));
        }
      }
    });
  }
}
