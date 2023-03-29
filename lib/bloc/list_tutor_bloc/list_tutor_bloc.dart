import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lettutor/models/from_api/filters.dart';
import 'package:lettutor/models/from_api/tutor_info_pagination.dart';
import 'package:lettutor/repositories/tutor_repository.dart';

part 'list_tutor_event.dart';

part 'list_tutor_state.dart';

class ListTutorBloc extends Bloc<ListTutorEvent, ListTutorState> {
  TutorRepository repository;
  int page = 1;
  List<TutorInfoPagination> listTutor = [];
  Filters filters = Filters(specialties: []);
  String tutorName = "";
  bool isFilter = false;

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
    on<FetchFilterListTutorEvent>((event, emit) async {
      if (state is! ListTutorEmpty || state is ListTutorLoading) {
        try {
          if (state is ListTutorInitial) {
            emit(ListTutorLoading());
          }
          if (state is ListTutorSuccess) {
            emit(ListTutorFetchMore());
          }

          print("before fetch : $page");
          final response = await repository.filterTutorList(
              event.perPage, page, filters, tutorName);
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

    on<OnFilterListTutorEvent>((event, emit) {
      page = 1;
      listTutor = [];
      isFilter = true;

      filters.nationality = event.nationality;

      if (event.speciality == "all") {
        filters.specialties = [];
      } else {
        filters.specialties = event.speciality == null
            ? filters.specialties
            : [event.speciality!];
      }
      tutorName = event.tutorName ?? tutorName;
      emit(ListTutorInitial());
      add(const FetchFilterListTutorEvent(10));
    });
    on<ResetFilterListTutorEvent>((event, emit) {
      emit(ListTutorResetFilter());
      page = 1;
      listTutor = [];
      isFilter = false;
      tutorName = "";
      filters = Filters(specialties: []);
      emit(ListTutorInitial());
      add(const FetchListTutorEvent(10));
    });
  }
}
