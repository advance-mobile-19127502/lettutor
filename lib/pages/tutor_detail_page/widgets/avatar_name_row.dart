import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/bloc/tutor_detail_bloc/tutor_detail_bloc.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';

class AvatarNameRow extends StatelessWidget {
  const AvatarNameRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TutorDetailBloc tutorDetailBloc = BlocProvider.of<TutorDetailBloc>(context);

    return BlocBuilder<TutorDetailBloc, TutorDetailState>(
      builder: (context, state) {
        return Row(
          children: [
            ClipOval(
              child: SizedBox.fromSize(
                size: const Size.fromRadius(40),
                child: Image.network(
                  state is TutorDetailSuccess
                      ? state.tutorInfo.user?.avatar ??
                          "https://play-lh.googleusercontent.com/7pMjZVSZahaqMHzY1mtc0A1uCI0eH0m9K_kRZ9r9PmUCwKfm5TYEaMuZP6S6s-TdjQ"
                      : "https://play-lh.googleusercontent.com/7pMjZVSZahaqMHzY1mtc0A1uCI0eH0m9K_kRZ9r9PmUCwKfm5TYEaMuZP6S6s-TdjQ",
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return Image.network(
                        "https://play-lh.googleusercontent.com/7pMjZVSZahaqMHzY1mtc0A1uCI0eH0m9K_kRZ9r9PmUCwKfm5TYEaMuZP6S6s-TdjQ");
                  },
                ),
              ),
            ),
            const SizedBox(
              width: StyleConst.kDefaultPadding,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state is TutorDetailSuccess
                      ? state.tutorInfo.user?.name ?? ""
                      : "",
                  style: GoogleFonts.poppins(
                      textStyle: FontConst.semiBold.copyWith(fontSize: 22)),
                ),
                Row(
                  children: [
                    RatingBarIndicator(
                      rating: state is TutorDetailSuccess
                          ? state.tutorInfo.avgRating?.toDouble() ?? 0
                          : 0,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 15,
                      direction: Axis.horizontal,
                    ),
                    Text(
                      "(${state is TutorDetailSuccess ? state.tutorInfo.totalFeedback ?? 0 : 0})",
                    )
                  ],
                ),
                const SizedBox(
                  height: StyleConst.kDefaultPadding / 2,
                ),
                Text(
                  state is TutorDetailSuccess
                      ? state.tutorInfo.user?.country ?? ""
                      : "",
                  style: GoogleFonts.roboto(
                      textStyle: FontConst.regular.copyWith(
                          fontSize: 16, color: Colors.black.withOpacity(0.85))),
                )
              ],
            )
          ],
        );
      },
    );
  }
}
