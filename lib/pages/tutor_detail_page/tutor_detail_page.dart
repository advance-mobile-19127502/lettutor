import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/bloc/schedule_bloc/schedule_bloc.dart';
import 'package:lettutor/bloc/tutor_detail_bloc/tutor_detail_bloc.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/constants/url_const.dart';
import 'package:lettutor/pages/tutor_detail_page/widgets/avatar_name_row.dart';
import 'package:lettutor/pages/tutor_detail_page/widgets/favorite_report_review_row.dart';
import 'package:lettutor/pages/tutor_detail_page/widgets/section_with_chip.dart';
import 'package:lettutor/pages/tutor_detail_page/widgets/section_with_text.dart';
import 'package:lettutor/pages/tutor_detail_page/widgets/timetable_widget.dart';
import 'package:lettutor/repositories/schedule_repository.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TutorDetailPage extends StatefulWidget {
  const TutorDetailPage({Key? key}) : super(key: key);

  @override
  State<TutorDetailPage> createState() => _TutorDetailPageState();
}

class _TutorDetailPageState extends State<TutorDetailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TutorDetailBloc, TutorDetailState>(
      builder: (context, state) {
        if (state is TutorDetailSuccess) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(StyleConst.kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AvatarNameRow(),

                      const SizedBox(
                        height: StyleConst.kDefaultPadding,
                      ),

                      //description

                      ReadMoreText(
                        state.tutorInfo.bio ?? "",
                        trimLines: 2,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: '  Show less',
                        lessStyle: GoogleFonts.roboto(
                            textStyle: FontConst.regular.copyWith(
                                fontSize: 15, color: Colors.blueAccent)),
                        moreStyle: GoogleFonts.roboto(
                            textStyle: FontConst.regular.copyWith(
                                fontSize: 15, color: Colors.blueAccent)),
                        style: GoogleFonts.roboto(
                            textStyle: FontConst.medium.copyWith(
                                fontSize: 15, color: ColorConst.greyTextColor)),
                      ),

                      const SizedBox(
                        height: StyleConst.kDefaultPadding,
                      ),

                      //Row favorite, report, reviews

                      FavoriteReportReviewRow(
                          tutorId: state.tutorInfo.user?.id ?? "",
                          isFavorite: state.tutorInfo.isFavorite ?? false),

                      //Video player
                      const SizedBox(
                        height: StyleConst.kDefaultPadding,
                      ),

                      // VideoPlayerWidget(
                      //   video_url: tutor.video_url,
                      // ),//

                      const SizedBox(
                        height: StyleConst.kDefaultPadding,
                      ),

                      //Language

                      SectionWithChipWidget(
                          title: AppLocalizations.of(context)!.languages,
                          listChip:
                              state.tutorInfo.languages?.split(",") ?? []),

                      const SizedBox(
                        height: StyleConst.kDefaultPadding,
                      ),

                      //Specialities

                      SectionWithChipWidget(
                          title: AppLocalizations.of(context)!.specialities,
                          listChip:
                              state.tutorInfo.specialties?.split(",") ?? []),

                      const SizedBox(
                        height: StyleConst.kDefaultPadding,
                      ),

                      //Interests
                      SectionWithTextWidget(
                          title: AppLocalizations.of(context)!.interest,
                          description: state.tutorInfo.interests ?? ""),

                      const SizedBox(
                        height: StyleConst.kDefaultPadding,
                      ),

                      //Teaching experience
                      SectionWithTextWidget(
                          title:
                              AppLocalizations.of(context)!.teachingExperience,
                          description: state.tutorInfo.experience ?? ""),

                      const SizedBox(
                        height: StyleConst.kDefaultPadding,
                      ),

                      BlocProvider(
                        create: (context) =>
                            ScheduleBloc(ScheduleRepository(UrlConst.baseUrl)),
                        child: TimeTableWidget(
                            tutorId: state.tutorInfo.user?.id ?? ""),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        if (state is TutorDetailError) {
          return Scaffold(
              appBar: AppBar(),
              body:
                  const Center(child: Text("Failed to get tutor information")));
        }
        return Scaffold(
            appBar: AppBar(),
            body: const Center(child: CircularProgressIndicator()));
      },
    );
  }
}
