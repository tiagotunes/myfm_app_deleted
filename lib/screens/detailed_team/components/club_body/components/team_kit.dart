import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/size_config.dart';

class TeamKit extends StatelessWidget {
  final Team team;
  const TeamKit({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: team.imgKitPath != null
              ? Image.file(File(team.imgKitPath!))
              : SvgPicture.asset(
                  'assets/icons/shirt.svg',
                  color: kSecondaryColor,
                  height: double.infinity,
                ),
        ),
        SizedBox(height: getProportionateScreenHeight(8)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/shirt1.svg',
              width: getProportionateScreenWidth(25),
            ),
            SizedBox(width: getProportionateScreenWidth(10)),
            Text(
              'Kits',
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
