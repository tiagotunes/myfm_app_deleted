import 'package:flutter/material.dart';
import 'package:myfm_app/screens/success_profile/components/body.dart';

class SuccessProfileScreen extends StatelessWidget {
  static String routeName = '/success_profile';
  const SuccessProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Body(),
    );
  }
}
