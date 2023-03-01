import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/common_widget/common_btn.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/data/list_tutor.dart';
import 'package:lettutor/pages/home_page/widgets/current_course.dart';
import 'package:lettutor/pages/home_page/widgets/list_chip_widget.dart';
import 'package:lettutor/pages/home_page/widgets/profile_tile.dart';
import 'package:lettutor/pages/home_page/widgets/seletec_date_time_widget.dart';
import 'package:lettutor/pages/home_page/widgets/tutor_name_row.dart';
import 'package:lettutor/providers/list_tutor_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ListTutorProvider listTutorProvider =
        Provider.of<ListTutorProvider>(context, listen: false);

    listTutorProvider.setListTutor(listTutorExample);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Current course
          const CurrentCourse(),

          Container(
            padding: const EdgeInsets.all(StyleConst.kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //find a tutor
                Text(
                  AppLocalizations.of(context)!.findATutor,
                  style: GoogleFonts.poppins(
                      textStyle: FontConst.semiBold
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 29)),
                ),

                const SizedBox(
                  height: StyleConst.kDefaultPadding,
                ),
                //form tutor name
                const TutorNameRow(),

                const SizedBox(
                  height: StyleConst.kDefaultPadding,
                ),

                //Select available tutoring time:
                Text(
                  AppLocalizations.of(context)!.selectAvailableTime,
                  //
                  style: GoogleFonts.openSans(
                    textStyle: FontConst.bold.copyWith(fontSize: 14),
                  ),
                ),

                //select date
                const SelectDateTimeWidget(),

                //List Chip
                const ListChipWidget(),

                //Reset filter button
                CommonButtonWidget(
                  title: AppLocalizations.of(context)!.resetFilter,
                  onPress: () {},
                ),

                const SizedBox(
                  height: StyleConst.kDefaultPadding,
                ),

                const Divider(
                  height: 2,
                  thickness: 1,
                ),

                const SizedBox(
                  height: StyleConst.kDefaultPadding,
                ),

                Text(
                  AppLocalizations.of(context)!.recommendedTutor,
                  style: GoogleFonts.roboto(
                      textStyle: FontConst.bold.copyWith(fontSize: 25)),
                ),

                Row(
                  children: [
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.seeFavoriteTutor,
                            style: GoogleFonts.roboto(
                                textStyle: FontConst.regular.copyWith(
                                    fontSize: 12, color: Colors.blueAccent)),
                          ),
                          const Icon(Icons.arrow_forward_ios_outlined,
                              size: 12, color: Colors.blueAccent)
                        ],
                      ),
                    )
                  ],
                ),

                const SizedBox(
                  height: StyleConst.kDefaultPadding / 3,
                ),

                Column(
                  children: [
                    ...listTutorProvider.getListTutor.map((e) => Provider(
                        create: (context) => e, child: const ProfileTile())),
                    const Text("Show more")
                  ],
                )

                //Recommended tutor
              ],
            ),
          )
        ],
      ),
    );
  }
}
