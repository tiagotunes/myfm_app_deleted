class User {
  final int? id;
  final String name, country, birthdate;

  const User({
    this.id,
    required this.name,
    required this.country,
    required this.birthdate,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        country: json['country'],
        birthdate: json['birthdate'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'country': country,
        'birthdate': birthdate,
      };
}
