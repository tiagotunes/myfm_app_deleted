class User {
  final int? id;
  final String name, country, birthdate;
  final String? imgPath;

  const User({
    this.id,
    required this.name,
    required this.country,
    required this.birthdate,
    this.imgPath,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        country: json['country'],
        birthdate: json['birthdate'],
        imgPath: json['imgPath'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'country': country,
        'birthdate': birthdate,
        'imgPath': imgPath,
      };
}
