import 'package:flutter/material.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/models/player_model.dart';
import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/screens/detailed_team/components/players_body/components/player_card.dart';
import 'package:myfm_app/services/database_helper.dart';
import 'package:myfm_app/size_config.dart';

class PlayersBody extends StatefulWidget {
  final Team team;
  const PlayersBody({super.key, required this.team});

  @override
  State<PlayersBody> createState() => _PlayersBodyState();
}

class _PlayersBodyState extends State<PlayersBody> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Player>?>(
      future: DatabaseHelper.getAllPlayers(widget.team),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          return ListView(
            children: [
              snapshot.data!.any((element) => element.primaryPosition=='GK') ? buildPositionLabel('Goalkeeper') : const SizedBox(),
              buildPositionPlayers(snapshot.data!, 'GK'),
              snapshot.data!.any((element) => element.primaryPosition=='CB') ? buildPositionLabel('CB') : const SizedBox(),
              buildPositionPlayers(snapshot.data!, 'CB'),
              snapshot.data!.any((element) => element.primaryPosition=='LB') ? buildPositionLabel('LB') : const SizedBox(),
              buildPositionPlayers(snapshot.data!, 'LB'),
              snapshot.data!.any((element) => element.primaryPosition=='RB') ? buildPositionLabel('RB') : const SizedBox(),
              buildPositionPlayers(snapshot.data!, 'RB'),
              snapshot.data!.any((element) => element.primaryPosition=='LWB') ? buildPositionLabel('LWB') : const SizedBox(),
              buildPositionPlayers(snapshot.data!, 'LWB'),
              snapshot.data!.any((element) => element.primaryPosition=='RWB') ? buildPositionLabel('RWB') : const SizedBox(),
              buildPositionPlayers(snapshot.data!, 'RWB'),
              // ... DM, etc
            ],
          );
        } else {
          return Center(
            child: Text(
              'No players in the team',
              style: TextStyle(
                color: kSecondaryColor.withOpacity(0.8),
                fontSize: getProportionateScreenWidth(25),
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }
      },
    );
  }

  ListView buildPositionPlayers(List<Player> players, String position) {
    List<Player>? playersPos = players
        .where((element) => element.primaryPosition == position)
        .toList();
    // sort playersPos
    return ListView.builder(
      shrinkWrap: true,
      itemCount: playersPos.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
            getProportionateScreenWidth(8),
            0,
            getProportionateScreenWidth(8),
            getProportionateScreenWidth(6),
          ),
          child: PlayerCard(
            player: playersPos[index],
            teamYear: widget.team.year,
          ),
        );
      },
    );
  }

  ListTile buildPositionLabel(String position) {
    return ListTile(
      title: Text(
        position,
        style: TextStyle(
          fontSize: getProportionateScreenWidth(20),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
