import 'package:flutter/material.dart';
import 'package:myfm_app/components/custom_drawer/custom_drawer_header.dart';
import 'package:myfm_app/components/custom_drawer/custom_drawer_list_items.dart';
import 'package:myfm_app/enums.dart';
import 'package:myfm_app/models/user_model.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
    required this.user,
    required this.selectMenu,
  }) : super(key: key);

  final User user;
  final MenuState selectMenu;

  @override
  Widget build(BuildContext context) {
    String country = user.country.split(' ')[0];
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomDrawerHeader(country: country, user: user),
            CustomDrawerListItems(selectMenu: selectMenu, user: user),
          ],
        ),
      ),
    );
  }
}