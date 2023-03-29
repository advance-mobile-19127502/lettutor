part of 'list_tutor_bloc.dart';

abstract class ListTutorState extends Equatable {
  const ListTutorState();

  @override
  List<Object> get props => [];
}

class ListTutorInitial extends ListTutorState {}

class ListTutorLoading extends ListTutorState {}

class ListTutorSuccess extends ListTutorState {
  final List<TutorInfoPagination> listTutor;

  const ListTutorSuccess(this.listTutor);
}

class ListTutorError extends ListTutorState {
  final String message;

  const ListTutorError(this.message);
}

class ListTutorEmpty extends ListTutorState {}

class ListTutorFetchMore extends ListTutorState {}
