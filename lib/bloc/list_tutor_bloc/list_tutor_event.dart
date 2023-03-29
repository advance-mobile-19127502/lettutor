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
  String? tutorName;
  bool? isNative, isVietnamese;
  String? speciality;
  OnFilterListTutorEvent(
      this.tutorName, this.isNative, this.isVietnamese, this.speciality);
  @override
  // TODO: implement props
  List<Object?> get props => [tutorName, isNative, isVietnamese];
}

class FetchFilterListTutorEvent extends ListTutorEvent {
  final int perPage;

  const FetchFilterListTutorEvent(this.perPage);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
