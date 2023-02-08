import 'package:flutter/material.dart';
import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:myfm_app/screens/complete_team/complete_team_screen.dart';
import 'package:myfm_app/screens/home/home_screen.dart';
import 'package:myfm_app/screens/teams/teams_screen.dart';
import 'package:myfm_app/services/database_helper.dart';
import 'package:myfm_app/size_config.dart';

class CustomTeamPopupMenu extends StatelessWidget {
  final User user;
  final Team team;
  const CustomTeamPopupMenu({
    super.key,
    required this.team,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      // offset: Offset(0, getProportionateScreenHeight(45)),
      itemBuilder: (context) {
        return [
          buildPopupMenuItem(0, Icons.note_add_outlined, 'Add note', true),
          buildPopupMenuItem(1, Icons.person_add_alt_1, 'Add staff', true),
          buildPopupMenuItem(2, Icons.person_add_alt_1, 'Add player', true),
          buildPopupMenuItem(3, Icons.swap_horiz_outlined, 'Add transfer', true),
          const PopupMenuDivider(),
          buildPopupMenuItem(4, Icons.edit_outlined, 'Edit team', true),
          buildPopupMenuItem(5, Icons.share_outlined, 'Share team', false),
          buildPopupMenuItem(6, Icons.delete_outline, 'Delete team', true),
        ];
      },
      onSelected: (value) {
        if (value == 0) {
          print('Add note');
        } else if (value == 1) {
          print('Add staff');
        } else if (value == 2) {
          print('Add player');
        } else if (value == 3) {
          print('Add transfer');
        } else if (value == 4) {
          // print('Edit team');
          Navigator.pushNamed(
            context,
            CompleteTeamScreen.routeName,
            arguments: {
              'user': user,
              'team': team,
            },
          );
        } else if (value == 5) {
          print('Share team');
        } else if (value == 6) {
          // print('Delete team');
          DatabaseHelper.deleteTeam(team);
          Navigator.pushNamed(
            context,
            HomeScreen.routeName,
            arguments: {'user': user},
          );
          Navigator.pushNamed(
            context,
            TeamsScreen.routeName,
            arguments: {'user': user},
          );
        }
      },
    );
  }

  PopupMenuItem<int> buildPopupMenuItem(int value, IconData icon, String text, bool enable) {
    return PopupMenuItem<int>(
      value: value,
      enabled: enable,
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: getProportionateScreenWidth(10)),
          Text(text),
        ],
      ),
    );
  }
}
