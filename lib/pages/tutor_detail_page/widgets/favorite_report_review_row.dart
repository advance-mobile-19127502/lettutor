import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/bloc/list_reviews_bloc/list_review_bloc.dart';
import 'package:lettutor/bloc/list_tutor_bloc/list_tutor_bloc.dart';
import 'package:lettutor/bloc/tutor_detail_bloc/tutor_detail_bloc.dart';
import 'package:lettutor/common_widget/icon_text_btn.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/url_const.dart';
import 'package:lettutor/pages/tutor_detail_page/widgets/review_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/repositories/review_repository.dart';

class FavoriteReportReviewRow extends StatefulWidget {
  const FavoriteReportReviewRow(
      {Key? key, required this.tutorId, required this.isFavorite})
      : super(key: key);
  final String tutorId;
  final bool isFavorite;

  @override
  State<FavoriteReportReviewRow> createState() =>
      _FavoriteReportReviewRowState();
}

class _FavoriteReportReviewRowState extends State<FavoriteReportReviewRow> {
  late TutorDetailBloc tutorDetailBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tutorDetailBloc = BlocProvider.of<TutorDetailBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TutorDetailBloc, TutorDetailState>(
      bloc: tutorDetailBloc,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                BlocProvider.of<ListTutorBloc>(context)
                    .add(FavoriteTutorEvent(widget.tutorId));
                tutorDetailBloc.add(const OnFavoriteTutorDetailEvent());
              },
              child: Column(
                children: [
                  Icon(
                    widget.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: widget.isFavorite ? Colors.red : Colors.blue,
                  ),
                  Text(
                    AppLocalizations.of(context)!.favorites,
                    style: GoogleFonts.roboto(
                        textStyle: FontConst.medium
                            .copyWith(fontSize: 13, color: Colors.blue)),
                  )
                ],
              ),
            ),
            IconTextButton(
                title: AppLocalizations.of(context)!.report,
                icon: Icons.report_gmailerrorred,
                onPress: () {}),
            IconTextButton(
                title: AppLocalizations.of(context)!.review,
                icon: Icons.star_border_outlined,
                onPress: () {
                  showDialog(
                      context: context,
                      builder: (context) => BlocProvider(
                          create: (BuildContext context) => ListReviewBloc(
                              ReviewsRepository(
                                  "${UrlConst.baseUrl}/feedback/v2"))
                            ..add(FetchListReviewEvent(12, widget.tutorId)),
                          child: ReviewDialog(tutorId: widget.tutorId)));
                }),
          ],
        );
      },
    );
  }
}
