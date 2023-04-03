import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lettutor/models/from_api/filters.dart';
import 'package:lettutor/models/from_api/tutor_info_pagination.dart';
import 'package:lettutor/repositories/tutor_repository.dart';
import 'package:lettutor/repositories/user_repository.dart';

part 'list_tutor_event.dart';

part 'list_tutor_state.dart';

class ListTutorBloc extends Bloc<ListTutorEvent, ListTutorState> {
  TutorRepository tutorRepository;
  UserRepository userRepository;
  int page = 1;
  List<TutorInfoPagination> listTutor = [];
  List<TutorInfoPagination> listFavoriteTutor = [];
  Filters filters = Filters(specialties: []);
  String tutorName = "";
  bool isFilter = false;
  bool fetchDoneFavorite = false;

  ListTutorBloc(this.tutorRepository, this.userRepository)
      : super(ListTutorInitial()) {
    on<FetchListTutorEvent>((event, emit) async {
      if (state is! ListTutorEmpty || state is ListTutorLoading) {
        try {
          if (state is ListTutorInitial) {
            emit(ListTutorLoading());
          }
          if (state is ListTutorSuccess) {
            emit(ListTutorFetchMore());
          }

          final response = await tutorRepository.getListTutorsPerPage(
              event.perPage, page, fetchDoneFavorite, listFavoriteTutor);
          fetchDoneFavorite = true;
          page++;

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
          final response = await tutorRepository.filterTutorList(
              event.perPage, page, filters, tutorName);
          page++;

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
      fetchDoneFavorite = false;
      listFavoriteTutor = [];
      tutorName = "";
      filters = Filters(specialties: []);
      emit(ListTutorInitial());
      add(const FetchListTutorEvent(10));
    });
    on<FavoriteTutorEvent>((event, emit) {
      emit(ListTutorInitial());
      try {
        userRepository.manageFavoriteTutor(event.tutorId);
        int index =
            listTutor.indexWhere((element) => element.userId == event.tutorId);
        TutorInfoPagination tempTutor = listTutor[index];
        if (listFavoriteTutor
            .any((element) => element.userId == event.tutorId)) {
          listTutor.removeAt(index);
          listFavoriteTutor
              .removeWhere((element) => element.userId == event.tutorId);
          listTutor.insert(listFavoriteTutor.length, tempTutor);
        } else {
          listTutor.removeAt(index);
          listFavoriteTutor.add(tempTutor);
          listTutor.insert(0, tempTutor);
        }
        emit(ListTutorFavorite(listTutor));
      } catch (err) {
        emit(ListTutorFavorite(listTutor));
      }
    });
  }
}
