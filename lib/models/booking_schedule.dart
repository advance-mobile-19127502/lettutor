

class BookingSchedule {
  DateTime startDate;
  DateTime endDate;
  String avaTutorUrl;

  String nameTutor;

  String countryTutor;

  String? request;

//<editor-fold desc="Data Methods">
  BookingSchedule({
    required this.startDate,
    required this.endDate,
    required this.avaTutorUrl,
    required this.nameTutor,
    required this.countryTutor,
    this.request,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BookingSchedule &&
          runtimeType == other.runtimeType &&
          startDate == other.startDate &&
          endDate == other.endDate &&
          avaTutorUrl == other.avaTutorUrl &&
          nameTutor == other.nameTutor &&
          countryTutor == other.countryTutor &&
          request == other.request);

  @override
  int get hashCode =>
      startDate.hashCode ^
      endDate.hashCode ^
      avaTutorUrl.hashCode ^
      nameTutor.hashCode ^
      countryTutor.hashCode ^
      request.hashCode;

  @override
  String toString() {
    return 'BookingSchedule{' +
        ' startDate: $startDate,' +
        ' endDate: $endDate,' +
        ' avaTutorUrl: $avaTutorUrl,' +
        ' nameTutor: $nameTutor,' +
        ' countryTutor: $countryTutor,' +
        ' request: $request,' +
        '}';
  }

  BookingSchedule copyWith({
    DateTime? startDate,
    DateTime? endDate,
    String? avaTutorUrl,
    String? nameTutor,
    String? countryTutor,
    String? request,
  }) {
    return BookingSchedule(
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      avaTutorUrl: avaTutorUrl ?? this.avaTutorUrl,
      nameTutor: nameTutor ?? this.nameTutor,
      countryTutor: countryTutor ?? this.countryTutor,
      request: request ?? this.request,
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
    };
  }

  factory BookingSchedule.fromMap(Map<String, dynamic> map) {
    return BookingSchedule(
      startDate: map['startDate'] as DateTime,
      endDate: map['endDate'] as DateTime,
      avaTutorUrl: map['avaTutorUrl'] as String,
      nameTutor: map['nameTutor'] as String,
      countryTutor: map['countryTutor'] as String,
      request: map['request'] as String,
    );
  }

//</editor-fold>
}