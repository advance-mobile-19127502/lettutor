import 'package:flutter/material.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/models/review.dart';
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
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(StyleConst.defaultRadius))),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(StyleConst.kDefaultPadding),
          child: Column(children: [
            ...List.generate(widget.listReview.length,
                (index) => ReviewTile(review: widget.listReview[index])),
            
            Text("Show more")
            
          ]),
        ),
      ),
    );
  }
}
