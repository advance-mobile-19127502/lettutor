import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/bloc/list_reviews_bloc/list_review_bloc.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/pages/tutor_detail_page/widgets/header_dialog.dart';
import 'package:lettutor/pages/tutor_detail_page/widgets/list_reviews_widget.dart';
import 'package:lettutor/pages/tutor_detail_page/widgets/review_tile.dart';

class ReviewDialog extends StatefulWidget {
  const ReviewDialog({Key? key, required this.tutorId}) : super(key: key);
  final String tutorId;

  @override
  State<ReviewDialog> createState() => _ReviewDialogState();
}

class _ReviewDialogState extends State<ReviewDialog> {
  bool _isScrollAble = false;
  late ScrollController scrollController;
  late ListReviewBloc listReviewBlocBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController()..addListener(_scrollListener);
    listReviewBlocBloc = BlocProvider.of<ListReviewBloc>(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_isScrollAble &&
        scrollController.position.maxScrollExtent == scrollController.offset) {
      listReviewBlocBloc.add(FetchListReviewEvent(12, widget.tutorId));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(StyleConst.defaultRadius))),
      child: SingleChildScrollView(
        controller: scrollController,
        child: BlocListener<ListReviewBloc, ListReviewState>(
          listener: (context, state) {
            if (state is ListReviewSuccess) {
              final isScrollable =
                  scrollController.position.maxScrollExtent > 0;
              if (_isScrollAble != isScrollable) {
                _isScrollAble = isScrollable;
              }
              if (!_isScrollAble) {
                listReviewBlocBloc
                    .add(FetchListReviewEvent(12, widget.tutorId));
              }
            }
          },
          child: Column(
            children: [
              HeaderDialog(
                  headerTitle: AppLocalizations.of(context)!.othersReview),
              Container(
                padding: const EdgeInsets.only(
                  left: StyleConst.kDefaultPadding,
                  right: StyleConst.kDefaultPadding,
                  bottom: StyleConst.kDefaultPadding,
                ),
                child: const ListReviewWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
