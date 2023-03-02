class Player {
  final int? id;
  final int? teamId;
  final String name, nation, nationFlag, birthdate;
  final String primaryPosition;
  final String? secondaryPosition;
  final int? leftFoot, rightFoot;
  final int? height, number;
  final int? value, wage, releaseClause;
  final double? ability, potential;
  final int? isNationalTeam, isLoaned;
  final String? loanFrom;
  final String? imgPath;

  const Player({
    this.id,
    required this.teamId,
    required this.name,
    required this.nation,
    required this.nationFlag,
    required this.birthdate,
    required this.primaryPosition,
    this.secondaryPosition,
    required this.leftFoot,
    required this.rightFoot,
    this.height,
    this.number,
    this.value,
    this.wage,
    this.releaseClause,
    this.ability,
    this.potential,
    this.isNationalTeam,
    this.isLoaned,
    this.loanFrom,
    this.imgPath,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json['id'],
        teamId: json['teamId'],
        name: json['name'],
        nation: json['nation'],
        nationFlag: json['nationFlag'],
        birthdate: json['birthdate'],
        primaryPosition: json['primaryPosition'],
        secondaryPosition: json['secondaryPosition'],
        leftFoot: json['leftFoot'],
        rightFoot: json['rightFoot'],
        height: json['height'],
        number: json['number'],
        value: json['value'],
        wage: json['wage'],
        releaseClause: json['releaseClause'],
        ability: json['ability'],
        potential: json['potential'],
        isNationalTeam: json['isNationalTeam'],
        isLoaned: json['isLoaned'],
        loanFrom: json['loanFrom'],
        imgPath: json['imgPath'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'teamId': teamId,
        'name': name,
        'nation': nation,
        'nationFlag': nationFlag,
        'birthdate': birthdate,
        'primaryPosition': primaryPosition,
        'secondaryPosition': secondaryPosition,
        'leftFoot': leftFoot,
        'rightFoot': rightFoot,
        'height': height,
        'number': number,
        'value': value,
        'wage': wage,
        'releaseClause': releaseClause,
        'ability': ability,
        'potential': potential,
        'isNationalTeam': isNationalTeam,
        'isLoaned': isLoaned,
        'loanFrom': loanFrom,
        'imgPath': imgPath,
      };
}
