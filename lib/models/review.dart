

class Review {
  String avaUrl;

  String name;

  DateTime createdAt;

  double ratedStar;

  String content;

//<editor-fold desc="Data Methods">
  Review({
    required this.avaUrl,
    required this.name,
    required this.createdAt,
    required this.ratedStar,
    required this.content,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Review &&
          runtimeType == other.runtimeType &&
          avaUrl == other.avaUrl &&
          name == other.name &&
          createdAt == other.createdAt &&
          ratedStar == other.ratedStar &&
          content == other.content);

  @override
  int get hashCode =>
      avaUrl.hashCode ^
      name.hashCode ^
      createdAt.hashCode ^
      ratedStar.hashCode ^
      content.hashCode;

  @override
  String toString() {
    return 'Review{' +
        ' avaUrl: $avaUrl,' +
        ' name: $name,' +
        ' createdAt: $createdAt,' +
        ' ratedStar: $ratedStar,' +
        ' content: $content,' +
        '}';
  }

  Review copyWith({
    String? avaUrl,
    String? name,
    DateTime? createdAt,
    double? ratedStar,
    String? content,
  }) {
    return Review(
      avaUrl: avaUrl ?? this.avaUrl,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      ratedStar: ratedStar ?? this.ratedStar,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'avaUrl': this.avaUrl,
      'name': this.name,
      'createdAt': this.createdAt,
      'ratedStar': this.ratedStar,
      'content': this.content,
    };
  }

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      avaUrl: map['avaUrl'] as String,
      name: map['name'] as String,
      createdAt: map['createdAt'] as DateTime,
      ratedStar: map['ratedStar'] as double,
      content: map['content'] as String,
    );
  }

//</editor-fold>
}