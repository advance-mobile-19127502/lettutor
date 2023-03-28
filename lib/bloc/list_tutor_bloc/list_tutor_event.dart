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
