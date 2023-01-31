class Team {
  final int? id;
  final String name, country;
  final int year;
  final String? league;
  final int? transferBudget, wageBudget;
  final String? color, imgPath;

  const Team({
    this.id,
    required this.name,
    required this.country,
    required this.year,
    this.league,
    this.transferBudget,
    this.wageBudget,
    this.color,
    this.imgPath,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json['id'],
        name: json['name'],
        country: json['country'],
        year: json['year'],
        league: json['league'],
        transferBudget: json['transferBudget'],
        wageBudget: json['wageBudget'],
        color: json['color'],
        imgPath: json['imgPath'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'country': country,
        'year': year,
        'league': league,
        'transferBudget': transferBudget,
        'wageBudget': wageBudget,
        'color': color,
        'imgPath': imgPath,
      };
}
