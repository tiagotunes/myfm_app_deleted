import 'package:flutter/material.dart';
import 'package:myfm_app/components/custom_drawer/custom_drawer.dart';
import 'package:myfm_app/enums.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:myfm_app/screens/profile/components/body.dart';

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
        title: const Text('Profile'),
        centerTitle: true,
      ),
      drawer: CustomDrawer(user: user, selectMenu: MenuState.profile),
      body: const Body(),
    );
  }
}
