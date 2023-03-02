import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myfm_app/components/country_picker.dart';
import 'package:myfm_app/components/default_button.dart';
import 'package:myfm_app/components/form_error.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:myfm_app/screens/detailed_team/detailed_team_screen.dart';
import 'package:myfm_app/screens/home/home_screen.dart';
import 'package:myfm_app/screens/teams/teams_screen.dart';
import 'package:myfm_app/services/database_helper.dart';
import 'package:myfm_app/size_config.dart';

class CompleteTeamForm extends StatefulWidget {
  final User? user;
  final Team? team;
  const CompleteTeamForm({super.key, this.user, this.team});

  @override
  State<CompleteTeamForm> createState() => _CompleteTeamFormState();
}

class _CompleteTeamFormState extends State<CompleteTeamForm> {
  final _formKey = GlobalKey<FormState>();
  final nameCtr = TextEditingController();
  final countryCtr = TextEditingController();
  String countryFlagCtr = "";
  final yearCtr = TextEditingController();
  final leagueCtr = TextEditingController();
  final stadiumCtr = TextEditingController();
  final transferBCtr = TextEditingController();
  final wageBCtr = TextEditingController();
  final colorCtr = TextEditingController();
  final imgBadgePathCtr = TextEditingController();
  final imgStadiumPathCtr = TextEditingController();
  bool stadiumEnable = false;
  final List<String> errors = [];

