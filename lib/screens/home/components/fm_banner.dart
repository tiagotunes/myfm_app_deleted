import 'package:flutter/material.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/size_config.dart';

class FmBanner extends StatelessWidget {
  const FmBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15),
      ),
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/images/fm23_background.png"),
          fit: BoxFit.fitWidth,
        ),
        color: kFmColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text.rich(
        TextSpan(
          text: "Buy Football Manager 2023\n",
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(
              text: "SPECIAL OFFER",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}