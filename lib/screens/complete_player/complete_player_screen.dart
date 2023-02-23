import 'package:flutter/material.dart';
import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:myfm_app/screens/complete_player/components/body.dart';

class CompletePlayerScreen extends StatelessWidget {
  static String routeName = '/complete_player';
  const CompletePlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    User? user = arguments['user'];
    Team? team = arguments['team'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Player'),
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
