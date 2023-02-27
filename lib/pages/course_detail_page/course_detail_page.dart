import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lettutor/constants/colors_const.dart';
import 'package:lettutor/constants/font_const.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/models/course.dart';
import 'package:lettutor/pages/course_detail_page/widgets/attribute_section.dart';
import 'package:lettutor/common_widget/section_widget.dart';
import 'package:lettutor/pages/course_detail_page/widgets/section_with_description.dart';
import 'package:lettutor/pages/course_detail_page/widgets/title_des_image_course.dart';
import 'package:lettutor/pages/course_detail_page/widgets/topic_tile.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({Key? key, required this.course}) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(StyleConst.kDefaultPadding),
          child: Column(
            children: [
              TiltleDesImageWidget(
                  imageUrl: course.imageUrl,
                  title: course.title,
                  description: course.description),
              const SizedBox(
                height: StyleConst.kDefaultPadding,
              ),
              const SectionWidget(sectionTitle: "Overview", fontSize: 22,),
              const SizedBox(
                height: StyleConst.kDefaultPadding,
              ),
              SectionWithDescriptionWidget(
                  sectionTitle: "Why take this course",
                  description: course.reason),
              const SizedBox(
                height: StyleConst.kDefaultPadding,
              ),
              SectionWithDescriptionWidget(
                  sectionTitle: "What will you be able to do",
                  description: course.achievement),
              const SizedBox(
                height: StyleConst.kDefaultPadding,
              ),
              AttributeSection(
                  sectionTitle: "Experience Level  ",
                  attribute: course.level,
                  icon: Icons.people_outline),
              const SizedBox(
                height: StyleConst.kDefaultPadding,
              ),
              AttributeSection(
                  sectionTitle: "Course Length  ",
                  attribute: "${course.numLessons} topics",
                  icon: Icons.book_outlined),
              const SizedBox(
                height: StyleConst.kDefaultPadding,
              ),
              const SectionWidget(sectionTitle: "List Topics  ", fontSize: 22,),

              ...List.generate(
                  course.listTopic.length,
                  (index) => TopicTile(
                      topic: course.listTopic[index], index: index))
            ],
          ),
        ),
      ),
    );
  }
}
