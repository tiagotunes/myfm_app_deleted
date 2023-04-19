import 'package:flutter/material.dart';
import 'package:myfm_app/models/player_model.dart';
import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/size_config.dart';

class PlayerCard extends StatelessWidget {
  final Player player;
  final Team team;
  const PlayerCard({super.key, required this.player, required this.team});

  @override
  Widget build(BuildContext context) {
    double grayscale = (0.299 * Color(int.parse(team.color!)).red) +
        (0.587 * Color(int.parse(team.color!)).green) +
        (0.114 * Color(int.parse(team.color!)).blue);
    return AlertDialog(
      contentPadding: EdgeInsets.all(getProportionateScreenWidth(15)),
      content: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit_outlined),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete_outline),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: getProportionateScreenWidth(120),
                  height: getProportionateScreenWidth(120),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/default_user1.png'),
                    ),
                  ),
                ),
                Container(
                  width: getProportionateScreenWidth(120),
                  height: getProportionateScreenWidth(100),
                  padding: EdgeInsets.all(getProportionateScreenWidth(5)),
                  decoration: BoxDecoration(
                    color: Color(int.parse(team.color!)),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        // Idea -> check if name length and turn to G. Inácio (f.e.)
                        player.name, 
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      player.number != null
                          ? Text(
                              player.number.toString(),
                              style: TextStyle(
                                color: grayscale > 140 ? Colors.black : Colors.white,
                                letterSpacing: getProportionateScreenWidth(-2),
                                fontSize: getProportionateScreenWidth(30),
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
