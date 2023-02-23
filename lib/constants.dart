import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:myfm_app/size_config.dart';

const kPrimaryColor = Color(0xFF000000);
const kFmColor = Color(0xFF611EA2);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF7175EA), Color(0xFF611EA2)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

final Map<ColorSwatch<Object>, String> kCustomSwatches =
    <ColorSwatch<Object>, String>{
  ColorTools.createPrimarySwatch(Colors.white): 'White',
  ColorTools.createPrimarySwatch(Colors.yellow): 'Yellow',
  ColorTools.createPrimarySwatch(Colors.amber): 'Amber',
  ColorTools.createPrimarySwatch(Colors.orange): 'Orange',
  ColorTools.createPrimarySwatch(Colors.deepOrange): 'Deep Orange',
  ColorTools.createPrimarySwatch(Colors.red): 'Red',
  ColorTools.createPrimarySwatch(Colors.pink): 'Pink',
  ColorTools.createPrimarySwatch(Colors.purple): 'Purple',
  ColorTools.createPrimarySwatch(Colors.deepPurple): 'Deep Purple',
  ColorTools.createPrimarySwatch(Colors.indigo): 'Indigo',
  ColorTools.createPrimarySwatch(Colors.lightBlue): 'Light Blue',
  ColorTools.createPrimarySwatch(Colors.blue): 'Blue',
  ColorTools.createPrimarySwatch(Colors.cyan): 'Cyan',
  ColorTools.createPrimarySwatch(Colors.lime): 'Lime',
  ColorTools.createPrimarySwatch(Colors.lightGreen): 'Light Green',
  ColorTools.createPrimarySwatch(Colors.green): 'Green',
  ColorTools.createPrimarySwatch(Colors.teal): 'Teal',
  ColorTools.createPrimarySwatch(Colors.grey): 'Grey',
  ColorTools.createPrimarySwatch(Colors.blueGrey): 'Blue Grey',
  ColorTools.createPrimarySwatch(Colors.brown): 'Brown',
  ColorTools.createPrimarySwatch(Colors.black): 'Black',
};

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  color: Colors.black,
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
);

// final RegExp emailValidatorRegExp =
//     RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
// const String kEmailNullError = "Please enter your email";
// const String kInvalidEmailError = "Please enter a valid email";
// const String kPassNullError = "Please enter your password";
// const String kShortPassError = "Password is too short";
// const String kMatchPassError = "Passwords doesn't match";
// const String kSignInError = "Invalid credentials";
// const String kSignUpError = "Email already used";
const String kNameNullError = "Please enter your name";
const String kCountryNullError = "Please choose a nation";
const String kBirthDateNullError = "Please enter your birthdate";
const String kYearNullError = "Please enter the year of the season";
const String kYearInvalidError = "Year need to be between 1900 and 2100";
const String kYearInvalid2Error = "You are to young to manage a team";
const String kPositionNullError = "Please enter player position";
const String kPlayerBirthDateNullError = "Please enter player birthdate";
const String kPlayerBirthDateInvalidError = "Player is to young to be on the team";
