import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/models/player_model.dart';
import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/services/database_helper.dart';
import 'package:myfm_app/size_config.dart';

class TeamInformation extends StatefulWidget {
  final Team team;
  const TeamInformation({
    super.key,
    required this.team,
  });

  @override
  State<TeamInformation> createState() => _TeamInformationState();
}

class _TeamInformationState extends State<TeamInformation> {
  var f = NumberFormat("##.#");
  var fV = NumberFormat('###,###,###');
  int nPlayers = 0;
  int nAPlayers = 0;
  int nForeignPlayers = 0;
  List<Player>? foreignPlayers;
  double perForeignPlayers = 0;
  double avgAge = 0;
  int squadValue = 0;

  void _updateTeamInfo() async {
    nPlayers = await DatabaseHelper.getNumberPlayers(widget.team, true);
    nAPlayers = await DatabaseHelper.getNumberPlayers(widget.team, false);
    avgAge = await DatabaseHelper.getAvgPlayersAge(widget.team);
    nForeignPlayers = await DatabaseHelper.getNumberForeignPlayers(widget.team);
    foreignPlayers = await DatabaseHelper.getForeignPlayers(widget.team);
    if (foreignPlayers != null) {
      foreignPlayers!.sort((a, b) {
        int comparison = a.nation.compareTo(b.nation);
        if (comparison == 0) {
          return a.name.compareTo(b.name);
        }
        return comparison;
      });
    }
    perForeignPlayers = nPlayers == 0 ? 0 : nForeignPlayers / nAPlayers;
    squadValue = await DatabaseHelper.getSquadValue(widget.team);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _updateTeamInfo();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Information',
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: getProportionateScreenWidth(18),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(5)),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.11),
              borderRadius: BorderRadius.circular(15),
            ),
            child: GridView.count(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10),
                vertical: getProportionateScreenWidth(20),
              ),
              childAspectRatio: 1.5,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
              controller: ScrollController(keepScrollOffset: false),
              shrinkWrap: true,
              children: [
                buildInformationItem(
                  Icons.groups,
                  nPlayers,
                  nAPlayers,
                  'Total players',
                ),
                buildInformationItem1(
                  Icons.calendar_today,
                  avgAge,
                  'Average age\nof players',
                ),
                buildInformationItem2(
                  perForeignPlayers,
                  nForeignPlayers,
                  'Foreign players',
                ),
                buildInformationItem3(
                  Icons.monetization_on_outlined,
                  squadValue,
                  'Squad value',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Column buildInformationItem3(IconData icon, int number, String text) {
    return Column(
      children: [
        const Spacer(flex: 3),
        Icon(
          icon,
          size: getProportionateScreenWidth(25),
          color: kPrimaryColor.withOpacity(0.7),
        ),
        const Spacer(),
        Text(
          fV.format(number),
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: getProportionateScreenWidth(18),
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kPrimaryColor.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  InkWell buildInformationItem2(double value, int number, String text) {
    return InkWell(
      onTap: nForeignPlayers > 0 ? buildForeignPlayersDialog : () {},
      child: Column(
        children: [
          const Spacer(flex: 3),
          CircularProgressIndicator(
            value: value,
            backgroundColor: kPrimaryColor.withOpacity(0.2),
            color: Colors.black,
            strokeWidth: 7.0,
          ),
          const Spacer(),
          SizedBox(height: getProportionateScreenHeight(2)),
          Text(
            number.toString(),
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: getProportionateScreenWidth(18),
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kPrimaryColor.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }

  void buildForeignPlayersDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          title: const Text(
            "Foreign Players",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Container(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(12),
              vertical: getProportionateScreenWidth(10),
            ),
            decoration: BoxDecoration(
              border:
                  Border.all(color: kSecondaryColor.withOpacity(0.2), width: 3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  nForeignPlayers,
                  (index) => Row(
                    children: [
                      SvgPicture.asset(foreignPlayers![index].nationFlag),
                      SizedBox(width: getProportionateScreenWidth(8)),
                      Container(
                        padding: EdgeInsets.all(getProportionateScreenWidth(4)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: foreignPlayers![index].isLoanedOut == 1
                              ? Colors.purpleAccent.withOpacity(0.2)
                              : foreignPlayers![index].isOnLoan == 1
                                  ? Colors.blue.withOpacity(0.2)
                                  : Colors.white,
                        ),
                        child: Text(foreignPlayers![index].name),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Column buildInformationItem1(IconData icon, double number, String text) {
    return Column(
      children: [
        Icon(
          icon,
          size: getProportionateScreenWidth(25),
          color: kPrimaryColor.withOpacity(0.7),
        ),
        const Spacer(),
        Text(
          avgAge == widget.team.year ? 0.toString() : f.format(number),
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: getProportionateScreenWidth(18),
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kPrimaryColor.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  Column buildInformationItem(
      IconData icon, int number1, int number2, String text) {
    return Column(
      children: [
        Icon(
          icon,
          size: getProportionateScreenWidth(25),
          color: kPrimaryColor.withOpacity(0.7),
        ),
        const Spacer(),
        Text(
          number1 == number2
              ? fV.format(number1)
              : "${fV.format(number1)} (${fV.format(number2)})",
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: getProportionateScreenWidth(18),
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kPrimaryColor.withOpacity(0.7),
          ),
        ),
        const Spacer(flex: 3),
      ],
    );
  }
}
