import 'package:flutter/material.dart';
import 'package:myfm_app/components/custom_alert_dialog.dart';
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
          icon: 'assets/icons/user_edit.svg',
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
          icon: 'assets/icons/user_remove.svg',
          text: 'Delete account',
          press: () {
            showConfirmationModal(context);
          },
        ),
        ProfileMenu(
          icon: 'assets/icons/database_export.svg',
          text: 'Extract database',
          press: () {},
        ),
        ProfileMenu(
          icon: 'assets/icons/database_import.svg',
          text: 'Import database',
          press: () {},
        ),
      ],
    );
  }

  Future<dynamic> showConfirmationModal(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          icon: Icons.delete_forever,
          text: 'Are you sure you want to delete your profile?',
          btnText: 'Delete',
          press: () {
            DatabaseHelper.deleteAll();
            Navigator.pushNamedAndRemoveUntil(
              context,
              SplashScreen.routeName,
              ModalRoute.withName('/'),
            );
          },
        );
      },
    );
  }
}
