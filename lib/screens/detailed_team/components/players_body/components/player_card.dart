import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myfm_app/constants.dart';
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
    // print(grayscale);

    return Container(
      padding: EdgeInsets.all(getProportionateScreenWidth(4)),
      decoration: BoxDecoration(
        // gradient: LinearGradient(
        //   begin: Alignment.centerRight,
        //   end: Alignment.centerLeft,
        //   stops: const [0.0, 0.15],
        //   colors: [
        //     Color(int.parse(team.color!)),
        //     Colors.white,
        //   ],
        // ),
        border: Border.all(
          color: kSecondaryColor.withOpacity(0.5),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: getProportionateScreenWidth(25),
                backgroundImage:
                    const AssetImage('assets/images/default_user.png'),
              ),
              player.number != null
                  ? Container(
                      width: getProportionateScreenWidth(20),
                      height: getProportionateScreenWidth(20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(int.parse(team.color!)),
                          border: Border.all(
                            color: Color(int.parse(team.color!)),
                            width: 2,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: kSecondaryColor,
                              offset: Offset(1, 2),
                              blurRadius: 3,
                            ),
                          ]),
                      child: Text(
                        player.number!.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: grayscale > 140 ? Colors.black : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenWidth(11),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
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
                // Padding(
                //   padding: EdgeInsets.symmetric(
                //     horizontal: getProportionateScreenWidth(6),
                //   ),
                //   child: Stack(
                //     children: [
                //       Text(
                //         player.number != null ? player.number!.toString() : '',
                //         style: TextStyle(
                //           color: Colors.white,
                //           letterSpacing: -2,
                //           fontSize: getProportionateScreenWidth(18),
                //           fontWeight: FontWeight.bold,
                //         ),
                //       )
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
