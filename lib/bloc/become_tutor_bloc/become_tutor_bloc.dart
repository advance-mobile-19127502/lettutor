import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lettutor/repositories/tutor_repository.dart';

part 'become_tutor_event.dart';

part 'become_tutor_state.dart';

class BecomeTutorBloc extends Bloc<BecomeTutorEvent, BecomeTutorState> {
  String name = "";
  String country = "vn";
  String birthDay = "";
  String interest = "";
  String education = "";
  String experience = "";
  String profession = "";
  String languages = "";
  String introduction = "";
  String targetStudent = "Beginner";
  String price = "10000";
  String specialities = "";
  String? videoPath;
  String? imagePath;
  TutorRepository repository;

  BecomeTutorBloc(this.repository) : super(BecomeTutorInitial()) {
    on<BecomeTutorEvent>((event, emit) {});

    on<BackTutorProfile>((event, emit) {
      emit(const BecomeTutorBack());
    });
    on<NextTutorProfile>((event, emit) {
      emit(BecomeTutorInitial());
      String? messageValidate;
      final fields = {
        'tutoring name': name,
        'country': country,
        'birthDay': birthDay,
        'interest': interest,
        'education': education,
        'experience': experience,
        'profession': profession,
        'languages': languages,
        'introduction': introduction,
        'target student': targetStudent,
        'specialities': specialities,
        'image': imagePath
      };

      for (var entry in fields.entries) {
        if (entry.value == null || entry.value!.isEmpty) {
          messageValidate = "Please input ${entry.key}";
          break;
        }
      }

      if (messageValidate != null) {
        emit(BecomeTutorInvalid(messageValidate));
      } else {
        emit(const BecomeTutorNext());
      }
    });

    on<SendBecomeATutorEvent>((event, emit) async {
      emit(BecomeTutorInitial());
      if (videoPath == null || videoPath!.isEmpty) {
        emit(const BecomeTutorInvalid("Please input video"));
      } else {
        try {
          emit(BecomeTutorLoading());
          await repository.registerTutor(
              name,
              country,
              birthDay,
              interest,
              education,
              experience,
              profession,
              languages,
              introduction,
              targetStudent,
              price,
              specialities,
              videoPath!,
              imagePath!);
          emit(BecomeTutorSuccess());
        } catch (error) {
          print(error);
          emit(const BecomeTutorErrorSendReq());
        }
      }
    });
  }
}
