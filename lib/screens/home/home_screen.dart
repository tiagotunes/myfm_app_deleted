import 'package:flutter/material.dart';
import 'package:myfm_app/components/custom_bottom_nav_bar.dart';
import 'package:myfm_app/enums.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:myfm_app/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final User user = args['user'];
    return const Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectMenu: MenuState.home),
    );
  }
}
