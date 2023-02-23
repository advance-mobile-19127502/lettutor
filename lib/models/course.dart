import 'package:lettutor/models/topic.dart';

class Course {
  final String title;
  final String description;
  final String level;
  final int numLessons;
  final String imageUrl;

  final String reason;
  final String achievement;
  final List<Topic> listTopic;

//<editor-fold desc="Data Methods">
  const Course({
    required this.title,
    required this.description,
    required this.level,
    required this.numLessons,
    required this.imageUrl,
    required this.reason,
    required this.achievement,
    required this.listTopic,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Course &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          description == other.description &&
          level == other.level &&
          numLessons == other.numLessons &&
          imageUrl == other.imageUrl &&
          reason == other.reason &&
          achievement == other.achievement &&
          listTopic == other.listTopic);

  @override
  int get hashCode =>
      title.hashCode ^
      description.hashCode ^
      level.hashCode ^
      numLessons.hashCode ^
      imageUrl.hashCode ^
      reason.hashCode ^
      achievement.hashCode ^
      listTopic.hashCode;

  @override
  String toString() {
    return 'Course{' +
        ' title: $title,' +
        ' description: $description,' +
        ' level: $level,' +
        ' numLessons: $numLessons,' +
        ' imageUrl: $imageUrl,' +
        ' reason: $reason,' +
        ' achievement: $achievement,' +
        ' listTopic: $listTopic,' +
        '}';
  }

  Course copyWith({
    String? title,
    String? description,
    String? level,
    int? numLessons,
    String? imageUrl,
    String? reason,
    String? achievement,
    List<Topic>? listTopic,
  }) {
    return Course(
      title: title ?? this.title,
      description: description ?? this.description,
      level: level ?? this.level,
      numLessons: numLessons ?? this.numLessons,
      imageUrl: imageUrl ?? this.imageUrl,
      reason: reason ?? this.reason,
      achievement: achievement ?? this.achievement,
      listTopic: listTopic ?? this.listTopic,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'description': this.description,
      'level': this.level,
      'numLessons': this.numLessons,
      'imageUrl': this.imageUrl,
      'reason': this.reason,
      'achievement': this.achievement,
      'listTopic': this.listTopic,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      title: map['title'] as String,
      description: map['description'] as String,
      level: map['level'] as String,
      numLessons: map['numLessons'] as int,
      imageUrl: map['imageUrl'] as String,
      reason: map['reason'] as String,
      achievement: map['achievement'] as String,
      listTopic: map['listTopic'] as List<Topic>,
    );
  }

//</editor-fold>
}
