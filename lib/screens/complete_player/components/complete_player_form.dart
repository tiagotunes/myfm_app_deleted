import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:myfm_app/components/country_picker.dart';
import 'package:myfm_app/components/default_button.dart';
import 'package:myfm_app/components/form_error.dart';
import 'package:myfm_app/components/position_picker.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/models/player_model.dart';
import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:myfm_app/screens/detailed_team/detailed_team_screen.dart';
import 'package:myfm_app/screens/home/home_screen.dart';
import 'package:myfm_app/screens/teams/teams_screen.dart';
import 'package:myfm_app/services/database_helper.dart';
import 'package:myfm_app/size_config.dart';

class CompletePlayerForm extends StatefulWidget {
  final User? user;
  final Team? team;
  final Player? player;
  const CompletePlayerForm({super.key, this.user, this.team, this.player});

  @override
  State<CompletePlayerForm> createState() => _CompletePlayerFormState();
}

class _CompletePlayerFormState extends State<CompletePlayerForm> {
  final _formKey = GlobalKey<FormState>();
  final nameCtr = TextEditingController();
  final nationCtr = TextEditingController();
  String nationFlagCtr = "";
  final birthdateCtr = TextEditingController();
  final primaryPosCtr = TextEditingController();
  String primaryPos = "";
  List<dynamic> secondaryPos = [];
  bool leftFoot = false;
  bool rightFoot = false;
  final heightCtr = TextEditingController();
  final numberCtr = TextEditingController();
  final valueCtr = TextEditingController();
  final wageCtr = TextEditingController();
  final releaseClauseCtr = TextEditingController();
  final abilityCtr = TextEditingController();
  final potentialCtr = TextEditingController();

  // To be done
  final isNationalTCtr = TextEditingController();
  final isLoanedCtr = TextEditingController();
  final loanFromCtr = TextEditingController();
  final imgPathCtr = TextEditingController();

  final List<String> errors = [];

  @override
  void initState() {
    super.initState();
    if (widget.player != null) {
      nameCtr.text = widget.player!.name;
      nationCtr.text = widget.player!.nation;
      nationFlagCtr = widget.player!.nationFlag;
      birthdateCtr.text = widget.player!.birthdate.toString();
      primaryPos = widget.player!.primaryPosition.toString();
      initPositionDropdown(primaryPos);
      secondaryPos = jsonDecode(widget.player!.secondaryPosition!);
      leftFoot = widget.player!.leftFoot == 1 ? true : false;
      rightFoot = widget.player!.rightFoot == 1 ? true : false;
      if (widget.player!.height != null) {
        heightCtr.text = widget.player!.height.toString();
      }
      if (widget.player!.number != null) {
        numberCtr.text = widget.player!.number.toString();
      }
      valueCtr.text = widget.player!.value.toString();
      wageCtr.text = widget.player!.wage.toString();
      if (widget.player!.releaseClause != null) {
        releaseClauseCtr.text = widget.player!.releaseClause.toString();
      }
      if (widget.player!.ability != null) {
        abilityCtr.text = widget.player!.ability.toString();
      }
      if (widget.player!.potential != null) {
        potentialCtr.text = widget.player!.potential.toString();
      }
    }
  }

