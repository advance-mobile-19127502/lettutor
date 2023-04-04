part of 'booking_history_bloc.dart';

abstract class BookingHistoryState extends Equatable {
  const BookingHistoryState();
  @override
  List<Object> get props => [];
}

class BookingHistoryInitial extends BookingHistoryState {}

class BookingHistoryLoading extends BookingHistoryState {}

class BookingHistorySuccess extends BookingHistoryState {
  final List<BookingHistory> listBookingHistory;

  const BookingHistorySuccess(this.listBookingHistory);
  @override
  List<Object> get props => [listBookingHistory];
}

class BookingHistoryEmpty extends BookingHistoryState {}

class BookingHistoryFetchMore extends BookingHistoryState {}

class BookingHistoryError extends BookingHistoryState {
  final String message;

  const BookingHistoryError(this.message);
}
