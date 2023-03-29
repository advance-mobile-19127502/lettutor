import 'package:lettutor/models/from_api/tutor_course.dart';

class Courses {
  String? id;
  String? name;
  TutorCourse? tutorCourse;

  Courses({this.id, this.name, this.tutorCourse});

  Courses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tutorCourse = json['TutorCourse'] != null
        ? TutorCourse.fromJson(json['TutorCourse'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (tutorCourse != null) {
      data['TutorCourse'] = tutorCourse!.toJson();
    }
    return data;
  }
}
