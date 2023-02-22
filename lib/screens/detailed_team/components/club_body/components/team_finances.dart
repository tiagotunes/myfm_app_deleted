import 'package:flutter/material.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/size_config.dart';

class TeamFinances extends StatelessWidget {
  final Team team;
  const TeamFinances({
    super.key,
    required this.team,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Finances',
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: getProportionateScreenWidth(18),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(5)),
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
          )
        ],
      ),
    );
  }
}
