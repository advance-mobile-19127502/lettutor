

class Topic {
  final String title;
  final String pdfUrl;

//<editor-fold desc="Data Methods">
  const Topic({
    required this.title,
    required this.pdfUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Topic &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          pdfUrl == other.pdfUrl);

  @override
  int get hashCode => title.hashCode ^ pdfUrl.hashCode;

  @override
  String toString() {
    return 'Topic{' + ' title: $title,' + ' pdfUrl: $pdfUrl,' + '}';
  }

  Topic copyWith({
    String? title,
    String? pdfUrl,
  }) {
    return Topic(
      title: title ?? this.title,
      pdfUrl: pdfUrl ?? this.pdfUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'pdfUrl': this.pdfUrl,
    };
  }

  factory Topic.fromMap(Map<String, dynamic> map) {
    return Topic(
      title: map['title'] as String,
      pdfUrl: map['pdfUrl'] as String,
    );
  }

//</editor-fold>
}