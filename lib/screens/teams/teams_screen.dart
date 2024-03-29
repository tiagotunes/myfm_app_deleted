import 'package:flutter/material.dart';
import 'package:myfm_app/components/custom_drawer/custom_drawer.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/enums.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:myfm_app/screens/complete_team/complete_team_screen.dart';
import 'package:myfm_app/screens/teams/components/body.dart';
import 'package:myfm_app/size_config.dart';

class TeamsScreen extends StatelessWidget {
  static String routeName = '/teams';
  const TeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    User user = arguments['user'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Teams',
          style: TextStyle(
            fontSize: getProportionateScreenWidth(25),
            color: kPrimaryColor.withOpacity(0.7),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                CompleteTeamScreen.routeName,
                arguments: {'user': user},
              );
            },
            icon: const Icon(Icons.add_moderator_outlined),
          ),
          // IconButton(
          //   onPressed: () {
          //     Navigator.pushNamed(context, SearchScreen.routeName);
          //   },
          //   icon: const Icon(Icons.search),
          // ),
        ],
      ),
      drawer: CustomDrawer(user: user, selectMenu: MenuState.teams),
      body: Body(user: user),
    );
  }
}
