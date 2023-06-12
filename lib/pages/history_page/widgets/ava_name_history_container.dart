import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/models/from_api/tutor_info_pagination.dart';

class AvaNameHistoryContainer extends StatelessWidget {
  const AvaNameHistoryContainer({Key? key, required this.tutorInfo})
      : super(key: key);
  final TutorInfoPagination tutorInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(StyleConst.kDefaultPadding / 2),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          ClipOval(
            child: SizedBox.fromSize(
              size: const Size.fromRadius(25),
              child: Image.network(
                tutorInfo.avatar ??
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
            width: StyleConst.kDefaultPadding / 2,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tutorInfo.name ?? "",
                  style: GoogleFonts.roboto(
                      textStyle: FontConst.medium.copyWith(fontSize: 20)),
                ),
                Text(tutorInfo.country ?? "",
                    style: GoogleFonts.roboto(
                        textStyle: FontConst.regular.copyWith(fontSize: 14))),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text("Direct Message",
                        style: GoogleFonts.roboto(
                            textStyle:
                                FontConst.regular.copyWith(fontSize: 14))))
              ],
            ),
          )
        ],
      ),
    );
  }
}
