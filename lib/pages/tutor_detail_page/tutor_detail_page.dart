import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/common_widget/item_chip.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/models/tutor_info.dart';
import 'package:lettutor/pages/tutor_detail_page/widgets/avatar_name_row.dart';
import 'package:lettutor/pages/tutor_detail_page/widgets/favorite_report_review_row.dart';
import 'package:lettutor/pages/tutor_detail_page/widgets/section_with_chip.dart';
import 'package:lettutor/pages/tutor_detail_page/widgets/section_with_text.dart';
import 'package:lettutor/pages/tutor_detail_page/widgets/video_player_widget.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class TutorDetailPage extends StatelessWidget {
  const TutorDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tutor = Provider.of<Tutor>(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(StyleConst.kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AvatarNameRow(),

                const SizedBox(
                  height: StyleConst.kDefaultPadding,
                ),

                //description

                ReadMoreText(
                  tutor.description,
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: '  Show less',
                  lessStyle: GoogleFonts.roboto(
                      textStyle: FontConst.regular
                          .copyWith(fontSize: 15, color: Colors.blueAccent)),
                  moreStyle: GoogleFonts.roboto(
                      textStyle: FontConst.regular
                          .copyWith(fontSize: 15, color: Colors.blueAccent)),
                  style: GoogleFonts.roboto(
                      textStyle: FontConst.medium.copyWith(
                          fontSize: 15, color: ColorConst.greyTextColor)),
                ),

                const SizedBox(
                  height: StyleConst.kDefaultPadding,
                ),

                //Row favorite, report, reviews

                const FavoriteReportReviewRow(),

                //Video player
                const SizedBox(
                  height: StyleConst.kDefaultPadding,
                ),

                VideoPlayerWidget(
                  video_url: tutor.video_url,
                ),

                const SizedBox(
                  height: StyleConst.kDefaultPadding,
                ),

                //Language

                SectionWithChipWidget(title: "Languages", listChip: tutor.languages),

                const SizedBox(
                  height: StyleConst.kDefaultPadding,
                ),

                //Specialities

                SectionWithChipWidget(title: "Specialities", listChip: tutor.specialites),

                const SizedBox(
                  height: StyleConst.kDefaultPadding,
                ),

                //Interests
                SectionWithTextWidget(title: "Interests", description: tutor.interests),

                const SizedBox(
                  height: StyleConst.kDefaultPadding,
                ),
                
                //Teaching experience
                SectionWithTextWidget(title: "Teaching experience", description: tutor.teaching_experience),

                const SizedBox(
                  height: StyleConst.kDefaultPadding,
                ),
                
                Text("Calendar still don't know how", style: TextStyle(fontSize: 50),)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
