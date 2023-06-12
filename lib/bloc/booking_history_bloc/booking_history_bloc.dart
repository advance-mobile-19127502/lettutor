import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lettutor/models/from_api/booking_history.dart';
import 'package:lettutor/repositories/booking_repository.dart';

part 'booking_history_event.dart';

part 'booking_history_state.dart';

class BookingHistoryBloc
    extends Bloc<BookingHistoryEvent, BookingHistoryState> {
  BookingRepository repository;
  int page = 1;
  List<BookingHistory> listBookingHistory = [];

  BookingHistoryBloc(this.repository) : super(BookingHistoryInitial()) {
    on<FetchBookingEvent>((event, emit) async {
      if (state is! BookingHistoryEmpty || state is BookingHistoryLoading) {
        try {
          if (state is BookingHistoryInitial) {
            emit(BookingHistoryLoading());
          }
          if (state is BookingHistorySuccess) {
            emit(BookingHistoryFetchMore());
          }

          final response = await repository.getBookedClass(page, event.perPage);
          page++;

          if (response.isEmpty) {
            emit(BookingHistoryEmpty());
          } else {
            listBookingHistory.addAll(response);
            emit(BookingHistorySuccess(listBookingHistory));
          }
        } catch (error) {
          emit(BookingHistoryError(error.toString()));
        }
      }
    });
    on<FetchLastestBooking>((event, emit) async {
      emit(BookingHistoryLoading());
      try {
        final response = await repository.getBookedClass(1, event.perPage);
        listBookingHistory.clear();
        listBookingHistory.addAll(response);
        emit(BookingHistorySuccess(listBookingHistory));
      } catch (error) {
        emit(BookingHistoryError(error.toString()));
      }
    });
    on<FetchBookingHistoryEvent>((event, emit) async {
      if (state is! BookingHistoryEmpty || state is BookingHistoryLoading) {
        try {
          if (state is BookingHistoryInitial) {
            emit(BookingHistoryLoading());
          }
          if (state is BookingHistorySuccess) {
            emit(BookingHistoryFetchMore());
          }

          final response = await repository.getHistoryClasses(page);
          page++;

          if (response.isEmpty) {
            emit(BookingHistoryEmpty());
          } else {
            listBookingHistory.addAll(response);
            emit(BookingHistorySuccess(listBookingHistory));
          }
        } catch (error) {
          emit(BookingHistoryError(error.toString()));
        }
      }
    });

    on<CancelBookedClassEvent>((event, emit) async {
      emit(CancelBookingHistoryLoading(event.scheduleID));
      try {
        await repository.cancelBookedClass(event.scheduleID);
        listBookingHistory
            .removeWhere((element) => element.id == event.scheduleID);

        emit(BookingHistorySuccess(listBookingHistory));
      } catch (error) {
        emit(CancelBookingHistoryError(error.toString()));
      }
    });
  }
}
