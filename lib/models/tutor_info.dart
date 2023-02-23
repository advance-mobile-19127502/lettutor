import 'package:flutter/cupertino.dart';

class Tutor extends ChangeNotifier {
  final String name;

  final String ava_url;

  final String country;

  final double rated_star;

  final List<String> specialites;

  final String description;

  final String video_url;

  final List<String> languages;

  final String interests;

  final String teaching_experience;


  bool isFavorite;

  setFavorite(bool value)
  {
    isFavorite = value;
    notifyListeners();
  }

//<editor-fold desc="Data Methods">
  Tutor({
    required this.name,
    required this.ava_url,
    required this.country,
    required this.rated_star,
    required this.specialites,
    required this.description,
    required this.video_url,
    required this.languages,
    required this.interests,
    required this.teaching_experience,
    required this.isFavorite,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tutor &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          ava_url == other.ava_url &&
          country == other.country &&
          rated_star == other.rated_star &&
          specialites == other.specialites &&
          description == other.description &&
          video_url == other.video_url &&
          languages == other.languages &&
          interests == other.interests &&
          teaching_experience == other.teaching_experience &&
          isFavorite == other.isFavorite);

  @override
  int get hashCode =>
      name.hashCode ^
      ava_url.hashCode ^
      country.hashCode ^
      rated_star.hashCode ^
      specialites.hashCode ^
      description.hashCode ^
      video_url.hashCode ^
      languages.hashCode ^
      interests.hashCode ^
      teaching_experience.hashCode ^
      isFavorite.hashCode;

  @override
  String toString() {
    return 'Tutor{' +
        ' name: $name,' +
        ' ava_url: $ava_url,' +
        ' country: $country,' +
        ' rated_star: $rated_star,' +
        ' specialites: $specialites,' +
        ' description: $description,' +
        ' video_url: $video_url,' +
        ' languages: $languages,' +
        ' interests: $interests,' +
        ' teaching_experience: $teaching_experience,' +
        ' isFavorite: $isFavorite,' +
        '}';
  }

  Tutor copyWith({
    String? name,
    String? ava_url,
    String? country,
    double? rated_star,
    List<String>? specialites,
    String? description,
    String? video_url,
    List<String>? languages,
    String? interests,
    String? teaching_experience,
    bool? isFavorite,
  }) {
    return Tutor(
      name: name ?? this.name,
      ava_url: ava_url ?? this.ava_url,
      country: country ?? this.country,
      rated_star: rated_star ?? this.rated_star,
      specialites: specialites ?? this.specialites,
      description: description ?? this.description,
      video_url: video_url ?? this.video_url,
      languages: languages ?? this.languages,
      interests: interests ?? this.interests,
      teaching_experience: teaching_experience ?? this.teaching_experience,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'ava_url': this.ava_url,
      'country': this.country,
      'rated_star': this.rated_star,
      'specialites': this.specialites,
      'description': this.description,
      'video_url': this.video_url,
      'languages': this.languages,
      'interests': this.interests,
      'teaching_experience': this.teaching_experience,
      'isFavorite': this.isFavorite,
    };
  }

  factory Tutor.fromMap(Map<String, dynamic> map) {
    return Tutor(
      name: map['name'] as String,
      ava_url: map['ava_url'] as String,
      country: map['country'] as String,
      rated_star: map['rated_star'] as double,
      specialites: map['specialites'] as List<String>,
      description: map['description'] as String,
      video_url: map['video_url'] as String,
      languages: map['languages'] as List<String>,
      interests: map['interests'] as String,
      teaching_experience: map['teaching_experience'] as String,
      isFavorite: map['isFavorite'] as bool,
    );
  }

//</editor-fold>
}
