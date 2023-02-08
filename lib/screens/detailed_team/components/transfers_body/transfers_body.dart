import 'package:flutter/material.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/size_config.dart';

class TransfersBody extends StatelessWidget {
  const TransfersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Transfers',
        style: TextStyle(
          color: kSecondaryColor,
          fontSize: getProportionateScreenWidth(25),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}