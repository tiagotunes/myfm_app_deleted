import 'package:flutter/material.dart';
import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/screens/detailed_team/components/club_body/components/team_badge.dart';
import 'package:myfm_app/screens/detailed_team/components/club_body/components/team_finances.dart';
import 'package:myfm_app/screens/detailed_team/components/club_body/components/team_information.dart';
import 'package:myfm_app/screens/detailed_team/components/club_body/components/team_stadium.dart';
import 'package:myfm_app/size_config.dart';

class ClubBody extends StatelessWidget {
  final Team team;
  const ClubBody({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(220),
              child: PageView(
                children: [
                  TeamBadge(team: team),
                  TeamStadium(team: team),
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(27)),
            TeamInformation(team: team),
            SizedBox(height: getProportionateScreenHeight(27)),
            TeamFinances(team: team),
            SizedBox(height: getProportionateScreenHeight(27)),
          ],
        ),
      ),
    );
  }
}
