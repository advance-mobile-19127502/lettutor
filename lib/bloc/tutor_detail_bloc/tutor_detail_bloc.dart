import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lettutor/models/from_api/tutor_Info_search.dart';
import 'package:lettutor/repositories/tutor_repository.dart';

part 'tutor_detail_event.dart';
part 'tutor_detail_state.dart';

class TutorDetailBloc extends Bloc<TutorDetailEvent, TutorDetailState> {
  TutorRepository repository;
  TutorDetailBloc(this.repository) : super(TutorDetailInitial()) {
    on<FetchTutorDetailEvent>((event, emit) async {
      emit(TutorDetailLoading());
      try {
        TutorInfoSearch tutorInfoSearch =
            await repository.getTutorInfoSearch(event.tutorId!);
        emit(TutorDetailSuccess(tutorInfoSearch));
      } catch (err) {
        print(err);
        emit(TutorDetailError(err.toString()));
      }
    });

    on<OnFavoriteTutorDetailEvent>((event, emit) {
      if (state is TutorDetailSuccess) {
        var tempState = state as TutorDetailSuccess;

        emit(TutorDetailSuccess(tempState.tutorInfo
            .copyWith(isFavorite: !(tempState.tutorInfo.isFavorite!))));
      }
    });
  }
}
