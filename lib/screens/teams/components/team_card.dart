import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/size_config.dart';

class TeamCard extends StatelessWidget {
  final String name;
  final String? imgPath;
  const TeamCard({
    super.key,
    required this.name,
    this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: kSecondaryColor.withOpacity(0.3),
          width: 3,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(5),
          vertical: getProportionateScreenWidth(6),
        ),
        child: Column(
          children: [
            imgPath != null
                ? Image.file(
                    File(imgPath!),
                    height: getProportionateScreenWidth(90),
                  )
                : SvgPicture.asset(
                    'assets/icons/shield1.svg',
                    height: getProportionateScreenWidth(90),
                  ),
            Text(
              name,
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: getProportionateScreenWidth(18),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
