

import 'package:lettutor/models/course.dart';

class SectionCourse {
  final String sectionTitle;
  final List<Course> listCourses;

//<editor-fold desc="Data Methods">
  const SectionCourse({
    required this.sectionTitle,
    required this.listCourses,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SectionCourse &&
          runtimeType == other.runtimeType &&
          sectionTitle == other.sectionTitle &&
          listCourses == other.listCourses);

  @override
  int get hashCode => sectionTitle.hashCode ^ listCourses.hashCode;

  @override
  String toString() {
    return 'SectionCourse{' +
        ' sectionTitle: $sectionTitle,' +
        ' listCourses: $listCourses,' +
        '}';
  }

  SectionCourse copyWith({
    String? sectionTitle,
    List<Course>? listCourses,
  }) {
    return SectionCourse(
      sectionTitle: sectionTitle ?? this.sectionTitle,
      listCourses: listCourses ?? this.listCourses,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sectionTitle': this.sectionTitle,
      'listCourses': this.listCourses,
    };
  }

  factory SectionCourse.fromMap(Map<String, dynamic> map) {
    return SectionCourse(
      sectionTitle: map['sectionTitle'] as String,
      listCourses: map['listCourses'] as List<Course>,
    );
  }

//</editor-fold>
}