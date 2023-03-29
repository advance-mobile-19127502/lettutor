part of 'list_review_bloc.dart';

abstract class ListReviewEvent extends Equatable {
  const ListReviewEvent();
}

class FetchListReviewEvent extends ListReviewEvent {
  final int perPage;
  final String tutorId;
  const FetchListReviewEvent(this.perPage, this.tutorId);
  @override
  // TODO: implement props
  List<Object?> get props => [perPage];
}
