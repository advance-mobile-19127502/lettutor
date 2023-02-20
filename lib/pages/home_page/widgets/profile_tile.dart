import 'package:extended_wrap/extended_wrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/common_widget/common_btn.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/models/tutor_info.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({Key? key, required this.tutor}) : super(key: key);

  final Tutor tutor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: StyleConst.kDefaultPadding / 2,
          right: StyleConst.kDefaultPadding,
          bottom: StyleConst.kDefaultPadding),
      child: Container(
        padding: const EdgeInsets.all(StyleConst.kDefaultPadding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(StyleConst.defaultRadius),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 1,
                spreadRadius: 1,
                color: Colors.black26,
              ),
            ]),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //avatar
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(tutor.ava_url),
              ),
            ),

            //name

            Text(
              tutor.name,
              style: GoogleFonts.poppins(
                  textStyle: FontConst.medium.copyWith(fontSize: 22)),
            ),

            Text(
              tutor.country,
              style: GoogleFonts.roboto(
                  textStyle: FontConst.regular
                      .copyWith(fontSize: 14, color: ColorConst.hintTextColor)),
            ),

            //rating star
            Padding(
                padding: const EdgeInsets.only(top: 5),
                child: RatingBarIndicator(
                  rating: tutor.rated_star,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 15,
                  direction: Axis.horizontal,
                )),

            const SizedBox(
              height: StyleConst.kDefaultPadding,
            ),

            //skills
            ExtendedWrap(
              runSpacing: -10,
              spacing: 5,
              maxLines: 2,
              children: List<Widget>.generate(tutor.skills.length, (index) {
                return Chip(
                  label: Text(
                    tutor.skills[index],
                    style: GoogleFonts.roboto(
                        textStyle: FontConst.regular
                            .copyWith(color: Colors.blue, fontSize: 12)),
                  ),
                  backgroundColor: ColorConst.selectedChipColor,
                );
              }).toList(),
            ),

            const SizedBox(
              height: StyleConst.kDefaultPadding,
            ),

            //description

            Text(
              tutor.description,
              style: GoogleFonts.roboto(
                  textStyle: FontConst.regular.copyWith(
                      fontSize: 14, color: Colors.black.withOpacity(0.6))),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(
              height: StyleConst.kDefaultPadding,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CommonButtonWidget(
                  title: "Book",
                  onPress: () {},
                  icon: Icons.my_library_books,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
