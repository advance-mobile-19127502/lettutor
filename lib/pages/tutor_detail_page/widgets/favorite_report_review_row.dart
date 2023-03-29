import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/bloc/list_reviews_bloc/list_review_bloc.dart';
import 'package:lettutor/common_widget/icon_text_btn.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/url_const.dart';
import 'package:lettutor/pages/tutor_detail_page/widgets/review_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/repositories/review_repository.dart';

class FavoriteReportReviewRow extends StatefulWidget {
  const FavoriteReportReviewRow({Key? key, required this.tutorId})
      : super(key: key);
  final String tutorId;

  @override
  State<FavoriteReportReviewRow> createState() =>
      _FavoriteReportReviewRowState();
}

class _FavoriteReportReviewRowState extends State<FavoriteReportReviewRow> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {},
          child: Column(
            children: [
              Icon(
                Icons.favorite_border,
                color: Colors.blue,
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
                          ReviewsRepository("${UrlConst.baseUrl}/feedback/v2"))
                        ..add(FetchListReviewEvent(12, widget.tutorId)),
                      child: ReviewDialog(tutorId: widget.tutorId)));
            }),
      ],
    );
  }
}
