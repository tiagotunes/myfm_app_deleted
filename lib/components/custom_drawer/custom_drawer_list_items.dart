import 'package:flutter/material.dart';
import 'package:myfm_app/components/custom_drawer/custom_drawer_item.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/enums.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:myfm_app/screens/home/home_screen.dart';
import 'package:myfm_app/screens/teams/teams_screen.dart';

class CustomDrawerListItems extends StatelessWidget {
  const CustomDrawerListItems({
    Key? key,
    required this.selectMenu,
    required this.user,
  }) : super(key: key);

  final MenuState selectMenu;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          thickness: 2,
          indent: 7,
          endIndent: 7,
          color: kSecondaryColor.withOpacity(0.3),
        ),
        DrawerItem(
          icon: selectMenu == MenuState.home ? Icons.home : Icons.home_outlined,
          isSelected: selectMenu == MenuState.home ? true : false,
          text: 'Home',
          press: () {
            Navigator.pop(context);
            Navigator.pushNamedAndRemoveUntil(
              context,
              HomeScreen.routeName,
              ModalRoute.withName('/'),
              arguments: {'user': user},
            );
          },
        ),
        DrawerItem(
          icon: selectMenu == MenuState.teams
              ? Icons.shield
              : Icons.shield_outlined,
          isSelected: selectMenu == MenuState.teams ? true : false,
          text: 'Teams',
          press: () {
            Navigator.pop(context);
            Navigator.pushNamedAndRemoveUntil(
              context,
              TeamsScreen.routeName,
              ModalRoute.withName('/home'),
              arguments: {'user': user},
            );
          },
        ),
        DrawerItem(
          icon: selectMenu == MenuState.favorite
              ? Icons.favorite
              : Icons.favorite_border,
          isSelected: selectMenu == MenuState.favorite ? true : false,
          text: 'Favourites',
          press: () {},
        ),
        // DrawerItem(
        //   icon: selectMenu == MenuState.profile
        //       ? Icons.person
        //       : Icons.person_outlined,
        //   text: 'Profile',
        //   press: () {
        //     Navigator.pop(context);
        //     Navigator.pushNamedAndRemoveUntil(
        //       context,
        //       ProfileScreen.routeName,
        //       ModalRoute.withName('/home'),
        //       arguments: {'user': user},
        //     );
        //   },
        // ),
        Divider(
          thickness: 2,
          indent: 7,
          endIndent: 7,
          color: kSecondaryColor.withOpacity(0.3),
        ),
        DrawerItem(
          icon: selectMenu == MenuState.settings
              ? Icons.settings
              : Icons.settings_outlined,
          isSelected: selectMenu == MenuState.settings ? true : false,
          text: 'Settings',
          press: () {},
        ),
        DrawerItem(
          icon:
              selectMenu == MenuState.about ? Icons.info : Icons.info_outlined,
          isSelected: selectMenu == MenuState.about ? true : false,
          text: 'About us',
          press: () {},
        ),
      ],
    );
  }
}
