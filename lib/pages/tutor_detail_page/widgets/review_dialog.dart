import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/models/review.dart';
import 'package:lettutor/pages/tutor_detail_page/widgets/header_dialog.dart';
import 'package:lettutor/pages/tutor_detail_page/widgets/review_tile.dart';

class ReviewDialog extends StatefulWidget {
  const ReviewDialog({Key? key, required this.listReview}) : super(key: key);
  final List<Review> listReview;

  @override
  State<ReviewDialog> createState() => _ReviewDialogState();
}

class _ReviewDialogState extends State<ReviewDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(StyleConst.defaultRadius))),
      child: SingleChildScrollView(
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
              child: Column(children: [
                ...List.generate(widget.listReview.length,
                    (index) => ReviewTile(review: widget.listReview[index])),
                Text("Show more")
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
