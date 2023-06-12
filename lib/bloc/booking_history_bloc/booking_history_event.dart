part of 'booking_history_bloc.dart';

abstract class BookingHistoryEvent extends Equatable {
  const BookingHistoryEvent();
}

class FetchBookingEvent extends BookingHistoryEvent {
  final int perPage;

  const FetchBookingEvent(this.perPage);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchLastestBooking extends BookingHistoryEvent {
  final int perPage;

  const FetchLastestBooking(this.perPage);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchBookingHistoryEvent extends BookingHistoryEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CancelBookedClassEvent extends BookingHistoryEvent {
  final String scheduleID;

  const CancelBookedClassEvent(this.scheduleID);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
