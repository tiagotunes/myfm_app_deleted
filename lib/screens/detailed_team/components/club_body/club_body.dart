import 'package:flutter/material.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/screens/detailed_team/components/club_body/components/team_badge.dart';
import 'package:myfm_app/screens/detailed_team/components/club_body/components/team_finances.dart';
import 'package:myfm_app/screens/detailed_team/components/club_body/components/team_information.dart';
import 'package:myfm_app/screens/detailed_team/components/club_body/components/team_kit.dart';
import 'package:myfm_app/screens/detailed_team/components/club_body/components/team_stadium.dart';
import 'package:myfm_app/size_config.dart';

class ClubBody extends StatefulWidget {
  final Team team;
  const ClubBody({super.key, required this.team});

  @override
  State<ClubBody> createState() => _ClubBodyState();
}

class _ClubBodyState extends State<ClubBody> {
  int currentPage = 0;
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
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                children: [
                  TeamBadge(team: widget.team),
                  TeamStadium(team: widget.team),
                  TeamKit(team: widget.team),
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(17)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => buildDot(index),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(25)),
            TeamInformation(team: widget.team),
            SizedBox(height: getProportionateScreenHeight(27)),
            TeamFinances(team: widget.team),
            SizedBox(height: getProportionateScreenHeight(27)),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5.0),
      height: 4,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor.withOpacity(0.6) : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3.0),
      ),
    );
  }
}
