import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:myfm_app/components/country_picker.dart';
import 'package:myfm_app/components/custom_alert_dialog.dart';
import 'package:myfm_app/components/default_button.dart';
import 'package:myfm_app/components/form_error.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:myfm_app/screens/home/home_screen.dart';
import 'package:myfm_app/screens/profile/profile_screen.dart';
import 'package:myfm_app/screens/success_profile/success_profile_screen.dart';
import 'package:myfm_app/services/database_helper.dart';
import 'package:myfm_app/size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  final User? user;
  const CompleteProfileForm({super.key, this.user});

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final nameCtr = TextEditingController();
  final countryCtr = TextEditingController();
  String countryFlagCtr = "";
  final birthdateCtr = TextEditingController();
  final List<String> errors = [];
  // UnfocusDisposition disposition = UnfocusDisposition.scope;

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      nameCtr.text = widget.user!.name;
      countryCtr.text = widget.user!.country;
      countryFlagCtr = widget.user!.countryFlag;
      birthdateCtr.text = widget.user!.birthdate;
    }
  }

  void addError(String error) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError(String error) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildCountryFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildBirthdateFormField(context),
          SizedBox(height: getProportionateScreenHeight(15)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: widget.user != null ? 'Save' : 'Continue',
            press: () {
              if (_formKey.currentState!.validate()) {
                User newUser = User(
                  name: nameCtr.text,
                  country: countryCtr.text,
                  countryFlag: countryFlagCtr,
                  birthdate: birthdateCtr.text,
                  id: widget.user != null ? widget.user!.id : 0,
                );
                if (widget.user != null) {
                  DatabaseHelper.updateUser(newUser);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const CustomAlertDialog(
                        icon: Icons.save,
                        text: 'Profile updated successfully',
                      );
                    },
                  );
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.pop(context);
                    Navigator.pushNamed(
                      context,
                      HomeScreen.routeName,
                      arguments: {'user': newUser},
                    );
                    Navigator.pushNamed(
                      context,
                      ProfileScreen.routeName,
                      arguments: {'user': newUser},
                    );
                  });
                } else {
                  DatabaseHelper.addUser(newUser);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    SuccessProfileScreen.routeName,
                    ModalRoute.withName('/'),
                    arguments: {'user': newUser},
                  );
                }
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildBirthdateFormField(BuildContext context) {
    return TextFormField(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: birthdateCtr.text == ''
              ? DateTime.utc(2000)
              : DateTime.parse(birthdateCtr.text),
          firstDate: DateTime.utc(1900),
          lastDate: DateTime.utc(2100),
          initialDatePickerMode: DatePickerMode.day,
        );
        if (pickedDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          birthdateCtr.text = formattedDate;
        }
      },
      readOnly: true,
      controller: birthdateCtr,
      onChanged: (value) {
        errors.clear();
        if (value.isNotEmpty) {
          removeError(kBirthDateNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(kBirthDateNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Birth date',
        hintText: 'Enter your birth date',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.calendar_today_outlined),
      ),
    );
  }

  TextFormField buildCountryFormField() {
    return TextFormField(
      onTap: () async {
        Country? result = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return MyCountryPicker(countries: countries);
          },
        );
        if (result != null) {
          countryCtr.text = result.name;
          countryFlagCtr = result.flag;
          removeError(kPlayerNationNullError);
          setState(() {});
        }
      },
      readOnly: true,
      controller: countryCtr,
      decoration: InputDecoration(
        labelText: 'Nation',
        hintText: 'Choose player nation',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: countryCtr.text.isEmpty
            ? const Icon(Icons.flag_outlined)
            : SvgPicture.asset(
                countryFlagCtr,
                width: getProportionateScreenHeight(35),
              ),
        suffixIconConstraints:
            BoxConstraints(minWidth: getProportionateScreenWidth(45)),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          addError(kPlayerNationNullError);
          return "";
        }
        return null;
      },
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      onChanged: (value) {
        errors.clear();
        if (value.isNotEmpty) {
          removeError(kNameNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(kNameNullError);
          return "";
        }
        return null;
      },
      controller: nameCtr,
      decoration: const InputDecoration(
        labelText: 'Name',
        hintText: 'Enter your name',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.person_outline_outlined),
      ),
    );
  }
}
