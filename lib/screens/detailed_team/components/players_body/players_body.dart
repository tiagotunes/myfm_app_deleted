import 'package:flutter/material.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/models/player_model.dart';
import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:myfm_app/screens/detailed_team/components/players_body/components/player_card.dart';
import 'package:myfm_app/screens/detailed_team/components/players_body/components/player_tile.dart';
import 'package:myfm_app/services/database_helper.dart';
import 'package:myfm_app/size_config.dart';

class PlayersBody extends StatefulWidget {
  final User user;
  final Team team;
  const PlayersBody({super.key, required this.team, required this.user});

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
              snapshot.data!.any((element) => element.naturalPosition == 'GK')
                  ? buildPositionLabel('GK')
                  : const SizedBox(),
              buildPositionPlayers(snapshot.data!, 'GK'),
              snapshot.data!.any((element) => element.naturalPosition == 'CB')
                  ? buildPositionLabel('CB')
                  : const SizedBox(),
              buildPositionPlayers(snapshot.data!, 'CB'),
              snapshot.data!.any((element) => element.naturalPosition == 'LB')
                  ? buildPositionLabel('LB')
                  : const SizedBox(),
              buildPositionPlayers(snapshot.data!, 'LB'),
              snapshot.data!.any((element) => element.naturalPosition == 'LWB')
                  ? buildPositionLabel('LWB')
                  : const SizedBox(),
              buildPositionPlayers(snapshot.data!, 'LWB'),
              snapshot.data!.any((element) => element.naturalPosition == 'RB')
                  ? buildPositionLabel('RB')
                  : const SizedBox(),
              buildPositionPlayers(snapshot.data!, 'RB'),
              snapshot.data!.any((element) => element.naturalPosition == 'RWB')
                  ? buildPositionLabel('RWB')
                  : const SizedBox(),
              buildPositionPlayers(snapshot.data!, 'RWB'),
              snapshot.data!.any((element) => element.naturalPosition == 'DM')
                  ? buildPositionLabel('DM')
                  : const SizedBox(),
              buildPositionPlayers(snapshot.data!, 'DM'),
              snapshot.data!.any((element) => element.naturalPosition == 'CM')
                  ? buildPositionLabel('CM')
                  : const SizedBox(),
              buildPositionPlayers(snapshot.data!, 'CM'),
              snapshot.data!.any((element) => element.naturalPosition == 'LM')
                  ? buildPositionLabel('LM')
                  : const SizedBox(),
              buildPositionPlayers(snapshot.data!, 'LM'),
              snapshot.data!.any((element) => element.naturalPosition == 'RM')
                  ? buildPositionLabel('RM')
                  : const SizedBox(),
              buildPositionPlayers(snapshot.data!, 'RM'),
              snapshot.data!.any((element) => element.naturalPosition == 'AMC')
                  ? buildPositionLabel('AMC')
                  : const SizedBox(),
              buildPositionPlayers(snapshot.data!, 'AMC'),
              snapshot.data!.any((element) => element.naturalPosition == 'AML')
                  ? buildPositionLabel('AML')
                  : const SizedBox(),
              buildPositionPlayers(snapshot.data!, 'AML'),
              snapshot.data!.any((element) => element.naturalPosition == 'AMR')
                  ? buildPositionLabel('AMR')
                  : const SizedBox(),
              buildPositionPlayers(snapshot.data!, 'AMR'),
              snapshot.data!.any((element) => element.naturalPosition == 'ST')
                  ? buildPositionLabel('ST')
                  : const SizedBox(),
              buildPositionPlayers(snapshot.data!, 'ST'),
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
        .where((element) => element.naturalPosition == position)
        .toList();
    if (playersPos.length > 1) {
      playersPos.sort(mySort);
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: playersPos.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
            getProportionateScreenWidth(8),
            0,
            getProportionateScreenWidth(8),
            getProportionateScreenWidth(6),
          ),
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return GestureDetector(
                    child: PlayerCard(
                      user: widget.user,
                      team: widget.team,
                      player: playersPos[index],
                    ),
                  );
                },
              );
            },
            child: PlayerTile(
              player: playersPos[index],
              team: widget.team,
            ),
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

  int mySort(Player a, Player b) {
    DateTime aBirthdate = DateTime.parse(a.birthdate);
    DateTime bBirthdate = DateTime.parse(b.birthdate);

    return (b.ability ?? double.negativeInfinity)
                .compareTo(a.ability ?? double.negativeInfinity) !=
            0
        ? (b.ability ?? double.negativeInfinity)
            .compareTo(a.ability ?? double.negativeInfinity)
        : (b.value ?? double.negativeInfinity)
                    .compareTo(a.value ?? double.negativeInfinity) !=
                0
            ? (b.value ?? double.negativeInfinity)
                .compareTo(a.value ?? double.negativeInfinity)
            : bBirthdate.compareTo(aBirthdate);
  }
}
