import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lettutor/bloc/list_course_bloc/list_course_bloc.dart';
import 'package:lettutor/models/from_api/course_info.dart';
import 'package:lettutor/pages/course_page/widgets/section_course_tile.dart';

class ListCourseWidget extends StatefulWidget {
  const ListCourseWidget({Key? key}) : super(key: key);

  @override
  State<ListCourseWidget> createState() => _ListCourseWidgetState();
}

class _ListCourseWidgetState extends State<ListCourseWidget> {
  late ListCourseBloc listCourseBloc;
  Map<String, List<CourseInfo>> mapCourse = {};

  @override
  void initState() {
    super.initState();
    listCourseBloc = BlocProvider.of<ListCourseBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ListCourseBloc, ListCourseState>(
      listener: (context, state) {
        if (state is ListCourseSuccess) {
          List<CourseInfo> tempCourseList = List.from(state.listCourse);
          mapCourse.clear();
          for (CourseInfo i in tempCourseList) {
            if (mapCourse[i.categories?.first.key] == null) {
              mapCourse[i.categories!.first.key!] = [];
              for (CourseInfo j in tempCourseList) {
                if (j.categories!.first.key == i.categories!.first.key) {
                  mapCourse[i.categories!.first.key]?.add(j);
                }
              }
            }
          }
        }
      },
      builder: (context, state) {
        if (state is ListCourseSuccess) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...mapCourse.entries.map((e) {
                  return Column(
                    children: [
                      SectionCourseTile(
                        sectionCategory: listCourseBloc.listCategory
                            .firstWhere((element) => element.key == e.key),
                        listCourseCategory: e.value,
                      ),
                      const SizedBox(
                        height: 8,
                      )
                    ],
                  );
                }),
              ]);
        }
        if (state is ListCourseError) {
          return const Center(child: Text("Error while fetching data"));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
