class Course {
  final String title;
  final String description;
  final String level;
  final int numLessons;
  final String imageUrl;

//<editor-fold desc="Data Methods">
  const Course({
    required this.title,
    required this.description,
    required this.level,
    required this.numLessons,
    required this.imageUrl,
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
          imageUrl == other.imageUrl);

  @override
  int get hashCode =>
      title.hashCode ^
      description.hashCode ^
      level.hashCode ^
      numLessons.hashCode ^
      imageUrl.hashCode;

  @override
  String toString() {
    return 'Course{' +
        ' title: $title,' +
        ' description: $description,' +
        ' level: $level,' +
        ' numLessons: $numLessons,' +
        ' imageUrl: $imageUrl,' +
        '}';
  }

  Course copyWith({
    String? title,
    String? description,
    String? level,
    int? numLessons,
    String? imageUrl,
  }) {
    return Course(
      title: title ?? this.title,
      description: description ?? this.description,
      level: level ?? this.level,
      numLessons: numLessons ?? this.numLessons,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'description': this.description,
      'level': this.level,
      'numLessons': this.numLessons,
      'imageUrl': this.imageUrl,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      title: map['title'] as String,
      description: map['description'] as String,
      level: map['level'] as String,
      numLessons: map['numLessons'] as int,
      imageUrl: map['imageUrl'] as String,
    );
  }

//</editor-fold>
}
