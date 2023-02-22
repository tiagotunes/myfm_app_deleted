import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/size_config.dart';

class TeamStadium extends StatelessWidget {
  const TeamStadium({
    super.key,
    required this.team,
  });

  final Team team;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: team.imgStadiumPath != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.file(
                    File(team.imgStadiumPath!),
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                )
              : Opacity(
                opacity: 0.3,
                child: SvgPicture.asset(
                    'assets/icons/stadium.svg',
                    height: double.infinity,
                  ),
              ),
        ),
        SizedBox(height: getProportionateScreenHeight(8)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.stadium),
            SizedBox(width: getProportionateScreenWidth(8)),
            Text(
              team.stadium != null ? team.stadium! : '---',
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
