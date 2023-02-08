import 'package:flutter/material.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/size_config.dart';

class ClubBody extends StatelessWidget {
  const ClubBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Club',
        style: TextStyle(
          color: kSecondaryColor,
          fontSize: getProportionateScreenWidth(25),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
