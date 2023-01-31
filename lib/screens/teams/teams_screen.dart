import 'package:flutter/material.dart';
import 'package:myfm_app/components/custom_drawer/custom_drawer.dart';
import 'package:myfm_app/enums.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:myfm_app/screens/search/search_screen.dart';
import 'package:myfm_app/screens/teams/components/body.dart';

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
        title: const Text('Teams'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
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
      body: const Body(),
    );
  }
}
