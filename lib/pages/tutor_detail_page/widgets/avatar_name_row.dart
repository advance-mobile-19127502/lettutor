

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/models/tutor_info.dart';
import 'package:provider/provider.dart';

class AvatarNameRow extends StatelessWidget {
  const AvatarNameRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tutor = Provider.of<Tutor>(context, listen: false);

    return Row(
      children: [
        CircleAvatar(
          radius: 70,
          backgroundImage: NetworkImage(tutor.ava_url),
        ),
        const SizedBox(
          width: StyleConst.kDefaultPadding,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tutor.name,
              style: GoogleFonts.poppins(
                  textStyle:
                  FontConst.semiBold.copyWith(fontSize: 22)),
            ),
            RatingBarIndicator(
              rating: tutor.rated_star,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 15,
              direction: Axis.horizontal,
            ),
            const SizedBox(
              height: StyleConst.kDefaultPadding / 2,
            ),
            Text(
              tutor.country,
              style: GoogleFonts.roboto(
                  textStyle: FontConst.regular.copyWith(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.85))),
            )
          ],
        )
      ],
    );
  }
}
