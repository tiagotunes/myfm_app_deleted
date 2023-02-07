import 'package:flutter/material.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:myfm_app/screens/complete_team/components/complete_team_form.dart';
import 'package:myfm_app/size_config.dart';

class Body extends StatelessWidget {
  final User? user;
  final Team? team;
  const Body({super.key, this.user, this.team});

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
                team != null ? 'Edit Team' : 'Create Team',
                style: headingStyle,
              ),
              Text(
                team != null
                    ? 'Edit your team details'
                    : 'Complete your team details',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              CompleteTeamForm(user: user),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
