import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:myfm_app/components/custom_alert_dialog.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/models/player_model.dart';
import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:myfm_app/screens/complete_player/complete_player_screen.dart';
import 'package:myfm_app/screens/detailed_team/detailed_team_screen.dart';
import 'package:myfm_app/screens/home/home_screen.dart';
import 'package:myfm_app/screens/splash/splash_screen.dart';
import 'package:myfm_app/screens/teams/teams_screen.dart';
import 'package:myfm_app/services/database_helper.dart';
import 'package:myfm_app/size_config.dart';

class PlayerCard extends StatelessWidget {
  final User user;
  final Team team;
  final Player player;
  const PlayerCard({
    super.key,
    required this.user,
    required this.team,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {
    double grayscale = (0.299 * Color(int.parse(team.color!)).red) +
        (0.587 * Color(int.parse(team.color!)).green) +
        (0.114 * Color(int.parse(team.color!)).blue);

    List<String> splitName = player.name.split(' ');
    String shirtName = splitName[splitName.length - 1];

    List result = buildStars(player.ability!, player.potential!);
    List<Widget> abilityStars = result[0];
    List<Widget> potentialStars = result[1];
    List<Widget> emptyStars = result[2];

    return AlertDialog(
      contentPadding: EdgeInsets.all(getProportionateScreenWidth(15)),
      content: SizedBox(
        width: 700,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTopHeader(context),
            SizedBox(height: getProportionateScreenHeight(15)),
            buildContainersSbS(shirtName, grayscale),
            SizedBox(height: getProportionateScreenHeight(5)),
            buildPlayerBasics(emptyStars, potentialStars, abilityStars),
            buildFootballField(),
            buildPlayerFinancial()
          ],
        ),
      ),
    );
  }

