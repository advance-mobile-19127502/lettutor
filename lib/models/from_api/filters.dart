class Filters {
  Nationality? nationality;
  List<String>? specialties;

  Filters({this.nationality, this.specialties});

  Filters.fromJson(Map<String, dynamic> json) {
    nationality = json['nationality'] != null
        ? Nationality.fromJson(json['nationality'])
        : null;
    specialties = json['specialties'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (nationality != null) {
      data['nationality'] = nationality!.toJson();
    }
    data['specialties'] = specialties;
    return data;
  }
}

class Nationality {
  bool? isNative;
  bool? isVietNamese;

  Nationality({this.isNative, this.isVietNamese});

  Nationality.fromJson(Map<String, dynamic> json) {
    isNative = json['isNative'];
    isVietNamese = json['isVietNamese'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isNative'] = isNative;
    data['isVietNamese'] = isVietNamese;
    return data;
  }
}
