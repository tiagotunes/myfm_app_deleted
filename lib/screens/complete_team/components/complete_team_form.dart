import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:myfm_app/components/default_button.dart';
import 'package:myfm_app/components/form_error.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:myfm_app/screens/home/home_screen.dart';
import 'package:myfm_app/screens/teams/teams_screen.dart';
import 'package:myfm_app/services/database_helper.dart';
import 'package:myfm_app/size_config.dart';

class CompleteTeamForm extends StatefulWidget {
  final User? user;
  const CompleteTeamForm({super.key, this.user});

  @override
  State<CompleteTeamForm> createState() => _CompleteTeamFormState();
}

class _CompleteTeamFormState extends State<CompleteTeamForm> {
  final _formKey = GlobalKey<FormState>();
  final nameCtr = TextEditingController();
  final countryCtr = TextEditingController();
  final yearCtr = TextEditingController();
  final leagueCtr = TextEditingController();
  final transferBCtr = TextEditingController();
  final wageBCtr = TextEditingController();
  final colorCtr = TextEditingController();
  final List<String> errors = [];

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
          SizedBox(height: getProportionateScreenHeight(25)),
          buildCountryFormField(),
          SizedBox(height: getProportionateScreenHeight(25)),
          buildYearFormField(),
          SizedBox(height: getProportionateScreenHeight(25)),
          buildLeagueFormField(),
          SizedBox(height: getProportionateScreenHeight(25)),
          buildTransferBFormField(),
          SizedBox(height: getProportionateScreenHeight(25)),
          buildWageBFormField(),
          SizedBox(height: getProportionateScreenHeight(15)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: 'Continue',
            press: () {
              if (_formKey.currentState!.validate()) {
                Team newTeam = Team(
                  name: nameCtr.text,
                  country: countryCtr.text,
                  year: int.parse(yearCtr.text),
                  league: leagueCtr.text.isEmpty ? null : leagueCtr.text,
                  transferBudget: transferBCtr.text.isEmpty ? null : int.parse(transferBCtr.text),
                  wageBudget: wageBCtr.text.isEmpty ? null : int.parse(wageBCtr.text),
                );
                DatabaseHelper.addTeam(newTeam);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  TeamsScreen.routeName,
                  ModalRoute.withName(HomeScreen.routeName),
                  arguments: {'user': widget.user},
                );
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildWageBFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: wageBCtr,
      decoration: const InputDecoration(
        labelText: 'Wage budget',
        hintText: 'Enter your team wage budget',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.money_outlined),
      ),
    );
  }

  TextFormField buildTransferBFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: transferBCtr,
      decoration: const InputDecoration(
        labelText: 'Transfer budget',
        hintText: 'Enter your team transfer budget',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.attach_money_outlined),
      ),
    );
  }

  TextFormField buildLeagueFormField() {
    return TextFormField(
      controller: leagueCtr,
      decoration: const InputDecoration(
        labelText: 'League',
        hintText: 'Enter the league of your team',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.emoji_events_outlined),
      ),
    );
  }

  TextFormField buildYearFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onChanged: (value) {
        errors.clear();
        if (value.isNotEmpty) {
          removeError(kYearNullError);
        }
        if (int.parse(value) >= 1900 && int.parse(value) <= 2100) {
          removeError(kYearInvalidError);
        }
        if (int.parse(yearCtr.text) - DateTime.parse(widget.user!.birthdate).year >= 18) {
          removeError(kYearInvalid2Error);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(kYearNullError);
          return "";
        }
        if (int.parse(value) < 1900 || int.parse(value) > 2100) {
          addError(kYearInvalidError);
          return "";
        }
        if (int.parse(yearCtr.text) - DateTime.parse(widget.user!.birthdate).year < 18) {
          addError(kYearInvalid2Error);
          return "";
        }
        return null;
      },
      controller: yearCtr,
      decoration: const InputDecoration(
        labelText: 'Year',
        hintText: 'Enter the year of the season',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.calendar_month_outlined),
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
              hintText: 'Choose your team country',
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
        hintText: 'Enter your team name',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.shield_outlined),
      ),
    );
  }
}
