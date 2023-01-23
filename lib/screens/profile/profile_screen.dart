import 'package:flutter/material.dart';
import 'package:myfm_app/components/custom_bottom_nav_bar.dart';
import 'package:myfm_app/enums.dart';
import 'package:myfm_app/screens/profile/components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: const Body(),
      bottomNavigationBar: const CustomBottomNavBar(selectMenu: MenuState.profile),
    );
  }
}
