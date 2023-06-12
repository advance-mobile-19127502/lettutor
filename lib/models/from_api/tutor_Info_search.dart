import 'package:lettutor/models/from_api/course.dart';

class TutorInfoSearch {
  String? video;
  String? bio;
  String? education;
  String? experience;
  String? profession;
  String? accent;
  String? targetStudent;
  String? interests;
  String? languages;
  String? specialties;
  num? rating;
  bool? isNative;
  Tutor? user;
  bool? isFavorite;
  num? avgRating;
  int? totalFeedback;

  TutorInfoSearch(
      {this.video,
      this.bio,
      this.education,
      this.experience,
      this.profession,
      this.accent,
      this.targetStudent,
      this.interests,
      this.languages,
      this.specialties,
      this.rating,
      this.isNative,
      this.user,
      this.isFavorite,
      this.avgRating,
      this.totalFeedback});

  TutorInfoSearch.fromJson(Map<String, dynamic> json) {
    video = json['video'];
    bio = json['bio'];
    education = json['education'];
    experience = json['experience'];
    profession = json['profession'];
    accent = json['accent'];
    targetStudent = json['targetStudent'];
    interests = json['interests'];
    languages = json['languages'];
    specialties = json['specialties'];
    rating = json['rating'];
    isNative = json['isNative'];
    user = json['User'] != null ? Tutor.fromJson(json['User']) : null;
    isFavorite = json['isFavorite'];
    avgRating = json['avgRating'];
    totalFeedback = json['totalFeedback'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['video'] = video;
    data['bio'] = bio;
    data['education'] = education;
    data['experience'] = experience;
    data['profession'] = profession;
    data['accent'] = accent;
    data['targetStudent'] = targetStudent;
    data['interests'] = interests;
    data['languages'] = languages;
    data['specialties'] = specialties;
    data['rating'] = rating;
    data['isNative'] = isNative;
    if (user != null) {
      data['User'] = user!.toJson();
    }
    data['isFavorite'] = isFavorite;
    data['avgRating'] = avgRating;
    data['totalFeedback'] = totalFeedback;
    return data;
  }

  TutorInfoSearch copyWith({
    String? video,
    String? bio,
    String? education,
    String? experience,
    String? profession,
    String? accent,
    String? targetStudent,
    String? interests,
    String? languages,
    String? specialties,
    num? rating,
    bool? isNative,
    Tutor? user,
    bool? isFavorite,
    num? avgRating,
    int? totalFeedback,
  }) {
    return TutorInfoSearch(
      video: video ?? this.video,
      bio: bio ?? this.bio,
      education: education ?? this.education,
      experience: experience ?? this.experience,
      profession: profession ?? this.profession,
      accent: accent ?? this.accent,
      targetStudent: targetStudent ?? this.targetStudent,
      interests: interests ?? this.interests,
      languages: languages ?? this.languages,
      specialties: specialties ?? this.specialties,
      rating: rating ?? this.rating,
      isNative: isNative ?? this.isNative,
      user: user ?? this.user,
      isFavorite: isFavorite ?? this.isFavorite,
      avgRating: avgRating ?? this.avgRating,
      totalFeedback: totalFeedback ?? this.totalFeedback,
    );
  }
}

class Tutor {
  String? id;
  String? level;
  String? avatar;
  String? name;
  String? country;
  String? language;
  bool? isPublicRecord;
  String? caredByStaffId;
  String? studentGroupId;
  List<Courses>? courses;

  Tutor(
      {this.id,
      this.level,
      this.avatar,
      this.name,
      this.country,
      this.language,
      this.isPublicRecord,
      this.caredByStaffId,
      this.studentGroupId,
      this.courses});

  Tutor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
    avatar = json['avatar'];
    name = json['name'];
    country = json['country'];
    language = json['language'];
    isPublicRecord = json['isPublicRecord'];
    caredByStaffId = json['caredByStaffId'];
    studentGroupId = json['studentGroupId'];
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses!.add(Courses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['level'] = level;
    data['avatar'] = avatar;
    data['name'] = name;
    data['country'] = country;
    data['language'] = language;
    data['isPublicRecord'] = isPublicRecord;
    data['caredByStaffId'] = caredByStaffId;
    data['studentGroupId'] = studentGroupId;
    if (courses != null) {
      data['courses'] = courses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
