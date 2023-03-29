part of 'list_review_bloc.dart';

abstract class ListReviewState extends Equatable {
  const ListReviewState();
  @override
  List<Object> get props => [];
}

class ListReviewInitial extends ListReviewState {}

class ListReviewLoading extends ListReviewState {}

class ListReviewSuccess extends ListReviewState {
  final List<Review> listReview;

  const ListReviewSuccess(this.listReview);
}

class ListReviewError extends ListReviewState {
  final String message;

  const ListReviewError(this.message);
}

class ListReviewEmpty extends ListReviewState {}

class ListReviewFetchMore extends ListReviewState {}
