import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lettutor/models/from_api/review.dart';
import 'package:lettutor/repositories/review_repository.dart';

part 'list_review_event.dart';
part 'list_review_state.dart';

class ListReviewBloc extends Bloc<ListReviewEvent, ListReviewState> {
  ReviewsRepository repository;
  int page = 1;
  List<Review> listReview = [];

  ListReviewBloc(this.repository) : super(ListReviewInitial()) {
    on<FetchListReviewEvent>((event, emit) async {
      if (state is! ListReviewEmpty || state is ListReviewLoading) {
        try {
          if (state is ListReviewInitial) {
            emit(ListReviewLoading());
          }
          if (state is ListReviewSuccess) {
            emit(ListReviewFetchMore());
          }

          print("before fetch : $page");
          final response = await repository.getListReviews(
              event.tutorId, event.perPage, page);
          page++;
          print("after fetch : $page");

          if (response.isEmpty) {
            emit(ListReviewEmpty());
          } else {
            listReview.addAll(response);
            emit(ListReviewSuccess(listReview));
          }
        } catch (error) {
          print(error);
          emit(ListReviewError(error.toString()));
        }
      }
    });
  }
}
