class Team {
  final int? id;
  final String name, country, countryFlag;
  final int year;
  final String? league, stadium;
  final int? transferBudget, wageBudget;
  final String? color, imgBadgePath, imgStadiumPath;

  const Team({
    this.id,
    required this.name,
    required this.country,
    required this.countryFlag,
    required this.year,
    this.league,
    this.stadium,
    this.transferBudget,
    this.wageBudget,
    this.color,
    this.imgBadgePath,
    this.imgStadiumPath,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json['id'],
        name: json['name'],
        country: json['country'],
        countryFlag: json['countryFlag'],
        year: json['year'],
        league: json['league'],
        stadium: json['stadium'],
        transferBudget: json['transferBudget'],
        wageBudget: json['wageBudget'],
        color: json['color'],
        imgBadgePath: json['imgBadgePath'],
        imgStadiumPath: json['imgStadiumPath'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'country': country,
        'countryFlag': countryFlag,
        'year': year,
        'league': league,
        'stadium': stadium,
        'transferBudget': transferBudget,
        'wageBudget': wageBudget,
        'color': color,
        'imgBadgePath': imgBadgePath,
        'imgStadiumPath': imgStadiumPath,
      };
}
