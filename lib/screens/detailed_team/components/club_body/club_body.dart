import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/size_config.dart';

class ClubBody extends StatelessWidget {
  final Team team;
  const ClubBody({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        team.imgBadgePath != null
            ? Image.file(
                File(team.imgBadgePath!),
                width: getProportionateScreenWidth(150),
                height: getProportionateScreenWidth(150),
              )
            : SvgPicture.asset(
                'assets/icons/shield1.svg',
                width: getProportionateScreenWidth(150),
                height: getProportionateScreenWidth(150),
              ),
        SizedBox(width: getProportionateScreenWidth(20)),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: kSecondaryColor, width: 2),
              boxShadow: [
                BoxShadow(
                  color: kSecondaryColor.withOpacity(0.5),
                  offset: const Offset(-3, 3),
                  blurRadius: 5,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    team.country,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                        color: kSecondaryColor,
                      ),
                      SizedBox(width: getProportionateScreenWidth(8)),
                      Text(
                        team.year.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.emoji_events_outlined,
                        color: kSecondaryColor,
                      ),
                      SizedBox(width: getProportionateScreenWidth(8)),
                      Text(
                        team.league != null ? team.league! : '---',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.stadium_outlined,
                        color: kSecondaryColor,
                      ),
                      SizedBox(width: getProportionateScreenWidth(8)),
                      Text(
                        team.stadium != null ? team.stadium! : '---',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.attach_money_outlined,
                        color: kSecondaryColor,
                      ),
                      SizedBox(width: getProportionateScreenWidth(8)),
                      Text(
                        team.transferBudget.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.money_outlined,
                        color: kSecondaryColor,
                      ),
                      SizedBox(width: getProportionateScreenWidth(8)),
                      Text(
                        team.wageBudget.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