  void initPositionDropdown(String pos) {
    switch (pos) {
      case 'GK':
        primaryPosCtr.text = "Goalkeeper";
        break;
      case 'CB':
        primaryPosCtr.text = "Defense (Center)";
        break;
      case 'LB':
        primaryPosCtr.text = "Defense (Left)";
        break;
      case 'RB':
        primaryPosCtr.text = "Defense (Right)";
        break;
      case 'LWB':
        primaryPosCtr.text = "Wing Back (Left)";
        break;
      case 'RWB':
        primaryPosCtr.text = "Wing Back (Right)";
        break;
      case 'DM':
        primaryPosCtr.text = "Defensive Midfielder";
        break;
      case 'CM':
        primaryPosCtr.text = "Midfielder (Center)";
        break;
      case 'LM':
        primaryPosCtr.text = "Midfielder (Left)";
        break;
      case 'RM':
        primaryPosCtr.text = "Midfielder (Right)";
        break;
      case 'AMC':
        primaryPosCtr.text = "Attacking Midfielder (Center)";
        break;
      case 'AML':
        primaryPosCtr.text = "Attacking Midfielder (Center)";
        break;
      case 'AMR':
        primaryPosCtr.text = "Attacking Midfielder (Center)";
        break;
      case 'ST':
        primaryPosCtr.text = "Striker";
        break;
      default:
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
          buildNationFormField(),
          SizedBox(height: getProportionateScreenHeight(25)),
          buildBirthdateFormField(context),
          SizedBox(height: getProportionateScreenHeight(25)),
          buildPrimaryPosFormField(),
          SizedBox(height: getProportionateScreenHeight(10)),
          buildFootballField(),
          buildSecondaryPosInfoText(),
          SizedBox(height: getProportionateScreenHeight(25)),
          buildFeetCheckBoxes(),
          SizedBox(height: getProportionateScreenHeight(25)),
          buildHeightFormField(),
          SizedBox(height: getProportionateScreenHeight(25)),
          buildNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(25)),
          buildValueFormField(),
          SizedBox(height: getProportionateScreenHeight(25)),
          buildWageFormField(),
          SizedBox(height: getProportionateScreenHeight(25)),
          buildReleaseClauseFormField(),
          SizedBox(height: getProportionateScreenHeight(25)),
          buildCurrentAbilityFormField(),
          SizedBox(height: getProportionateScreenHeight(25)),
          buildPotentialAbilityFormField(),
          SizedBox(height: getProportionateScreenHeight(25)),
          buildImgPathFormField(),
          SizedBox(height: getProportionateScreenHeight(15)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: widget.player != null ? 'Save' : 'Continue',
            press: () {
              if (_formKey.currentState!.validate()) {
                Player newPlayer = Player(
                  teamId: widget.team?.id,
                  name: nameCtr.text,
                  nation: nationCtr.text,
                  nationFlag: nationFlagCtr,
                  birthdate: birthdateCtr.text,
                  primaryPosition: primaryPos,
                  secondaryPosition: jsonEncode(secondaryPos),
                  leftFoot: leftFoot ? 1 : 0,
                  rightFoot: rightFoot ? 1 : 0,
                  height:
                      heightCtr.text.isEmpty ? null : int.parse(heightCtr.text),
                  number:
                      numberCtr.text.isEmpty ? null : int.parse(numberCtr.text),
                  value: valueCtr.text.isEmpty ? 0 : int.parse(valueCtr.text),
                  wage: wageCtr.text.isEmpty ? 0 : int.parse(wageCtr.text),
                  releaseClause: releaseClauseCtr.text.isEmpty
                      ? null
                      : int.parse(releaseClauseCtr.text),
                  ability: abilityCtr.text.isEmpty
                      ? null
                      : double.parse(abilityCtr.text),
                  potential: potentialCtr.text.isEmpty
                      ? null
                      : double.parse(potentialCtr.text),
                  imgPath: imgPathCtr.text.isEmpty ? null : imgPathCtr.text,
                  id: widget.player != null ? widget.player!.id : null,
                );
                if (widget.player != null) {
                  DatabaseHelper.updatePlayer(newPlayer);
                  showSaveSuccessModal(context);
                } else {
                  DatabaseHelper.addPlayer(newPlayer);
                }
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
                      'team': widget.team,
                      'index': 3,
                    },
                  );
                });
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
                'Your player was updated successfully',
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

