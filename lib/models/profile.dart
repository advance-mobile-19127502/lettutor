

class Profile {
  String name;

  String email;

  String avaUrl;

  String phoneNumber;

  String country;

  DateTime dateOfBirth;

  String myLevel;

  String wantToLearn;

  String studySchedule;

  bool isTutor;

//<editor-fold desc="Data Methods">
  Profile({
    required this.name,
    required this.email,
    required this.avaUrl,
    required this.phoneNumber,
    required this.country,
    required this.dateOfBirth,
    required this.myLevel,
    required this.wantToLearn,
    required this.studySchedule,
    required this.isTutor,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Profile &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          email == other.email &&
          avaUrl == other.avaUrl &&
          phoneNumber == other.phoneNumber &&
          country == other.country &&
          dateOfBirth == other.dateOfBirth &&
          myLevel == other.myLevel &&
          wantToLearn == other.wantToLearn &&
          studySchedule == other.studySchedule &&
          isTutor == other.isTutor);

  @override
  int get hashCode =>
      name.hashCode ^
      email.hashCode ^
      avaUrl.hashCode ^
      phoneNumber.hashCode ^
      country.hashCode ^
      dateOfBirth.hashCode ^
      myLevel.hashCode ^
      wantToLearn.hashCode ^
      studySchedule.hashCode ^
      isTutor.hashCode;

  @override
  String toString() {
    return 'Profile{' +
        ' name: $name,' +
        ' email: $email,' +
        ' avaUrl: $avaUrl,' +
        ' phoneNumber: $phoneNumber,' +
        ' country: $country,' +
        ' dateOfBirth: $dateOfBirth,' +
        ' myLevel: $myLevel,' +
        ' wantToLearn: $wantToLearn,' +
        ' studySchedule: $studySchedule,' +
        ' isTutor: $isTutor,' +
        '}';
  }

  Profile copyWith({
    String? name,
    String? email,
    String? avaUrl,
    String? phoneNumber,
    String? country,
    DateTime? dateOfBirth,
    String? myLevel,
    String? wantToLearn,
    String? studySchedule,
    bool? isTutor,
  }) {
    return Profile(
      name: name ?? this.name,
      email: email ?? this.email,
      avaUrl: avaUrl ?? this.avaUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      country: country ?? this.country,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      myLevel: myLevel ?? this.myLevel,
      wantToLearn: wantToLearn ?? this.wantToLearn,
      studySchedule: studySchedule ?? this.studySchedule,
      isTutor: isTutor ?? this.isTutor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'email': this.email,
      'avaUrl': this.avaUrl,
      'phoneNumber': this.phoneNumber,
      'country': this.country,
      'dateOfBirth': this.dateOfBirth,
      'myLevel': this.myLevel,
      'wantToLearn': this.wantToLearn,
      'studySchedule': this.studySchedule,
      'isTutor': this.isTutor,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      name: map['name'] as String,
      email: map['email'] as String,
      avaUrl: map['avaUrl'] as String,
      phoneNumber: map['phoneNumber'] as String,
      country: map['country'] as String,
      dateOfBirth: map['dateOfBirth'] as DateTime,
      myLevel: map['myLevel'] as String,
      wantToLearn: map['wantToLearn'] as String,
      studySchedule: map['studySchedule'] as String,
      isTutor: map['isTutor'] as bool,
    );
  }

//</editor-fold>
}