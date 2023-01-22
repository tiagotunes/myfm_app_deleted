import 'package:flutter/material.dart';
import 'package:myfm_app/components/default_button.dart';
import 'package:myfm_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.05),
        Padding(
          padding: EdgeInsets.fromLTRB(
            SizeConfig.screenWidth * 0.17,
            SizeConfig.screenWidth * 0.09,
            SizeConfig.screenWidth * 0.09,
            0.0,
          ),
          child: Image.asset(
            'assets/images/login_success2.png',
            height: SizeConfig.screenHeight * 0.25,
            width: double.infinity,
            alignment: Alignment.center,
          ),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.05),
        Text(
          'Profile created\nsuccessfully',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: 'Continue to home',
            press: () {},
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
