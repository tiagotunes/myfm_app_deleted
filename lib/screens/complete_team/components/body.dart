import 'package:flutter/material.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:myfm_app/screens/complete_team/components/complete_team_form.dart';
import 'package:myfm_app/size_config.dart';

class Body extends StatefulWidget {
  final User? user;
  const Body({super.key, this.user});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
              Text('Create Team', style: headingStyle),
              const Text('Complete your team details', textAlign: TextAlign.center),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              CompleteTeamForm(user: widget.user),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
