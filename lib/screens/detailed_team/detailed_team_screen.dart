import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:myfm_app/screens/detailed_team/components/club_body/club_body.dart';
import 'package:myfm_app/screens/detailed_team/components/notes_body/notes_body.dart';
import 'package:myfm_app/screens/detailed_team/components/custom_team_popup_menu.dart';
import 'package:myfm_app/screens/detailed_team/components/players_body/players_body.dart';
import 'package:myfm_app/screens/detailed_team/components/staff_body/staff_body.dart';
import 'package:myfm_app/screens/detailed_team/components/transfers_body/transfers_body.dart';
import 'package:myfm_app/size_config.dart';

class DetailedTeamScreen extends StatefulWidget {
  static String routeName = '/detailed_team';
  const DetailedTeamScreen({super.key});

  @override
  State<DetailedTeamScreen> createState() => _DetailedTeamScreenState();
}

class _DetailedTeamScreenState extends State<DetailedTeamScreen> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    User? user = arguments['user'];
    Team? team = arguments['team'];

    List<Widget> bodyOptions = <Widget>[
      const NotesBody(),
      const StaffBody(),
      ClubBody(team: team!),
      const PlayersBody(),
      const TransfersBody(),
    ];

    return Scaffold(
      appBar: AppBar(
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
        actions: [CustomTeamPopupMenu(user: user!, team: team)],
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
            vertical: getProportionateScreenHeight(10),
          ),
          child: GNav(
            gap: 8,
            activeColor: Colors.black,
            iconSize: getProportionateScreenWidth(24),
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10),
              vertical: getProportionateScreenHeight(15),
            ),
            tabBackgroundColor: Color(int.parse(color)).withOpacity(0.3),
            tabBorderRadius: 25,
            tabActiveBorder: Border.all(
              color: Color(int.parse(color)) == Colors.white
                  ? kSecondaryColor.withOpacity(0.3)
                  : Color(int.parse(color)).withOpacity(0.5),
              width: 2,
            ),
            color: Colors.black,
            tabs: [
              buildGButton(Icons.note_alt_rounded, 'Notes'),
              buildGButton(Icons.co_present_rounded, 'Staff'),
              buildGButton(Icons.shield_rounded, 'Club'),
              buildGButton(Icons.group_rounded, 'Players'),
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
