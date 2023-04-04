import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/models/from_api/topic_course.dart';
import 'package:lettutor/models/topic.dart';
import 'package:lettutor/pages/course_detail_page/pdf_view_page.dart';
import 'package:lettutor/route_generator.dart';

class TopicTile extends StatelessWidget {
  const TopicTile({Key? key, required this.topic, required this.index})
      : super(key: key);

  final Topics topic;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: StyleConst.kDefaultPadding),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(RouteGenerator.pdfViewerRoute,
              arguments: {
                "pdfUrl": topic.nameFile ?? "",
                "pdfName": topic.name ?? ""
              });
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
              horizontal: StyleConst.kDefaultPadding,
              vertical: StyleConst.kDefaultPadding * 2),
          decoration: BoxDecoration(boxShadow: const [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 1,
              spreadRadius: 1,
              color: Colors.black26,
            ),
          ], color: Colors.grey[100]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$index.",
                style: GoogleFonts.roboto(
                    textStyle: FontConst.regular.copyWith(fontSize: 16)),
              ),
              const SizedBox(
                height: StyleConst.kDefaultPadding / 3,
              ),
              Text(topic.name ?? "",
                  style: GoogleFonts.poppins(
                      textStyle: FontConst.medium.copyWith(fontSize: 16))),
            ],
          ),
        ),
      ),
    );
  }
}
