import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  final birthdateCtr = TextEditingController();
  final List<String> errors = [];
  // UnfocusDisposition disposition = UnfocusDisposition.scope;

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      nameCtr.text = widget.user!.name;
      countryCtr.text = widget.user!.country;
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
          TextFormField(
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
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
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
          ),
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
                  birthdate: birthdateCtr.text,
                  id: widget.user != null ? widget.user!.id : 0,
                );
                if (widget.user != null) {
                  DatabaseHelper.updateUser(newUser);
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: getProportionateScreenHeight(100),
                        child: Center(
                          child: Text('ok'),
                        ),
                      );
                    },
                  );
                  Future.delayed(const Duration(seconds: 3), () {
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

  Stack buildCountryFormField() {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            getProportionateScreenWidth(10),
            getProportionateScreenWidth(10),
            getProportionateScreenWidth(10),
            0.0,
          ),
          child: CSCPicker(
            showStates: false,
            showCities: false,
            onCountryChanged: (c) {
              countryCtr.text = c;
              removeError(kCountryNullError);
            },
            onStateChanged: (state) {},
            onCityChanged: (city) {},
            countrySearchPlaceholder: "Search",
            countryDropdownLabel: "Country",
            dropdownDecoration: const BoxDecoration(color: Colors.black),
            dropdownHeadingStyle: TextStyle(
                fontSize: getProportionateScreenHeight(20),
                fontWeight: FontWeight.bold,
                color: Colors.black),
            searchBarRadius: 20,
          ),
        ),
        IgnorePointer(
          ignoring: true,
          child: TextFormField(
            readOnly: true,
            controller: countryCtr,
            // onChanged: (value) {
            //   errors.clear();
            //   if (value.isNotEmpty) {
            //     removeError(kCountryNullError);
            //   }
            // },
            validator: (value) {
              if (value!.isEmpty) {
                addError(kCountryNullError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Country',
              hintText: 'Choose your country',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Icon(Icons.flag_outlined),
            ),
          ),
        ),
      ],
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
