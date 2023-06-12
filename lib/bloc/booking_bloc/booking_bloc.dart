import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lettutor/repositories/booking_repository.dart';

part 'booking_event.dart';

part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingRepository repository;
  BookingBloc(this.repository) : super(BookingInitial()) {
    on<BookingTutorEvent>((event, emit) async {
      emit(BookingLoading());
      try {
        await repository.bookingClass(event.scheduleDetailId, event.note);
        emit(BookingSuccess());
      } catch (error) {
        print(error);
        emit(BookingError(error.toString()));
      }
    });
  }
}
