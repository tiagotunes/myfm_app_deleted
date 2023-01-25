import 'package:flutter/material.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:myfm_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:myfm_app/screens/profile/components/profile_menu.dart';
import 'package:myfm_app/screens/profile/components/profile_picture.dart';
import 'package:myfm_app/screens/splash/splash_screen.dart';
import 'package:myfm_app/services/database_helper.dart';

class Body extends StatefulWidget {
  const Body({super.key, this.user});
  final User? user;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfilePic(),
        const SizedBox(height: 20),
        ProfileMenu(
          icon: Icons.edit_outlined,
          text: 'Edit profile',
          press: () {
            Navigator.pushNamed(
              context,
              CompleteProfileScreen.routeName,
              arguments: {'user': widget.user},
            );
          },
        ),
        ProfileMenu(
          icon: Icons.download_outlined,
          text: 'Extract database',
          press: () {},
        ),
        ProfileMenu(
          icon: Icons.upload_outlined,
          text: 'Import database',
          press: () {},
        ),
        ProfileMenu(
          icon: Icons.delete_forever_outlined,
          text: 'Delete account',
          press: () {
            DatabaseHelper.deleteAll();
            Navigator.pushNamedAndRemoveUntil(
              context,
              SplashScreen.routeName,
              ModalRoute.withName('/'),
            );
          },
        ),
      ],
    );
  }
}
