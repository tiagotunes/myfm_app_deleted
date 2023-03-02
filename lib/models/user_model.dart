class User {
  final int? id;
  final String name, country, countryFlag, birthdate;
  final String? imgPath;

  const User({
    this.id,
    required this.name,
    required this.country,
    required this.countryFlag,
    required this.birthdate,
    this.imgPath,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        country: json['country'],
        countryFlag: json['countryFlag'],
        birthdate: json['birthdate'],
        imgPath: json['imgPath'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'country': country,
        'countryFlag': countryFlag,
        'birthdate': birthdate,
        'imgPath': imgPath,
      };
}
