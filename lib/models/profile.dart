

class Profile {
  String name;

  String email;

  String avaUrl;

  bool isTutor;

//<editor-fold desc="Data Methods">
  Profile({
    required this.name,
    required this.email,
    required this.avaUrl,
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
          isTutor == other.isTutor);

  @override
  int get hashCode =>
      name.hashCode ^ email.hashCode ^ avaUrl.hashCode ^ isTutor.hashCode;

  @override
  String toString() {
    return 'Profile{' +
        ' name: $name,' +
        ' email: $email,' +
        ' avaUrl: $avaUrl,' +
        ' isTutor: $isTutor,' +
        '}';
  }

  Profile copyWith({
    String? name,
    String? email,
    String? avaUrl,
    bool? isTutor,
  }) {
    return Profile(
      name: name ?? this.name,
      email: email ?? this.email,
      avaUrl: avaUrl ?? this.avaUrl,
      isTutor: isTutor ?? this.isTutor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'email': this.email,
      'avaUrl': this.avaUrl,
      'isTutor': this.isTutor,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      name: map['name'] as String,
      email: map['email'] as String,
      avaUrl: map['avaUrl'] as String,
      isTutor: map['isTutor'] as bool,
    );
  }

//</editor-fold>
}