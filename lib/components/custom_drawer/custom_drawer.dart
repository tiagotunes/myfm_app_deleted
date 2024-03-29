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
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDrawerHeader(user: user),
            CustomDrawerListItems(selectMenu: selectMenu, user: user),
          ],
        ),
      ),
    );
  }
}