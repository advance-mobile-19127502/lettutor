import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/bloc/settings_bloc/settings_bloc.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/models/from_api/review.dart';
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
          ClipOval(
            child: SizedBox.fromSize(
              size: const Size.fromRadius(15),
              child: Image.network(
                review.firstInfo?.avatar ??
                    "https://play-lh.googleusercontent.com/7pMjZVSZahaqMHzY1mtc0A1uCI0eH0m9K_kRZ9r9PmUCwKfm5TYEaMuZP6S6s-TdjQ",
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return Image.network(
                      "https://play-lh.googleusercontent.com/7pMjZVSZahaqMHzY1mtc0A1uCI0eH0m9K_kRZ9r9PmUCwKfm5TYEaMuZP6S6s-TdjQ");
                },
              ),
            ),
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
                      text: review.firstInfo!.name!,
                      style: GoogleFonts.roboto(
                          textStyle: FontConst.regular.copyWith(
                              fontSize: 12, color: ColorConst.greyTextColor))),
                  const TextSpan(text: "  ", style: TextStyle(fontSize: 12)),
                  TextSpan(
                      text: timeago.format(DateTime.parse(review.createdAt!),
                          clock: DateTime.now(),
                          locale: BlocProvider.of<SettingsBloc>(context)
                              .languageSelected),
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
                  rating: review.rating!.toDouble(),
                  itemSize: 12,
                ),
                review.content == null
                    ? const SizedBox()
                    : Text(
                        review.content!,
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
