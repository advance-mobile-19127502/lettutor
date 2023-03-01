import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/models/review.dart';
import 'package:lettutor/providers/locale_provider.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class ReviewTile extends StatelessWidget {
  const ReviewTile({Key? key, required this.review}) : super(key: key);
  final Review review;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: StyleConst.kDefaultPadding),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(review.avaUrl),
          ),
          const SizedBox(
            width: StyleConst.defaultRadius,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: review.name,
                      style: GoogleFonts.roboto(
                          textStyle: FontConst.regular.copyWith(
                              fontSize: 12, color: ColorConst.greyTextColor))),
                  const TextSpan(text: "  ", style: TextStyle(fontSize: 12)),
                  TextSpan(
                      text: timeago.format(review.createdAt,
                          clock: DateTime.now(),
                          locale:
                              Provider.of<LocaleProvider>(context).getLocale == const Locale('en') ? "en" : "vi"),
                      style: GoogleFonts.roboto(
                          textStyle: FontConst.regular.copyWith(
                              fontSize: 12,
                              color:
                                  ColorConst.greyTextColor.withOpacity(0.75))))
                ])),
                RatingBarIndicator(
                  itemCount: 5,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  rating: review.ratedStar,
                  itemSize: 12,
                ),
                review.content.isEmpty
                    ? const SizedBox()
                    : Text(
                        review.content,
                        style: GoogleFonts.openSans(
                            textStyle:
                                FontConst.regular.copyWith(fontSize: 14)),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
