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

  @override
  void initState() {
    super.initState();
    listCourseBloc = BlocProvider.of<ListCourseBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCourseBloc, ListCourseState>(
      builder: (context, state) {
        if (state is ListCourseSuccess) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...listCourseBloc.listCategory.map((e) {
                  List<CourseInfo> tempList = state.listCourse
                      .where((element) => element.categories!
                          .any((elementCategory) => elementCategory.id == e.id))
                      .toList();
                  if (tempList.isNotEmpty) {
                    return Column(
                      children: [
                        SectionCourseTile(
                          sectionCategory: e,
                          listCourseCategory: tempList,
                        ),
                        const SizedBox(
                          height: 8,
                        )
                      ],
                    );
                  } else {
                    return const SizedBox();
                  }
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
