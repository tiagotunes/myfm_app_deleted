import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/models/player_model.dart';
import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/size_config.dart';

class PlayerTile extends StatelessWidget {
  final Player player;
  final Team team;
  const PlayerTile({super.key, required this.player, required this.team});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getProportionateScreenWidth(4)),
      decoration: BoxDecoration(
        border: Border.all(
          color: kSecondaryColor.withOpacity(0.5),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            width: getProportionateScreenWidth(45),
            height: getProportionateScreenWidth(45),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                image: AssetImage('assets/images/default_user1.png'),
              ),
            ),
          ),
          SizedBox(width: getProportionateScreenWidth(13)),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              player.name,
                              style: TextStyle(
                                height: 1.0,
                                color: Colors.black,
                                fontSize: getProportionateScreenWidth(20),
                                fontWeight: FontWeight.w600,
                                letterSpacing:
                                    getProportionateScreenWidth(-1.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            player.nationFlag,
                            width: getProportionateScreenWidth(22),
                          ),
                          SizedBox(width: getProportionateScreenWidth(10)),
                          Text(
                            "${team.year - DateTime.parse(player.birthdate).year} years",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(15),
                              letterSpacing: -1,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
