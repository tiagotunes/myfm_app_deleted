import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/models/player_model.dart';
import 'package:myfm_app/size_config.dart';

class PlayerCard extends StatelessWidget {
  final Player player;
  final int teamYear;
  const PlayerCard({super.key, required this.player, required this.teamYear});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getProportionateScreenWidth(4)),
      decoration: BoxDecoration(
          border: Border.all(
            color: kSecondaryColor.withOpacity(0.5),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          CircleAvatar(
            radius: getProportionateScreenWidth(25),
            backgroundImage: const AssetImage('assets/images/default_user.png'),
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
                            "${teamYear - DateTime.parse(player.birthdate).year} years",
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
                //   child: Container(
                //     width: getProportionateScreenWidth(45),
                //     padding: EdgeInsets.all(getProportionateScreenWidth(6)),
                //     alignment: Alignment.center,
                //     decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       color: Colors.yellow,
                //       border: Border.all(color: Colors.black.withOpacity(0.5), width: 2),
                //     ),
                //     child: Text(
                //       player.number != null ? player.number.toString() : '',
                //       style: TextStyle(
                //         color: Colors.black,
                //         fontSize: getProportionateScreenWidth(22),
                //         fontWeight: FontWeight.w900,
                //         letterSpacing: getProportionateScreenWidth(-2),
                //       ),
                //     ),
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