  TextFormField buildImgPathFormField() {
    return TextFormField(
      onTap: () async {
        XFile? imgFile =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        setState(() {
          imgPathCtr.text = imgFile!.path;
        });
      },
      readOnly: true,
      controller: imgPathCtr,
      decoration: InputDecoration(
        labelText: 'Image',
        hintText: 'Choose player image',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const Icon(Icons.image_outlined),
        prefixIcon: IconButton(
          onPressed: () {
            setState(() {
              imgPathCtr.clear();
            });
          },
          icon: const Icon(Icons.clear_outlined),
        ),
      ),
    );
  }

  TextFormField buildPotentialAbilityFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: potentialCtr,
      decoration: const InputDecoration(
        labelText: 'Potential ability',
        hintText: 'Enter player potential ability',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.star_half_outlined),
      ),
      onChanged: (value) {
        errors.clear();
        if (value.isEmpty ||
            (double.parse(value) >= 0 && double.parse(value) <= 5)) {
          removeError(kPlayerAbilityInvalidError);
        }
      },
      validator: (value) {
        if (value!.isNotEmpty &&
            (double.parse(value) < 0 || double.parse(value) > 5)) {
          addError(kPlayerAbilityInvalidError);
          return "";
        }
        return null;
      },
    );
  }

  TextFormField buildCurrentAbilityFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: abilityCtr,
      decoration: const InputDecoration(
        labelText: 'Current ability',
        hintText: 'Enter player current ability',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.star_outline_outlined),
      ),
      onChanged: (value) {
        errors.clear();
        if (value.isEmpty ||
            (double.parse(value) >= 0 && double.parse(value) <= 5)) {
          removeError(kPlayerAbilityInvalidError);
        }
      },
      validator: (value) {
        if (value!.isNotEmpty &&
            (double.parse(value) < 0 || double.parse(value) > 5)) {
          addError(kPlayerAbilityInvalidError);
          return "";
        }
        return null;
      },
    );
  }

  TextFormField buildReleaseClauseFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: releaseClauseCtr,
      decoration: const InputDecoration(
        labelText: 'Release clause',
        hintText: 'Enter player release clause',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.money_off_csred_outlined),
      ),
    );
  }

  TextFormField buildWageFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: wageCtr,
      decoration: const InputDecoration(
        labelText: 'Wage',
        hintText: 'Enter player wage',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.money_outlined),
      ),
    );
  }

  TextFormField buildValueFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: valueCtr,
      decoration: const InputDecoration(
        labelText: 'Value',
        hintText: 'Enter player value',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.attach_money_outlined),
      ),
    );
  }

  TextFormField buildNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onChanged: (value) {
        errors.clear();
        if (value.isEmpty ||
            (int.parse(value) <= 99 && int.parse(value) >= 1)) {
          removeError(kPlayerNumberInvalidError);
        }
      },
      validator: (value) {
        if (value!.isNotEmpty &&
            (int.parse(value) > 99 || int.parse(value) < 1)) {
          addError(kPlayerNumberInvalidError);
          return "";
        }
        return null;
      },
      controller: numberCtr,
      decoration: const InputDecoration(
        labelText: 'Number',
        hintText: 'Enter player number',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.numbers_outlined),
      ),
    );
  }

  TextFormField buildHeightFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onChanged: (value) {
        errors.clear();
        if (value.isEmpty ||
            (int.parse(value) <= 300 && int.parse(value) >= 100)) {
          removeError(kPlayerHeightInvalidError);
        }
      },
      validator: (value) {
        if (value!.isNotEmpty &&
            (int.parse(value) > 300 || int.parse(value) < 100)) {
          addError(kPlayerHeightInvalidError);
          return "";
        }
        return null;
      },
      controller: heightCtr,
      decoration: const InputDecoration(
        labelText: 'Height',
        hintText: 'Enter player height',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.height_outlined),
      ),
    );
  }

  Stack buildFeetCheckBoxes() {
    return Stack(
      alignment: Alignment.center,
      children: [
        TextFormField(
          readOnly: true,
          decoration: const InputDecoration(
            labelText: 'Foot',
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              child: Row(
                children: [
                  Checkbox(
                    value: leftFoot,
                    activeColor: kPrimaryColor,
                    onChanged: (value) {
                      setState(() {
                        leftFoot = value!;
                      });
                    },
                  ),
                  Text(
                    'Left foot',
                    style: TextStyle(
                      color: leftFoot ? kPrimaryColor : kSecondaryColor,
                    ),
                  ),
                  SizedBox(width: getProportionateScreenWidth(8)),
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: SvgPicture.asset(
                      'assets/icons/foot.svg',
                      color: leftFoot ? kPrimaryColor : kSecondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/foot.svg',
                    color: rightFoot ? kPrimaryColor : kSecondaryColor,
                  ),
                  SizedBox(width: getProportionateScreenWidth(8)),
                  Text(
                    'Right foot',
                    style: TextStyle(
                      color: rightFoot ? kPrimaryColor : kSecondaryColor,
                    ),
                  ),
                  Checkbox(
                    value: rightFoot,
                    activeColor: kPrimaryColor,
                    onChanged: (value) {
                      setState(() {
                        rightFoot = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Text buildSecondaryPosInfoText() {
    return Text(
      "Choose other position(s) by clicking on the dots inside the football field",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: getProportionateScreenWidth(14),
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
          buildPositionDot(105, 15, 'LWB'),
          buildPositionDot(105, 206, 'RWB'),
          buildPositionDot(105, 110, 'DM'),
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
      child: InkWell(
        onTap: () {
          if (primaryPos != pos) {
            if (!secondaryPos.contains(pos)) {
              setState(() {
                secondaryPos.add(pos);
                // print(secondaryPos);
              });
            } else {
              setState(() {
                secondaryPos.remove(pos);
                // print(secondaryPos);
              });
            }
          }
        },
        child: Container(
          width: getProportionateScreenWidth(17),
          height: getProportionateScreenWidth(17),
          decoration: BoxDecoration(
            color: primaryPos == pos
                ? Colors.green
                : secondaryPos.contains(pos)
                    ? Colors.lightGreen
                    : kSecondaryColor,
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
      ),
    );
  }

  TextFormField buildPrimaryPosFormField() {
    return TextFormField(
      onTap: () async {
        Position? result = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return const MyPositionPicker();
          },
        );
        if (result != null) {
          primaryPosCtr.text = result.position;
          primaryPos = result.pos;
          removeError(kPositionNullError);
          setState(() {});
          // print(primaryPos);
        }
      },
      readOnly: true,
      controller: primaryPosCtr,
      decoration: InputDecoration(
        labelText: 'Primary position',
        hintText: 'Choose player primary position',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: primaryPosCtr.text.isEmpty
            ? const Icon(Icons.sports_soccer_outlined)
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    primaryPos,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          addError(kPositionNullError);
          return "";
        }
        return null;
      },
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
        hintText: 'Enter player birth date',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.calendar_today_outlined),
      ),
    );
  }

  TextFormField buildNationFormField() {
    return TextFormField(
      onTap: () async {
        Country? result = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return MyCountryPicker(countries: countries);
          },
        );
        if (result != null) {
          nationCtr.text = result.name;
          nationFlagCtr = result.flag;
          removeError(kPlayerNationNullError);
          setState(() {});
        }
      },
      readOnly: true,
      controller: nationCtr,
      decoration: InputDecoration(
        labelText: 'Nation',
        hintText: 'Choose player nation',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: nationCtr.text.isEmpty
            ? const Icon(Icons.flag_outlined)
            : SvgPicture.asset(
                nationFlagCtr,
                width: getProportionateScreenHeight(35),
              ),
        suffixIconConstraints:
            BoxConstraints(minWidth: getProportionateScreenWidth(50)),
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
          removeError(kPlayerNameNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(kPlayerNameNullError);
          return "";
        }
        return null;
      },
      controller: nameCtr,
      decoration: const InputDecoration(
        labelText: 'Name',
        hintText: 'Enter player name',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.person_outline_sharp),
      ),
    );
  }
}
