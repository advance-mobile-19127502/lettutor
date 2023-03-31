part of 'list_tutor_bloc.dart';

abstract class ListTutorEvent extends Equatable {
  const ListTutorEvent();
}

class FetchListTutorEvent extends ListTutorEvent {
  final int perPage;

  const FetchListTutorEvent(this.perPage);
  @override
  // TODO: implement props
  List<Object?> get props => [perPage];
}

class OnFilterListTutorEvent extends ListTutorEvent {
  final String? tutorName;
  final Nationality? nationality;
  final String? speciality;
  const OnFilterListTutorEvent(
      this.tutorName, this.nationality, this.speciality);
  @override
  // TODO: implement props
  List<Object?> get props => [tutorName, nationality];
}

class FetchFilterListTutorEvent extends ListTutorEvent {
  final int perPage;

  const FetchFilterListTutorEvent(this.perPage);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ResetFilterListTutorEvent extends ListTutorEvent {
  const ResetFilterListTutorEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FavoriteTutorEvent extends ListTutorEvent {
  final String tutorId;

  const FavoriteTutorEvent(this.tutorId);

  @override
  List<Object?> get props => [tutorId];
}