  @override
  void initState() {
    super.initState();
    if (widget.team != null) {
      nameCtr.text = widget.team!.name;
      countryCtr.text = widget.team!.country;
      countryFlagCtr = widget.team!.countryFlag;
      yearCtr.text = widget.team!.year.toString();
      if (widget.team!.league != null) {
        leagueCtr.text = widget.team!.league!;
      }
      if (widget.team!.stadium != null) {
        stadiumCtr.text = widget.team!.stadium!;
        stadiumEnable = true;
      }
      transferBCtr.text = widget.team!.transferBudget.toString();
      wageBCtr.text = widget.team!.wageBudget.toString();
      colorCtr.text = widget.team!.color!;
      if (widget.team!.imgBadgePath != null) {
        imgBadgePathCtr.text = widget.team!.imgBadgePath!;
      }
      if (widget.team!.imgStadiumPath != null) {
        imgStadiumPathCtr.text = widget.team!.imgStadiumPath!;
      }
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
          SizedBox(height: getProportionateScreenHeight(25)),
          buildCountryFormField(),
          SizedBox(height: getProportionateScreenHeight(25)),
          buildYearFormField(),
          SizedBox(height: getProportionateScreenHeight(25)),
          buildLeagueFormField(),
          SizedBox(height: getProportionateScreenHeight(25)),
          buildStadiumFormField(),
          SizedBox(height: getProportionateScreenHeight(25)),
          buildTransferBFormField(),
          SizedBox(height: getProportionateScreenHeight(25)),
          buildWageBFormField(),
          SizedBox(height: getProportionateScreenHeight(25)),
          buildColorFormField(context),
          SizedBox(height: getProportionateScreenHeight(25)),
          buildBadgeImgFormField(),
          SizedBox(height: getProportionateScreenHeight(25)),
          buildStadiumImgFormField(),
          SizedBox(height: getProportionateScreenHeight(15)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: widget.team != null ? 'Save' : 'Continue',
            press: () {
              if (_formKey.currentState!.validate()) {
                Team newTeam = Team(
                  name: nameCtr.text,
                  country: countryCtr.text,
                  countryFlag: countryFlagCtr,
                  year: int.parse(yearCtr.text),
                  league: leagueCtr.text.isEmpty ? null : leagueCtr.text,
                  stadium: stadiumCtr.text.isEmpty ? null : stadiumCtr.text,
                  transferBudget: transferBCtr.text.isEmpty
                      ? 0
                      : int.parse(transferBCtr.text),
                  wageBudget:
                      wageBCtr.text.isEmpty ? 0 : int.parse(wageBCtr.text),
                  color: colorCtr.text.isEmpty ? '0xFFFFFFFF' : colorCtr.text,
                  imgBadgePath: imgBadgePathCtr.text.isEmpty
                      ? null
                      : imgBadgePathCtr.text,
                  imgStadiumPath:
                      imgStadiumPathCtr.text.isEmpty || !stadiumEnable
                          ? null
                          : imgStadiumPathCtr.text,
                  id: widget.team != null ? widget.team!.id : null,
                );
                if (widget.team != null) {
                  DatabaseHelper.updateTeam(newTeam);
                  showSaveSuccessModal(context);
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      TeamsScreen.routeName,
                      ModalRoute.withName(HomeScreen.routeName),
                      arguments: {'user': widget.user},
                    );
                    Navigator.pushNamed(
                      context,
                      DetailedTeamScreen.routeName,
                      arguments: {
                        'user': widget.user,
                        'team': newTeam,
                      },
                    );
                  });
                } else {
                  DatabaseHelper.addTeam(newTeam);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    TeamsScreen.routeName,
                    ModalRoute.withName(HomeScreen.routeName),
                    arguments: {'user': widget.user},
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }

  Future<dynamic> showSaveSuccessModal(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: getProportionateScreenHeight(110),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Icon(
                Icons.save,
                size: getProportionateScreenWidth(25),
              ),
              const Spacer(),
              Text(
                'Your team was updated successfully',
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: getProportionateScreenWidth(16),
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(flex: 2),
            ],
          ),
        );
      },
    );
  }

  TextFormField buildStadiumImgFormField() {
    return TextFormField(
      onTap: () async {
        XFile? imgFile =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        setState(() {
          imgStadiumPathCtr.text = imgFile!.path;
        });
      },
      readOnly: true,
      controller: imgStadiumPathCtr,
      enabled: stadiumEnable,
      decoration: InputDecoration(
        labelText: 'Stadium',
        hintText: 'Choose your team stadium',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const Icon(Icons.image_outlined),
        prefixIcon: IconButton(
          onPressed: () {
            setState(() {
              imgStadiumPathCtr.clear();
            });
          },
          icon: const Icon(Icons.clear_outlined),
        ),
      ),
    );
  }

  TextFormField buildColorFormField(BuildContext context) {
    return TextFormField(
      onTap: () {
        ColorPicker(
          customColorSwatchesAndNames: kCustomSwatches,
          pickersEnabled: const <ColorPickerType, bool>{
            ColorPickerType.accent: false,
            ColorPickerType.primary: false,
            ColorPickerType.custom: true,
          },
          enableShadesSelection: false,
          borderRadius: 8,
          borderColor: kSecondaryColor,
          elevation: 3,
          color: colorCtr.text.isEmpty
              ? Colors.white
              : Color(int.parse(colorCtr.text)),
          onColorChanged: (Color color) {
            setState(() {
              colorCtr.text = color.value.toString();
            });
          },
          actionButtons: const ColorPickerActionButtons(
            dialogActionButtons: false,
            closeButton: true,
          ),
        ).showPickerDialog(context);
      },
      readOnly: true,
      controller: colorCtr,
      style: TextStyle(
        color: colorCtr.text.isEmpty ||
                Color(int.parse(colorCtr.text)) == Colors.white
            ? kSecondaryColor
            : Color(int.parse(colorCtr.text)),
        fontWeight: colorCtr.text.isEmpty ? FontWeight.normal : FontWeight.bold,
      ),
      decoration: InputDecoration(
        labelText: 'Color',
        hintText: 'Choose your team color',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.format_color_fill_outlined,
          color: colorCtr.text.isEmpty ||
                  Color(int.parse(colorCtr.text)) == Colors.white
              ? kSecondaryColor
              : Color(int.parse(colorCtr.text)),
        ),
      ),
    );
  }

  TextFormField buildBadgeImgFormField() {
    return TextFormField(
      onTap: () async {
        XFile? imgFile =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        setState(() {
          imgBadgePathCtr.text = imgFile!.path;
        });
      },
      readOnly: true,
      controller: imgBadgePathCtr,
      decoration: InputDecoration(
        labelText: 'Badge',
        hintText: 'Choose your team badge',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const Icon(Icons.image_outlined),
        prefixIcon: IconButton(
          onPressed: () {
            setState(() {
              imgBadgePathCtr.clear();
            });
          },
          icon: const Icon(Icons.clear_outlined),
        ),
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

  TextFormField buildStadiumFormField() {
    return TextFormField(
      controller: stadiumCtr,
      decoration: const InputDecoration(
        labelText: 'Stadium',
        hintText: 'Enter the stadium of your team',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.stadium_outlined),
      ),
      onChanged: (value) {
        if (value.isEmpty) {
          setState(() {
            stadiumEnable = false;
          });
        } else {
          setState(() {
            stadiumEnable = true;
          });
        }
      },
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
        if (int.parse(yearCtr.text) -
                DateTime.parse(widget.user!.birthdate).year >=
            18) {
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
        if (int.parse(yearCtr.text) -
                DateTime.parse(widget.user!.birthdate).year <
            18) {
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
        hintText: 'Enter your team name',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.shield_outlined),
      ),
    );
  }
}
