import 'package:flutter/material.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:myfm_app/screens/complete_profile/components/complete_profile_form.dart';
import 'package:myfm_app/size_config.dart';

class Body extends StatelessWidget {
  final User? user;
  const Body({super.key, this.user});

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
              Text(
                user != null ? 'Edit Profile' : 'Create Profile',
                style: headingStyle,
              ),
              Text(
                user != null
                    ? 'Edit your manager details'
                    : 'Complete your Manager details',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              CompleteProfileForm(user: user),
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              user != null
                  ? const SizedBox()
                  : const Text(
                      'By continuing you confirm that you agree \nwith our Term and Codition',
                      textAlign: TextAlign.center,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
