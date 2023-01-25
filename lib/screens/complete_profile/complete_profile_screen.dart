import 'package:flutter/material.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:myfm_app/screens/complete_profile/components/body.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeName = '/complete_profile';
  const CompleteProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    User? user = arguments['user'];
    return Scaffold(
      appBar: AppBar(
        title: user!=null ? const Text('Edit Profile') : const Text('Create Profile'),
        centerTitle: true,
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Body(user: user),
    );
  }
}
