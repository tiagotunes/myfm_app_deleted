import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myfm_app/routes.dart';
import 'package:myfm_app/screens/profile/profile_screen.dart';
import 'package:myfm_app/screens/splash/splash_screen.dart';
import 'package:myfm_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // Status bar color set to transperent
      statusBarColor: Colors.transparent,
      // Set brightness for icons
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: ProfileScreen.routeName,
      routes: routes,
    );
  }
}