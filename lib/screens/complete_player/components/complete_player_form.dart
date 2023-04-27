import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:myfm_app/components/country_picker.dart';
import 'package:myfm_app/components/custom_alert_dialog.dart';
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
  final naturalPosCtr = TextEditingController();
  String naturalPos = "";
  List<dynamic> accomplishedPos = [];
  List<dynamic> unconvincingPos = [];
  List<dynamic> awkwardPos = [];
  bool leftFoot = false;
  bool rightFoot = false;
  final heightCtr = TextEditingController();
  final numberCtr = TextEditingController();
  final valueCtr = TextEditingController();
  final wageCtr = TextEditingController();
  final releaseClauseCtr = TextEditingController();
  double abilitySlider = 0;
  double potentialSlider = 0;

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
      naturalPos = widget.player!.naturalPosition.toString();
      initPositionDropdown(naturalPos);
      accomplishedPos = jsonDecode(widget.player!.accomplishedPosition!);
      unconvincingPos = jsonDecode(widget.player!.unconvincingPosition!);
      awkwardPos = jsonDecode(widget.player!.awkwardPosition!);
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
        abilitySlider = widget.player!.ability!;
      }
      if (widget.player!.potential != null) {
        potentialSlider = widget.player!.potential!;
      }
      if (widget.player!.imgPath != null) {
        imgPathCtr.text = widget.player!.imgPath!;
      }
    }
  }

  void initPositionDropdown(String pos) {
    switch (pos) {
      case 'GK':
        naturalPosCtr.text = "Goalkeeper";
        break;
      case 'CB':
        naturalPosCtr.text = "Defense (Center)";
        break;
      case 'LB':
        naturalPosCtr.text = "Defense (Left)";
        break;
      case 'RB':
        naturalPosCtr.text = "Defense (Right)";
        break;
      case 'LWB':
        naturalPosCtr.text = "Wing Back (Left)";
        break;
      case 'RWB':
        naturalPosCtr.text = "Wing Back (Right)";
        break;
      case 'DM':
        naturalPosCtr.text = "Defensive Midfielder";
        break;
      case 'CM':
        naturalPosCtr.text = "Midfielder (Center)";
        break;
      case 'LM':
        naturalPosCtr.text = "Midfielder (Left)";
        break;
      case 'RM':
        naturalPosCtr.text = "Midfielder (Right)";
        break;
      case 'AMC':
        naturalPosCtr.text = "Attacking Midfielder (Center)";
        break;
      case 'AML':
        naturalPosCtr.text = "Attacking Midfielder (Center)";
        break;
      case 'AMR':
        naturalPosCtr.text = "Attacking Midfielder (Center)";
        break;
      case 'ST':
        naturalPosCtr.text = "Striker";
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
                  naturalPosition: naturalPos,
                  accomplishedPosition: jsonEncode(accomplishedPos),
                  unconvincingPosition: jsonEncode(unconvincingPos),
                  awkwardPosition: jsonEncode(awkwardPos),
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
                  ability: abilitySlider,
                  potential: potentialSlider,
                  imgPath: imgPathCtr.text.isEmpty ? null : imgPathCtr.text,
                  id: widget.player != null ? widget.player!.id : null,
                );
                if (widget.player != null) {
                  DatabaseHelper.updatePlayer(newPlayer);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const CustomAlertDialog(
                        icon: Icons.save,
                        text: 'Player updated successfully',
                      );
                    },
                  );
                } else {
                  DatabaseHelper.addPlayer(newPlayer);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const CustomAlertDialog(
                        icon: Icons.check_circle,
                        text: 'Player created successfully',
                      );
                    },
                  );
                }
                Future.delayed(Duration(seconds: widget.player != null ? 1 : 2),
                    () {
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
                      'index': 1,
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

  List<Widget> buildStars(double value) {
    int intValue = value.floor();
    int remainder = ((value - intValue) * 2).toInt();
    List<Widget> widgetList = List.generate(
      intValue,
      (index) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
    );
    if (remainder == 1) {
      widgetList.add(const Icon(
        Icons.star_half,
        color: Colors.amber,
      ));
    }
    widgetList.addAll(List.generate(
      5 - intValue - remainder,
      (index) => const Icon(Icons.star_border_outlined),
    ));
    return widgetList;
  }

  Stack buildPotentialAbilityFormField() {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: getProportionateScreenWidth(140),
          child: Slider(
            value: potentialSlider,
            min: 0,
            max: 5,
            divisions: 10,
            onChanged: (value) {
              setState(() {
                potentialSlider = value;
              });
            },
          ),
        ),
        IgnorePointer(
          child: TextFormField(
            readOnly: true,
            decoration: InputDecoration(
              labelText: 'Potential ability',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: buildStars(potentialSlider)),
            ),
          ),
        ),
      ],
    );
  }

  Stack buildCurrentAbilityFormField() {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: getProportionateScreenWidth(140),
          child: Slider(
            value: abilitySlider,
            min: 0,
            max: 5,
            divisions: 10,
            onChanged: (value) {
              setState(() {
                abilitySlider = value;
              });
            },
          ),
        ),
        IgnorePointer(
          child: TextFormField(
            readOnly: true,
            decoration: InputDecoration(
              labelText: 'Current ability',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: buildStars(abilitySlider)),
            ),
          ),
        ),
      ],
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

  Future<bool?> showInfoToast(String msg, int length) {
    return Fluttertoast.showToast(
      msg: msg,
      toastLength: length == 1 ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: length,
      backgroundColor: kSecondaryColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  Positioned buildPositionDot(double x, double y, String pos) {
    return Positioned(
      top: getProportionateScreenHeight(y),
      left: getProportionateScreenWidth(x),
      child: InkWell(
        onTap: () {
          if (naturalPos == '') {
            showInfoToast("Please choose primary position", 2);
          } else if (naturalPos != pos) {
            if (accomplishedPos.contains(pos)) {
              accomplishedPos.remove(pos);
              unconvincingPos.add(pos);
            } else if (unconvincingPos.contains(pos)) {
              unconvincingPos.remove(pos);
              awkwardPos.add(pos);
            } else if (awkwardPos.contains(pos)) {
              awkwardPos.remove(pos);
              showInfoToast('$pos removed', 1);
            } else {
              accomplishedPos.add(pos);
            }
            setState(() {});
          } else {
            showInfoToast("$pos is the primary position", 2);
          }
          // print("A -> ${secondaryPos}");
          // print("B -> ${unconvincingPos}");
          // print("C -> ${makeshitPos}");
        },
        child: Container(
          width: getProportionateScreenWidth(17),
          height: getProportionateScreenWidth(17),
          decoration: BoxDecoration(
            color: naturalPos == pos
                ? kNaturalPosition
                : accomplishedPos.contains(pos)
                    ? kAccomplishedPosition
                    : unconvincingPos.contains(pos)
                        ? kUnconvincingPosition
                        : awkwardPos.contains(pos)
                            ? kAwkwardPosition
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
          naturalPosCtr.text = result.position;
          naturalPos = result.pos;
          removeError(kPositionNullError);
          setState(() {});
          // print(primaryPos);
        }
      },
      readOnly: true,
      controller: naturalPosCtr,
      decoration: InputDecoration(
        labelText: 'Primary position',
        hintText: 'Choose player primary position',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: naturalPosCtr.text.isEmpty
            ? const Icon(Icons.sports_soccer_outlined)
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    naturalPos,
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
