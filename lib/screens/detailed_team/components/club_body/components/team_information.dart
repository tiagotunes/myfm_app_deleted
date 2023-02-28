import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myfm_app/constants.dart';
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
  var f = NumberFormat("###.#");
  int nPlayers = 0;
  int nForeignPlayers = 0;
  double perForeignPlayers = 0;
  double avgAge = 0;

  void _updateTeamInfo() async {
    nPlayers = await DatabaseHelper.getNumberPlayersFromTeam(widget.team);
    avgAge = await DatabaseHelper.getAvgPlayersAgeFromTeam(widget.team);
    nForeignPlayers =
        await DatabaseHelper.getNumberForeigPlayersFromTeam(widget.team);
    perForeignPlayers = nForeignPlayers / nPlayers;
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
              color: kSecondaryColor.withOpacity(0.1),
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
                buildInformationItem(Icons.groups, nPlayers, 'Total players'),
                buildInformationItem1(
                    Icons.calendar_today, avgAge, 'Average age\nof players'),
                buildInformationItem2(
                    perForeignPlayers, nForeignPlayers, 'Foreign players'),
                buildInformationItem2(0.0, 0, 'National team\nplayers'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Column buildInformationItem2(double value, int number, String text) {
    return Column(
      children: [
        CircularProgressIndicator(
          value: value,
          backgroundColor: kPrimaryColor.withOpacity(0.2),
          color: Colors.black,
          strokeWidth: 7.0,
        ),
        SizedBox(height: getProportionateScreenHeight(2)),
        Text(
          number.toString(),
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: getProportionateScreenWidth(18),
            fontWeight: FontWeight.bold,
          ),
        ),
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

  Column buildInformationItem1(IconData icon, double number, String text) {
    return Column(
      children: [
        Icon(
          icon,
          size: getProportionateScreenWidth(25),
          color: kPrimaryColor.withOpacity(0.7),
        ),
        Text(
          avgAge == widget.team.year ? 0.toString() : f.format(number),
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: getProportionateScreenWidth(18),
            fontWeight: FontWeight.bold,
          ),
        ),
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

  Column buildInformationItem(IconData icon, int number, String text) {
    return Column(
      children: [
        Icon(
          icon,
          size: getProportionateScreenWidth(25),
          color: kPrimaryColor.withOpacity(0.7),
        ),
        Text(
          number.toString(),
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: getProportionateScreenWidth(18),
            fontWeight: FontWeight.bold,
          ),
        ),
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
}
