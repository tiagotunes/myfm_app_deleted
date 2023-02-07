import 'package:flutter/material.dart';
import 'package:myfm_app/constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ThemeData().colorScheme.copyWith(primary: kPrimaryColor),
    fontFamily: "Muli",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    dividerTheme: dividerTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

DividerThemeData dividerTheme() {
  return DividerThemeData(
    color: kSecondaryColor.withOpacity(0.5),
    thickness: 1,
    indent: 4,
    endIndent: 4,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(18.0),
    borderSide: const BorderSide(color: kTextColor),
    gapPadding: 10.0,
  );
  return InputDecorationTheme(
    // floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
    errorStyle: const TextStyle(height: 0),
    filled: true,
    fillColor: Colors.white,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyLarge: TextStyle(color: kTextColor),
    bodyMedium: TextStyle(color: kTextColor),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0.0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      color: Color(0xFF8B8B8B),
      fontSize: 18,
    ),
  );
}
