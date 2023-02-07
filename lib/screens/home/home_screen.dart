import 'package:flutter/material.dart';
import 'package:myfm_app/components/custom_drawer/custom_drawer.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/enums.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:myfm_app/screens/home/components/body.dart';
import 'package:myfm_app/screens/search/search_screen.dart';
import 'package:myfm_app/size_config.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    User user = arguments['user'];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My FM',
          style: TextStyle(
            fontSize: getProportionateScreenWidth(25),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchScreen.routeName);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      drawer: CustomDrawer(user: user, selectMenu: MenuState.home),
      body: const Body(),
    );
  }
}
