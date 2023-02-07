import 'package:flutter/material.dart';
import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/models/user_model.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.user, required this.team});
  final User user;
  final Team team;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
