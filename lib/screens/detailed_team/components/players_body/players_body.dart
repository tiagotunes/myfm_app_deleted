import 'package:flutter/material.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/size_config.dart';

class PlayersBody extends StatelessWidget {
  const PlayersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Players',
        style: TextStyle(
          color: kSecondaryColor,
          fontSize: getProportionateScreenWidth(25),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}