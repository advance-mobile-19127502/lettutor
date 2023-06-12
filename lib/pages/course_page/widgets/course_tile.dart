import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/data/level_options.dart';
import 'package:lettutor/models/from_api/course_info.dart';
import 'package:lettutor/route_generator.dart';

class CourseTile extends StatelessWidget {
  final CourseInfo courseInfo;

  const CourseTile({Key? key, required this.courseInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(RouteGenerator.courseDetailRoute,
            arguments: {
              'courseId': courseInfo.id,
              'courseName': courseInfo.name
            });
      },
      child: Container(
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
            Expanded(
              flex: 3,
              child: SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(StyleConst.defaultRadius),
                      topLeft: Radius.circular(StyleConst.defaultRadius)),
                  child: CachedNetworkImage(
                      imageUrl: courseInfo.imageUrl ??
                          "https://play-lh.googleusercontent.com/7pMjZVSZahaqMHzY1mtc0A1uCI0eH0m9K_kRZ9r9PmUCwKfm5TYEaMuZP6S6s-TdjQ",
                      fit: BoxFit.fitWidth,
                      errorWidget: (_, __, ___) {
                        return Image.network(
                            "https://play-lh.googleusercontent.com/7pMjZVSZahaqMHzY1mtc0A1uCI0eH0m9K_kRZ9r9PmUCwKfm5TYEaMuZP6S6s-TdjQ");
                      }),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(StyleConst.kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        courseInfo.name ?? "",
                        style: GoogleFonts.poppins(
                            textStyle: FontConst.medium.copyWith(fontSize: 16)),
                      ),
                      Text(
                        courseInfo.description ?? "",
                        style: GoogleFonts.poppins(
                            textStyle: FontConst.regular
                                .copyWith(fontSize: 12, color: Colors.grey)),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Text(
                          "${levelOption[int.parse(courseInfo.level ?? "0")]} - ${courseInfo.topics?.length} Lessons")
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
