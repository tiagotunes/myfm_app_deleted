import 'package:flutter/material.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/size_config.dart';

class Position {
  final int id;
  final String pos, position;

  Position({
    required this.id,
    required this.pos,
    required this.position,
  });

  @override
  bool operator ==(dynamic other) =>
      other != null && other is Position && position == other.position;

  @override
  int get hashCode => super.hashCode;
}

final List<Position> positions = [
  Position(id: 1, pos: 'GK', position: 'Goalkeeper'),
  Position(id: 0, pos: '', position: 'Defense'),
  Position(id: 2, pos: 'CB', position: 'Defense (Center)'),
  Position(id: 3, pos: 'LB', position: 'Defense (Left)'),
  Position(id: 4, pos: 'RB', position: 'Defense (Right)'),
  Position(id: 5, pos: 'LWB', position: 'Wing Back (Left)'),
  Position(id: 6, pos: 'RWB', position: 'Wing Back (Right)'),
  Position(id: 0, pos: '', position: 'Midfield'),
  Position(id: 7, pos: 'DM', position: 'Defensive Midfielder'),
  Position(id: 8, pos: 'CM', position: 'Midfielder (Center)'),
  Position(id: 9, pos: 'LM', position: 'Midfielder (Left)'),
  Position(id: 10, pos: 'RM', position: 'Midfielder (Right)'),
  Position(id: 0, pos: '', position: 'Attack'),
  Position(id: 11, pos: 'AMC', position: 'Attacking Midfielder (Center)'),
  Position(id: 12, pos: 'AML', position: 'Attacking Midfielder (Left)'),
  Position(id: 13, pos: 'AMR', position: 'Attacking Midfielder (Right)'),
  Position(id: 14, pos: 'ST', position: 'Striker'),
];

class MyPositionPicker extends StatelessWidget {
  const MyPositionPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromRGBO(247, 247, 247, 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Text(
        'Select a position',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: getProportionateScreenWidth(20),
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: positions.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(
                positions[index].position,
                textAlign: TextAlign.center,
                style: positions[index].id == 0
                    ? TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenWidth(20),
                        shadows: const [
                          BoxShadow(
                            color: kSecondaryColor,
                            offset: Offset(0, 1),
                            blurRadius: 2,
                          ),
                        ],
                      )
                    : const TextStyle(),
              ),
              onTap: () {
                if (positions[index].id != 0) {
                  Navigator.pop(context, positions[index]);
                }
              },
            );
          },
        ),
      ),
    );
  }
}
