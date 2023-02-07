import 'package:flutter/material.dart';
import 'package:myfm_app/components/custom_drawer/custom_drawer.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/enums.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:myfm_app/screens/profile/components/body.dart';
import 'package:myfm_app/size_config.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    User user = arguments['user'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: TextStyle(
            fontSize: getProportionateScreenWidth(25),
            color: kPrimaryColor.withOpacity(0.7),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      drawer: CustomDrawer(user: user, selectMenu: MenuState.profile),
      body: Body(user: user),
    );
  }
}
