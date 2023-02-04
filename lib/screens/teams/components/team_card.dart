import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/size_config.dart';

class TeamCard extends StatelessWidget {
  final String name, color;
  final String? imgPath;
  const TeamCard({
    super.key,
    required this.name,
    required this.color,
    this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.white,
        color: Color(int.parse(color)).withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Color(int.parse(color)) == Colors.white
              ? kSecondaryColor.withOpacity(0.3)
              : Color(int.parse(color)),
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
