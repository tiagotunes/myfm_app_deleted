import 'package:flutter/material.dart';
import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:myfm_app/screens/complete_team/components/body.dart';

class CompleteTeamScreen extends StatelessWidget {
  static String routeName = '/complete_team';
  const CompleteTeamScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    User? user = arguments['user'];
    Team? team = arguments['team'];
    return Scaffold(
      appBar: AppBar(
        title:
            team != null ? const Text('Edit Team') : const Text('Create Team'),
        centerTitle: true,
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Body(user: user, team: team),
    );
  }
}
