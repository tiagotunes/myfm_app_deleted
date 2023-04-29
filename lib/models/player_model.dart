class Player {
  final int? id;
  final int? teamId;
  final String name, nation, nationFlag, birthdate;
  final String naturalPosition;
  final String? accomplishedPosition, unconvincingPosition, awkwardPosition;
  final int? leftFoot, rightFoot;
  final int? height, number;
  final int? value, wage, releaseClause;
  final double? ability, potential;
  final int? isOnLoan, isLoanedOut;
  final String? loanFrom, loanTo;
  final String? imgPath;

  const Player({
    this.id,
    required this.teamId,
    required this.name,
    required this.nation,
    required this.nationFlag,
    required this.birthdate,
    required this.naturalPosition,
    this.accomplishedPosition,
    this.unconvincingPosition,
    this.awkwardPosition,
    required this.leftFoot,
    required this.rightFoot,
    this.height,
    this.number,
    this.value,
    this.wage,
    this.releaseClause,
    this.ability,
    this.potential,
    this.isOnLoan,
    this.loanFrom,
    this.isLoanedOut,
    this.loanTo,
    this.imgPath,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json['id'],
        teamId: json['teamId'],
        name: json['name'],
        nation: json['nation'],
        nationFlag: json['nationFlag'],
        birthdate: json['birthdate'],
        naturalPosition: json['naturalPosition'],
        accomplishedPosition: json['accomplishedPosition'],
        unconvincingPosition: json['unconvincingPosition'],
        awkwardPosition: json['awkwardPosition'],
        leftFoot: json['leftFoot'],
        rightFoot: json['rightFoot'],
        height: json['height'],
        number: json['number'],
        value: json['value'],
        wage: json['wage'],
        releaseClause: json['releaseClause'],
        ability: json['ability'],
        potential: json['potential'],
        isOnLoan: json['isOnLoan'],
        loanFrom: json['loanFrom'],
        isLoanedOut: json['isLoanedOut'],
        loanTo: json['loanTo'],
        imgPath: json['imgPath'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'teamId': teamId,
        'name': name,
        'nation': nation,
        'nationFlag': nationFlag,
        'birthdate': birthdate,
        'naturalPosition': naturalPosition,
        'accomplishedPosition': accomplishedPosition,
        'unconvincingPosition': unconvincingPosition,
        'awkwardPosition': awkwardPosition,
        'leftFoot': leftFoot,
        'rightFoot': rightFoot,
        'height': height,
        'number': number,
        'value': value,
        'wage': wage,
        'releaseClause': releaseClause,
        'ability': ability,
        'potential': potential,
        'isOnLoan': isOnLoan,
        'loanFrom': loanFrom,
        'isLoanedOut': isLoanedOut,
        'loanTo': loanTo,
        'imgPath': imgPath,
      };
}
