import 'package:flutter/material.dart';
import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:myfm_app/screens/detailed_team/components/body.dart';
import 'package:myfm_app/screens/detailed_team/components/custom_team_popup_menu.dart';

class DetailedTeamScreen extends StatelessWidget {
  static String routeName = '/detailed_team';
  const DetailedTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    User? user = arguments['user'];
    Team? team = arguments['team'];
    return Scaffold(
      appBar: AppBar(
        title: Text(team!.name),
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          CustomTeamPopupMenu(user: user!, team: team)
        ],
      ),
      body: Body(
        user: user,
        team: team,
      ),
    );
  }
}