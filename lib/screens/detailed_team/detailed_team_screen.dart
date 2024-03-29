import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:myfm_app/screens/detailed_team/components/club_body/club_body.dart';
import 'package:myfm_app/screens/detailed_team/components/tactics_body/tactics_body.dart';
import 'package:myfm_app/screens/detailed_team/components/custom_team_popup_menu.dart';
import 'package:myfm_app/screens/detailed_team/components/players_body/players_body.dart';
import 'package:myfm_app/screens/detailed_team/components/transfers_body/transfers_body.dart';
import 'package:myfm_app/size_config.dart';

class DetailedTeamScreen extends StatefulWidget {
  static String routeName = '/detailed_team';
  const DetailedTeamScreen({super.key});

  @override
  State<DetailedTeamScreen> createState() => _DetailedTeamScreenState();
}

class _DetailedTeamScreenState extends State<DetailedTeamScreen> {
  int _currentIndex = 0;
  bool firstX = false;

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    User? user = arguments['user'];
    Team? team = arguments['team'];

    int? index = arguments['index'];
    if (index != null && !firstX) {
      _currentIndex = index;
      firstX = true;
    }

    List<Widget> bodyOptions = <Widget>[
      ClubBody(team: team!),
      PlayersBody(user: user!, team: team),
      const TacticsBody(),
      const TransfersBody(),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          team.name,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(20),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [CustomTeamPopupMenu(user: user, team: team)],
      ),
      body: bodyOptions.elementAt(_currentIndex),
      bottomNavigationBar: buildBottomNavigationBar(team.color!),
    );
  }

  Container buildBottomNavigationBar(String color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            color: Colors.black.withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(8),
            vertical: getProportionateScreenHeight(11),
          ),
          child: GNav(
            gap: 8,
            activeColor: Colors.black,
            iconSize: getProportionateScreenWidth(24),
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10),
              vertical: getProportionateScreenHeight(11),
            ),
            tabBackgroundColor: Color(int.parse(color)).withOpacity(0.3),
            tabBorderRadius: 20,
            tabActiveBorder: Border.all(
              color: Color(int.parse(color)) == Colors.white
                  ? kSecondaryColor.withOpacity(0.3)
                  : Color(int.parse(color)).withOpacity(0.5),
              width: 2,
            ),
            color: Colors.black,
            tabs: [
              buildGButton(Icons.shield_rounded, 'Club'),
              buildGButton(Icons.group_rounded, 'Players'),
              buildGButton(Icons.note_alt_rounded, 'Tactics'),
              buildGButton(Icons.swap_horiz_rounded, 'Transfers'),
            ],
            selectedIndex: _currentIndex,
            onTabChange: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }

  GButton buildGButton(IconData icon, String text) {
    return GButton(
      icon: icon,
      text: text,
    );
  }
}
