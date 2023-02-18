import 'package:flutter/material.dart';
import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/screens/detailed_team/components/club_body/components/team_badge.dart';
import 'package:myfm_app/screens/detailed_team/components/club_body/components/team_stadium.dart';
import 'package:myfm_app/size_config.dart';

class ClubBody extends StatelessWidget {
  final Team team;
  const ClubBody({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
          child: SizedBox(
            height: getProportionateScreenHeight(220),
            child: PageView(
              children: [
                TeamBadge(team: team),
                TeamStadium(team: team),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
