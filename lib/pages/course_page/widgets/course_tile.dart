import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/models/course.dart';

class CourseTile extends StatelessWidget {
  final Course course;

  const CourseTile({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 288,
      height: 352,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(StyleConst.defaultRadius),
                  topLeft: Radius.circular(StyleConst.defaultRadius)),
              child: Image.network(
                course.imageUrl,
                height: 193,
                width: 286,
                fit: BoxFit.fill,
              )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(StyleConst.kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.title,
                  style: GoogleFonts.poppins(
                      textStyle: FontConst.medium.copyWith(fontSize: 16)),
                ),
                Text(
                  course.description,
                  style: GoogleFonts.poppins(
                      textStyle: FontConst.regular.copyWith(fontSize: 12, color: Colors.grey)),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Text("${course.level} - ${course.numLessons} Lessons")
              ],
            ),
          ))
        ],
      ),
    );
  }
}
