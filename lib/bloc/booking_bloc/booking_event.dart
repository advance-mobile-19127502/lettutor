part of 'booking_bloc.dart';

abstract class BookingEvent extends Equatable {
  const BookingEvent();
}

class BookingTutorEvent extends BookingEvent {
  final String scheduleDetailId, note;

  const BookingTutorEvent(this.scheduleDetailId, this.note);
  @override
  List<Object?> get props => [];
}
