import 'package:flutter/material.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:myfm_app/screens/profile/profile_screen.dart';
import 'package:myfm_app/size_config.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({
    Key? key,
    required this.country,
    required this.user,
  }) : super(key: key);

  final String country;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: getProportionateScreenHeight(40),
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
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin:
                      EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
                  height: getProportionateScreenHeight(110),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: kSecondaryColor,
                      width: 2,
                    ),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/default_user.png'),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Text(
                    country,
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(25),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              user.name,
              style: TextStyle(
                color: kPrimaryColor.withOpacity(0.5),
                fontSize: getProportionateScreenHeight(20),
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: kPrimaryColor.withOpacity(0.1),
                    offset: const Offset(2, 3),
                    blurRadius: 7,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
