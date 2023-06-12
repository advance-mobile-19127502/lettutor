import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/bloc/course_detail_bloc/course_detail_bloc.dart';
import 'package:lettutor/common_widget/section_widget.dart';
import 'package:lettutor/constants/style_const.dart';
import 'package:lettutor/data/level_options.dart';
import 'package:lettutor/pages/course_detail_page/widgets/attribute_section.dart';
import 'package:lettutor/pages/course_detail_page/widgets/section_with_description.dart';
import 'package:lettutor/pages/course_detail_page/widgets/title_des_image_course.dart';
import 'package:lettutor/pages/course_detail_page/widgets/topic_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CourseDetailPage extends StatefulWidget {
  const CourseDetailPage({Key? key, required this.courseName})
      : super(key: key);
  final String courseName;

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  late CourseDetailBloc courseDetailBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    courseDetailBloc = BlocProvider.of<CourseDetailBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDetailBloc, CourseDetailState>(
      builder: (context, state) {
        if (state is CourseDetailError) {
          return Scaffold(
              appBar: AppBar(
                title: Text(widget.courseName),
              ),
              body: const Center(
                  child: Text("Failed to get course information")));
        }
        if (state is CourseDetailSuccess) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.courseName),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(StyleConst.kDefaultPadding),
                child: Column(
                  children: [
                    TitleDesImageWidget(
                        imageUrl: state.courseInfo.imageUrl ?? "",
                        title: state.courseInfo.name ?? "",
                        description: state.courseInfo.description ?? ""),
                    const SizedBox(
                      height: StyleConst.kDefaultPadding,
                    ),
                    SectionWidget(
                      sectionTitle: AppLocalizations.of(context)!.overview,
                      fontSize: 22,
                    ),
                    const SizedBox(
                      height: StyleConst.kDefaultPadding,
                    ),
                    SectionWithDescriptionWidget(
                        sectionTitle:
                            AppLocalizations.of(context)!.whyTakeCourse,
                        description: state.courseInfo.reason ?? ""),
                    const SizedBox(
                      height: StyleConst.kDefaultPadding,
                    ),
                    SectionWithDescriptionWidget(
                        sectionTitle:
                            AppLocalizations.of(context)!.whatWillAbleDo,
                        description: state.courseInfo.purpose ?? ""),
                    const SizedBox(
                      height: StyleConst.kDefaultPadding,
                    ),
                    AttributeSection(
                        sectionTitle:
                            AppLocalizations.of(context)!.experienceLevel,
                        attribute: levelOption[
                            int.parse(state.courseInfo.level ?? "0")],
                        icon: Icons.people_outline),
                    const SizedBox(
                      height: StyleConst.kDefaultPadding,
                    ),
                    AttributeSection(
                        sectionTitle:
                            AppLocalizations.of(context)!.courseLength,
                        attribute:
                            "${state.courseInfo.topics?.length} ${AppLocalizations.of(context)!.topics}",
                        icon: Icons.book_outlined),
                    const SizedBox(
                      height: StyleConst.kDefaultPadding,
                    ),
                    SectionWidget(
                      sectionTitle: AppLocalizations.of(context)!.listTopic,
                      fontSize: 22,
                    ),
                    ...state.courseInfo.topics!
                        .map((e) =>
                            TopicTile(topic: e, index: e.orderCourse ?? 0 + 1))
                        .toList(),
                  ],
                ),
              ),
            ),
          );
        }
        return Scaffold(
            appBar: AppBar(
              title: Text(widget.courseName),
            ),
            body: const Center(child: CircularProgressIndicator()));
      },
    );
  }
}
