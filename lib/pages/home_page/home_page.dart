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

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery
        .of(context)
        .size;
    Provider.of<ListTutorProvider>(context, listen: false).setListTutor(listTutorExample);

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
                  "Find a Tutor",
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
                  "Select available tutoring time:",
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
                  title: "Reset filter",
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
                  "Recommended Tutors",
                  style: GoogleFonts.roboto(
                      textStyle: FontConst.bold.copyWith(fontSize: 25)),
                ),

                Row(
                  children: [
                    Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            "See your favorite tutors",
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

                Consumer<ListTutorProvider>(
                  builder: (context, listTutorProvider, child) {
                    print("123");
                    return Column(
                      children: [
                        ...listTutorProvider.getListTutor.map((e) =>
                            Provider(
                                create: (context) => e,
                                child: const ProfileTile())),
                        const Text("Show more")
                      ],
                    );
                  },
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
