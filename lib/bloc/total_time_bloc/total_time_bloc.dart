import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lettutor/repositories/total_time_repository.dart';

part 'total_time_event.dart';
part 'total_time_state.dart';

class TotalTimeBloc extends Bloc<TotalTimeEvent, TotalTimeState> {
  TotalTimeRepository repository;
  TotalTimeBloc(this.repository) : super(TotalTimeInitial()) {
    on<TotalTimeEvent>((event, emit) async {
      try {
        int totalTime = await repository.getTotalTimeLesson();
        final int hours = totalTime ~/ 60;
        final int minutes = totalTime % 60;
        emit(TotalTimeSuccess(
            "${hours.toString().padLeft(2, "0")} hours ${minutes.toString().padLeft(2, "0")} minutes"));
      } catch (error) {
        print(error);
        emit(TotalTimeFailure());
      }
    });
  }
}
