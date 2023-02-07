import 'package:flutter/material.dart';
import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:myfm_app/screens/complete_team/complete_team_screen.dart';
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
          buildPopupMenuItem(0, Icons.person_add_alt_1, 'Add player'),
          buildPopupMenuItem(1, Icons.person_add_alt_outlined, 'Add staff'),
          buildPopupMenuItem(2, Icons.swap_horiz_outlined, 'Add transfer'),
          const PopupMenuDivider(),
          buildPopupMenuItem(3, Icons.edit_outlined, 'Edit team'),
          buildPopupMenuItem(4, Icons.share_outlined, 'Share team'),
          buildPopupMenuItem(5, Icons.delete_outline, 'Delete team'),
        ];
      },
      onSelected: (value) {
        if (value == 0) {
          print('Add player');
        } else if (value == 1) {
          print('Add staff');
        } else if (value == 2) {
          print('Add transfer');
        } else if (value == 3) {
          // print('Edit team');
          Navigator.pushNamed(
            context,
            CompleteTeamScreen.routeName,
            arguments: {
              'user': user,
              'team': team,
            },
          );
        } else if (value == 4) {
          print('Share team');
        } else if (value == 5) {
          print('Delete team');
        }
      },
    );
  }

  PopupMenuItem<int> buildPopupMenuItem(int value, IconData icon, String text) {
    return PopupMenuItem<int>(
      value: value,
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
