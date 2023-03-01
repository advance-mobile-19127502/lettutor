import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class DiscoverySeachRow extends StatelessWidget {
  const DiscoverySeachRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SvgPicture.network(
              height: 100,
              fit: BoxFit.fitWidth,
              "https://app.lettutor.com/static/media/course.0bf1bb71.svg"),
        ),
        const SizedBox(
          width: StyleConst.kDefaultPadding,
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.discoverCourse,
                style: GoogleFonts.poppins(
                    textStyle: FontConst.semiBold.copyWith(fontSize: 25)),
              ),

              //search
              Row(
                children: [
                   Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        hintText: AppLocalizations.of(context)!.course.toLowerCase(),
                        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  IconButton(
                    iconSize: 16,
                    onPressed: () {},
                    icon: const Icon(Icons.search_outlined),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
