import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/size_config.dart';

class TeamBadge extends StatelessWidget {
  const TeamBadge({
    super.key,
    required this.team,
  });

  final Team team;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: team.imgBadgePath != null
              ? Image.file(File(team.imgBadgePath!))
              : SvgPicture.asset(
                  'assets/icons/shield1.svg',
                  height: double.infinity,
                ),
        ),
        SizedBox(height: getProportionateScreenHeight(8)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              team.countryFlag,
              width: getProportionateScreenWidth(25),
            ),
            SizedBox(width: getProportionateScreenWidth(10)),
            Text(
              team.country,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
