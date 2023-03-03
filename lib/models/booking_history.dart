

class BookingHostory {
  DateTime startDate;
  DateTime endDate;
  String avaTutorUrl;

  String nameTutor;

  String countryTutor;

  String? request;
  String? review;

//<editor-fold desc="Data Methods">
  BookingHostory({
    required this.startDate,
    required this.endDate,
    required this.avaTutorUrl,
    required this.nameTutor,
    required this.countryTutor,
    this.request,
    this.review,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookingHostory &&
          runtimeType == other.runtimeType &&
          startDate == other.startDate &&
          endDate == other.endDate &&
          avaTutorUrl == other.avaTutorUrl &&
          nameTutor == other.nameTutor &&
          countryTutor == other.countryTutor &&
          request == other.request &&
          review == other.review);

  @override
  int get hashCode =>
      startDate.hashCode ^
      endDate.hashCode ^
      avaTutorUrl.hashCode ^
      nameTutor.hashCode ^
      countryTutor.hashCode ^
      request.hashCode ^
      review.hashCode;

  @override
  String toString() {
    return 'BookingHostory{' +
        ' startDate: $startDate,' +
        ' endDate: $endDate,' +
        ' avaTutorUrl: $avaTutorUrl,' +
        ' nameTutor: $nameTutor,' +
        ' countryTutor: $countryTutor,' +
        ' request: $request,' +
        ' review: $review,' +
        '}';
  }

  BookingHostory copyWith({
    DateTime? startDate,
    DateTime? endDate,
    String? avaTutorUrl,
    String? nameTutor,
    String? countryTutor,
    String? request,
    String? review,
  }) {
    return BookingHostory(
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      avaTutorUrl: avaTutorUrl ?? this.avaTutorUrl,
      nameTutor: nameTutor ?? this.nameTutor,
      countryTutor: countryTutor ?? this.countryTutor,
      request: request ?? this.request,
      review: review ?? this.review,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'startDate': this.startDate,
      'endDate': this.endDate,
      'avaTutorUrl': this.avaTutorUrl,
      'nameTutor': this.nameTutor,
      'countryTutor': this.countryTutor,
      'request': this.request,
      'review': this.review,
    };
  }

  factory BookingHostory.fromMap(Map<String, dynamic> map) {
    return BookingHostory(
      startDate: map['startDate'] as DateTime,
      endDate: map['endDate'] as DateTime,
      avaTutorUrl: map['avaTutorUrl'] as String,
      nameTutor: map['nameTutor'] as String,
      countryTutor: map['countryTutor'] as String,
      request: map['request'] as String,
      review: map['review'] as String,
    );
  }

//</editor-fold>
}