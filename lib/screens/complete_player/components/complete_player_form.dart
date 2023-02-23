import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myfm_app/components/default_button.dart';
import 'package:myfm_app/components/form_error.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:myfm_app/size_config.dart';

class CompletePlayerForm extends StatefulWidget {
  final User? user;
  final Team? team;
  const CompletePlayerForm({super.key, this.user, this.team});

  @override
  State<CompletePlayerForm> createState() => _CompletePlayerFormState();
}

class _CompletePlayerFormState extends State<CompletePlayerForm> {
  final _formKey = GlobalKey<FormState>();
  final nameCtr = TextEditingController();
  final nationCtr = TextEditingController();
  final birthdateCtr = TextEditingController();
  String primaryPosCtr = "";
  List<String>? secondaryPosCtr;
  final leftFCtr = TextEditingController();
  final rightFCtr = TextEditingController();
  final heightCtr = TextEditingController();
  final numberCtr = TextEditingController();
  final valueCtr = TextEditingController();
  final wageCtr = TextEditingController();
  final releaseClauseCtr = TextEditingController();
  final abilityCtr = TextEditingController();
  final potentialCtr = TextEditingController();
  final isNationalTCtr = TextEditingController();
  final isLoanedCtr = TextEditingController();
  final loanFromCtr = TextEditingController();
  final imgPathCtr = TextEditingController();
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
          buildNationFormField(),
          SizedBox(height: getProportionateScreenHeight(25)),
          buildBirthdateFormField(context),
          SizedBox(height: getProportionateScreenHeight(25)),
          buildPrimaryPosFormField(),
          SizedBox(height: getProportionateScreenHeight(15)),
          buildFootballField(),
          SizedBox(height: getProportionateScreenHeight(15)),
          SizedBox(height: getProportionateScreenHeight(15)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: 'Continue',
            press: () {
              if (_formKey.currentState!.validate()) {
                print('Ready to go');
              }
            },
          ),
        ],
      ),
    );
  }

  Container buildFootballField() {
    return Container(
      height: getProportionateScreenHeight(240),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/football_field.png'),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Stack(
        children: [
          buildPositionDot(22, 110, 'GK'),
          buildPositionDot(52, 110, 'CB'),
          buildPositionDot(52, 15, 'LB'),
          buildPositionDot(52, 206, 'RB'),
          buildPositionDot(95, 15, 'LWB'),
          buildPositionDot(95, 206, 'RWB'),
          buildPositionDot(113, 110, 'DM'),
          buildPositionDot(159, 110, 'CM'),
          buildPositionDot(159, 15, 'LM'),
          buildPositionDot(159, 206, 'RM'),
          buildPositionDot(225, 110, 'AMC'),
          buildPositionDot(225, 15, 'AML'),
          buildPositionDot(225, 206, 'AMR'),
          buildPositionDot(277, 110, 'ST'),
        ],
      ),
    );
  }

  Positioned buildPositionDot(double x, double y, String pos) {
    return Positioned(
      top: getProportionateScreenHeight(y),
      left: getProportionateScreenWidth(x),
      child: Container(
        width: getProportionateScreenWidth(17),
        height: getProportionateScreenWidth(17),
        decoration: BoxDecoration(
          color: primaryPosCtr == pos ? Colors.green : kSecondaryColor,
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(-1, 0),
              blurRadius: 2,
            )
          ],
        ),
      ),
    );
  }

  DropdownButtonHideUnderline buildPrimaryPosFormField() {
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButtonFormField(
          icon: const Icon(Icons.sports_soccer_outlined),
          hint: const Text("Choose the primary position"),
          menuMaxHeight: getProportionateScreenHeight(400),
          borderRadius: BorderRadius.circular(15),
          items: [
            buildPrimaryPosDropdownMenuItem("GK", true, "Goalkeeper"),
            buildPrimaryPosDropdownMenuItem("0", false, "Defense"),
            buildPrimaryPosDropdownMenuItem("CB", true, "Defender (Center)"),
            buildPrimaryPosDropdownMenuItem("LB", true, "Defender (Left)"),
            buildPrimaryPosDropdownMenuItem("RB", true, "Defender (Right)"),
            buildPrimaryPosDropdownMenuItem("LWB", true, "Wing Back (Left)"),
            buildPrimaryPosDropdownMenuItem("RWB", true, "Wing Back (Right)"),
            buildPrimaryPosDropdownMenuItem("0", false, "Midfield"),
            buildPrimaryPosDropdownMenuItem("DM", true, "Defensive Midfielder"),
            buildPrimaryPosDropdownMenuItem("CM", true, "Midfielder (Center)"),
            buildPrimaryPosDropdownMenuItem("LM", true, "Midfielder (Left)"),
            buildPrimaryPosDropdownMenuItem("RM", true, "Midfielder (Right)"),
            buildPrimaryPosDropdownMenuItem("0", false, "Attack"),
            buildPrimaryPosDropdownMenuItem(
                "AMC", true, "Attacking Midfielder (Center)"),
            buildPrimaryPosDropdownMenuItem(
                "AML", true, "Attacking Midfielder (Left)"),
            buildPrimaryPosDropdownMenuItem(
                "AMR", true, "Attacking Midfielder (Right)"),
            buildPrimaryPosDropdownMenuItem("ST", true, "Striker"),
          ],
          onChanged: (newValue) {
            setState(() {
              primaryPosCtr = newValue!;
              removeError(kPositionNullError);
            });
            // print(primaryPosCtr.text);
          },
          validator: (value) {
            if (value == null) {
              addError(kPositionNullError);
              return "";
            }
            return null;
          },
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildPrimaryPosDropdownMenuItem(
      String value, bool enabled, String text) {
    return DropdownMenuItem(
      value: value,
      enabled: enabled,
      child: Text(
        text,
        style: enabled
            ? const TextStyle()
            : TextStyle(
                fontSize: getProportionateScreenWidth(18),
                fontWeight: FontWeight.w900),
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
        setState(() {
          errors.clear();
          if (value.isNotEmpty) {
            removeError(kPlayerBirthDateNullError);
          }
          if (widget.team!.year - DateTime.parse(value).year >= 15) {
            removeError(kPlayerBirthDateInvalidError);
          }
        });
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(kPlayerBirthDateNullError);
          return "";
        } else if (widget.team!.year - DateTime.parse(value).year < 15) {
          addError(kPlayerBirthDateInvalidError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Birth date',
        hintText: 'Enter your player birth date',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.calendar_today_outlined),
      ),
    );
  }

  Stack buildNationFormField() {
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
              nationCtr.text = c;
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
            controller: nationCtr,
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
              labelText: 'Nation',
              hintText: 'Choose your player nation',
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
        hintText: 'Enter your player name',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.person_outline_sharp),
      ),
    );
  }
}
