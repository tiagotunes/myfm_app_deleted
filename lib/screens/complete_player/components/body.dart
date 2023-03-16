import 'package:flutter/material.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/models/player_model.dart';
import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:myfm_app/screens/complete_player/components/complete_player_form.dart';
import 'package:myfm_app/size_config.dart';

class Body extends StatelessWidget {
  final User? user;
  final Team? team;
  final Player? player;
  const Body({super.key, this.user, this.team, this.player});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.02),
              Text(
                player != null ? 'Edit Player' : 'Create Player',
                style: headingStyle,
              ),
              Text(
                player != null
                    ? 'Change your player details'
                    : 'Complete your player details',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              CompletePlayerForm(
                user: user,
                team: team,
                player: player,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
