import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/bloc/list_reviews_bloc/list_review_bloc.dart';
import 'package:lettutor/pages/tutor_detail_page/widgets/review_tile.dart';

class ListReviewWidget extends StatefulWidget {
  const ListReviewWidget({Key? key}) : super(key: key);

  @override
  State<ListReviewWidget> createState() => _ListReviewWidgetState();
}

class _ListReviewWidgetState extends State<ListReviewWidget> {
  late ListReviewBloc listReviewBlocBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listReviewBlocBloc = BlocProvider.of<ListReviewBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListReviewBloc, ListReviewState>(
      bloc: listReviewBlocBloc,
      builder: (context, state) {
        if (state is ListReviewLoading) {
          return const Center(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: CircularProgressIndicator(),
          ));
        }
        if (state is ListReviewSuccess) {
          return Column(
            children: listReviewBlocBloc.listReview
                .map((e) => Column(
                      children: [
                        ReviewTile(review: e),
                      ],
                    ))
                .toList(),
          );
        }
        if (state is ListReviewFetchMore) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...listReviewBlocBloc.listReview.map((e) => Column(
                      children: [
                        ReviewTile(review: e),
                      ],
                    )),
                const CircularProgressIndicator(),
              ]);
        }
        if (state is ListReviewEmpty) {
          return Column(children: [
            ...listReviewBlocBloc.listReview.map((e) => Column(
                  children: [
                    ReviewTile(review: e),
                    const SizedBox(
                      height: 8,
                    )
                  ],
                )),
            const Center(child: Text("No data")),
          ]);
        }
        return const Center(child: Text("Xảy ra lỗi trong lúc lấy dữ liệu"));
      },
    );
  }
}
