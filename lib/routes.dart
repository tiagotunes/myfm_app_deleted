import 'package:flutter/widgets.dart';
import 'package:myfm_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:myfm_app/screens/splash/splash_screen.dart';
import 'package:myfm_app/screens/success_profile/success_profile_screen.dart';

final Map<String, WidgetBuilder> routes =  {
  SplashScreen.routeName:(context) => const SplashScreen(),
  CompleteProfileScreen.routeName:(context) => const CompleteProfileScreen(),
  SuccessProfileScreen.routeName:(context) => const SuccessProfileScreen(),
};