  Padding buildPlayerFinancial() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: Column(
        children: [
          buildFinancialInfo('Value', player.value!),
          SizedBox(height: getProportionateScreenHeight(5)),
          player.releaseClause != null
              ? Column(
                  children: [
                    buildFinancialRcInfo(player.releaseClause!, player.value!),
                    SizedBox(height: getProportionateScreenHeight(5)),
                  ],
                )
              : const SizedBox(),
          buildFinancialInfo('Wage', player.wage!),
          SizedBox(height: getProportionateScreenHeight(5)),
        ],
      ),
    );
  }

  Row buildFinancialRcInfo(int releaseClause, int value) {
    var fV = NumberFormat('###,###,###');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Release Clause',
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "${fV.format(releaseClause)} ${currencyOptions[currency]}",
          style: TextStyle(
            color: value > releaseClause ? Colors.red : Colors.black,
          ),
        ),
      ],
    );
  }

  Row buildFinancialInfo(String text, int value) {
    var fV = NumberFormat('###,###,###');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text("${fV.format(value)} ${currencyOptions[currency]}"),
      ],
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
          buildPositionDot(15, 111, 'GK'),
          buildPositionDot(42, 111, 'CB'),
          buildPositionDot(42, 34, 'LB'),
          buildPositionDot(42, 189, 'RB'),
          buildPositionDot(85, 34, 'LWB'),
          buildPositionDot(85, 189, 'RWB'),
          buildPositionDot(85, 111, 'DM'),
          buildPositionDot(127, 111, 'CM'),
          buildPositionDot(127, 34, 'LM'),
          buildPositionDot(127, 189, 'RM'),
          buildPositionDot(177, 111, 'AMC'),
          buildPositionDot(177, 34, 'AML'),
          buildPositionDot(177, 189, 'AMR'),
          buildPositionDot(218, 111, 'ST'),
        ],
      ),
    );
  }

  Positioned buildPositionDot(double x, double y, String pos) {
    return Positioned(
      top: getProportionateScreenHeight(y),
      left: getProportionateScreenWidth(x),
      child: Container(
        width: getProportionateScreenWidth(15),
        height: getProportionateScreenWidth(15),
        decoration: BoxDecoration(
          color: player.naturalPosition == pos
              ? kNaturalPosition
              : player.accomplishedPosition!.contains(pos)
                  ? kAccomplishedPosition
                  : player.unconvincingPosition!.contains(pos)
                      ? kUnconvincingPosition
                      : player.awkwardPosition!.contains(pos)
                          ? kAwkwardPosition
                          : Colors.transparent,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: (player.naturalPosition == pos ||
                      player.accomplishedPosition!.contains(pos) ||
                      player.unconvincingPosition!.contains(pos) ||
                      player.awkwardPosition!.contains(pos))
                  ? Colors.black38
                  : Colors.transparent,
              offset: const Offset(-1, 0),
              blurRadius: 2,
            )
          ],
        ),
      ),
    );
  }

  Row buildPlayerBasics(List<Widget> emptyStars, List<Widget> potentialStars,
      List<Widget> abilityStars) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: getProportionateScreenWidth(120),
          child: Column(
            children: [
              buildPlayerNation(),
              Text(
                "${team.year - DateTime.parse(player.birthdate).year} years",
              ),
            ],
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(130),
          child: buildAbilityStars(
            emptyStars,
            potentialStars,
            abilityStars,
          ),
        ),
      ],
    );
  }

  Padding buildAbilityStars(List<Widget> emptyStars,
      List<Widget> potentialStars, List<Widget> abilityStars) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(9)),
      child: Stack(
        children: [
          Row(
            children: emptyStars,
          ),
          Row(
            children: potentialStars,
          ),
          Row(
            children: abilityStars,
          ),
        ],
      ),
    );
  }

  List buildStars(double ability, double potential) {
    List<Widget> aL = [];
    List<Widget> pL = [];
    if (player.ability != null) {
      int intValue = player.ability!.floor();
      int remainder = ((player.ability! - intValue) * 2).toInt();
      aL = List.generate(
        intValue,
        (index) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
      );
      if (remainder == 1) {
        aL.add(const Icon(
          Icons.star_half,
          color: Colors.amber,
        ));
      }
    }
    if (player.potential != null) {
      int intValue = player.potential!.floor();
      int remainder = ((player.potential! - intValue) * 2).toInt();
      pL = List.generate(
        intValue,
        (index) => Icon(
          Icons.star,
          color: Colors.amber[200],
        ),
      );
      if (remainder == 1) {
        pL.add(Icon(
          Icons.star_half,
          color: Colors.amber[200],
        ));
      }
    }
    List<Widget> eL = List.generate(
      5,
      (index) => Icon(
        Icons.star,
        color: kSecondaryColor.withOpacity(0.4),
      ),
    );
    return [aL, pL, eL];
  }

  Row buildPlayerNation() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          player.nationFlag,
          width: getProportionateScreenWidth(23),
        ),
        SizedBox(width: getProportionateScreenWidth(7)),
        Text(
          player.nation,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(13),
          ),
        ),
      ],
    );
  }

  Row buildContainersSbS(String shirtName, double grayscale) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildPlayerImage(),
        buildPlayerShirt(shirtName, grayscale),
      ],
    );
  }

  Container buildPlayerShirt(String shirtName, double grayscale) {
    return Container(
      width: getProportionateScreenWidth(130),
      height: getProportionateScreenWidth(105),
      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
      decoration: BoxDecoration(
        color: Color(int.parse(team.color!)),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(
          color: Color(int.parse(team.color!)) == Colors.white
              ? Colors.black87
              : Colors.transparent,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Text(
            shirtName,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: grayscale > 140 ? Colors.black : Colors.white,
              fontSize: getProportionateScreenWidth(17),
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: player.number != null
                  ? Text(
                      player.number.toString(),
                      style: TextStyle(
                        color: grayscale > 140 ? Colors.black : Colors.white,
                        letterSpacing: getProportionateScreenWidth(-4),
                        fontSize: getProportionateScreenWidth(40),
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }

  Container buildPlayerImage() {
    return Container(
      width: getProportionateScreenWidth(120),
      height: getProportionateScreenWidth(120),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: player.imgPath != null
              ? FileImage(File(player.imgPath!)) as ImageProvider
              : const AssetImage('assets/images/default_user1.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Row buildTopHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: getProportionateScreenWidth(10)),
        Expanded(
          child: Text(
            player.name,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(20),
                fontWeight: FontWeight.bold),
          ),
        ),
        buildIcons(context),
      ],
    );
  }

  Row buildIcons(BuildContext context) {
    return Row(
      children: [
        buildIconButton(Icons.edit_outlined, context, 0),
        SizedBox(width: getProportionateScreenWidth(8)),
        buildIconButton(Icons.delete_outline, context, 1),
      ],
    );
  }

  InkWell buildIconButton(IconData icon, BuildContext context, int flag) {
    return InkWell(
      onTap: () {
        if (flag == 0) {
          Navigator.pushNamed(
            context,
            CompletePlayerScreen.routeName,
            arguments: {
              'user': user,
              'team': team,
              'player': player,
            },
          );
        } else {
          showConfirmationModal(context);
        }
      },
      child: Icon(
        icon,
        size: getProportionateScreenWidth(25),
        color: kSecondaryColor,
      ),
    );
  }

  Future<dynamic> showConfirmationModal(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          icon: Icons.delete_forever,
          text:
              'Are you sure you want to remove ${player.name} from ${team.name}?',
          btnText: 'Remove',
          press: () {
            DatabaseHelper.deletePlayer(player);
            Navigator.pushNamedAndRemoveUntil(
              context,
              SplashScreen.routeName,
              ModalRoute.withName('/'),
            );
            Navigator.pushNamed(
              context,
              HomeScreen.routeName,
              arguments: {'user': user},
            );
            Navigator.pushNamed(
              context,
              TeamsScreen.routeName,
              arguments: {'user': user},
            );
            Navigator.pushNamed(
              context,
              DetailedTeamScreen.routeName,
              arguments: {
                'user': user,
                'team': team,
                'index': 3,
              },
            );
          },
        );
      },
    );
  }
}
