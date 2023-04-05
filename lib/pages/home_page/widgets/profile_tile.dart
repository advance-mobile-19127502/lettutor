import 'package:extended_wrap/extended_wrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/bloc/list_tutor_bloc/list_tutor_bloc.dart';
import 'package:lettutor/common_widget/common_btn.dart';
import 'package:lettutor/common_widget/item_chip.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/models/from_api/tutor_info_pagination.dart';
import 'package:lettutor/pages/home_page/widgets/avatar_heart_widget.dart';
import 'package:lettutor/route_generator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({Key? key, required this.tutorInfo}) : super(key: key);

  final TutorInfoPagination tutorInfo;

  @override
  Widget build(BuildContext context) {
    List<String> specialities = tutorInfo.specialties?.split(",") ?? [];
    return Padding(
      padding: const EdgeInsets.only(
          left: StyleConst.kDefaultPadding / 2,
          right: StyleConst.kDefaultPadding,
          bottom: StyleConst.kDefaultPadding),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(RouteGenerator.tutorDetailRoute, arguments: {
            'tutorID': tutorInfo.userId,
            "listTutorBloc": BlocProvider.of<ListTutorBloc>(context)
          });
        },
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
              //avatar and heart
              AvatarAndHeartWidget(tutorInfo: tutorInfo),

              //name

              Text(
                tutorInfo.name ?? "",
                style: GoogleFonts.poppins(
                    textStyle: FontConst.medium.copyWith(fontSize: 22)),
              ),

              Text(
                tutorInfo.country ?? "",
                style: GoogleFonts.roboto(
                    textStyle: FontConst.regular.copyWith(
                        fontSize: 14, color: ColorConst.hintTextColor)),
              ),

              //rating star
              Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: RatingBarIndicator(
                    rating: tutorInfo.rating?.toDouble() ?? 0,
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
                children: List<Widget>.generate(specialities.length, (index) {
                  return ItemChip(content: specialities[index]);
                }).toList(),
              ),

              const SizedBox(
                height: StyleConst.kDefaultPadding,
              ),

              //description

              Text(
                tutorInfo.bio ?? "",
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
                    title: AppLocalizations.of(context)!.book,
                    onPress: () {},
                    icon: Icons.my_library_books,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
