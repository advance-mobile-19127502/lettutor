class Tutor
{
  final String name;

  final String ava_url;

  final String country;

  final double rated_star;

  final List<String> skills;

  final String description;

  Tutor(
      {required this.name,
      required this.country,
      required this.rated_star,
      required this.ava_url,
      required this.skills,
      required this.description});

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'ava_url': this.ava_url,
      'country': this.country,
      'rated_star': this.rated_star,
      'skills': this.skills,
      'description': this.description,
    };
  }

  factory Tutor.fromMap(Map<String, dynamic> map) {
    return Tutor(
      name: map['name'] as String,
      ava_url: map['ava_url'] as String,
      country: map['country'] as String,
      rated_star: map['rated_star'] as double,
      skills: map['skills'] as List<String>,
      description: map['description'] as String,
    );
  }
}
