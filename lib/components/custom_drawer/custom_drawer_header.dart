import 'package:flutter/material.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:myfm_app/screens/profile/profile_screen.dart';
import 'package:myfm_app/size_config.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: getProportionateScreenHeight(60),
        left: getProportionateScreenWidth(25),
        bottom: getProportionateScreenHeight(10),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(
            context,
            ProfileScreen.routeName,
            ModalRoute.withName('/home'),
            arguments: {'user': user},
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: getProportionateScreenWidth(37),
              backgroundImage: const AssetImage('assets/images/default_user.png'),
            ),
            Text(
              user.name,
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: getProportionateScreenHeight(20),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'See profile',
              style: TextStyle(
                color: kPrimaryColor.withOpacity(0.5),
                fontSize: getProportionateScreenHeight(15),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
