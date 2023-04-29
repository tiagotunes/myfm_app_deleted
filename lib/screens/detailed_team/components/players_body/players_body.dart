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
  final searchCtr = TextEditingController();
  bool showLoanPlayers = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildFilterOptions(),
        Expanded(
          child: FutureBuilder<List<Player>?>(
            future: DatabaseHelper.getAllPlayers(widget.team),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasData) {
                List<Player>? filteredPlayers = snapshot.data!
                    .where((player) =>
                        player.name.toLowerCase().contains(searchCtr.text))
                    .where((player) => showLoanPlayers
                        ? player.isLoanedOut == 1 || player.isLoanedOut == 0
                        : player.isLoanedOut == 0)
                    .toList();
                return ListView(
                  children: [
                    filteredPlayers
                            .any((element) => element.naturalPosition == 'GK')
                        ? buildPositionLabel('GK')
                        : const SizedBox(),
                    buildPositionPlayers(filteredPlayers, 'GK'),
                    filteredPlayers
                            .any((element) => element.naturalPosition == 'CB')
                        ? buildPositionLabel('CB')
                        : const SizedBox(),
                    buildPositionPlayers(filteredPlayers, 'CB'),
                    filteredPlayers
                            .any((element) => element.naturalPosition == 'LB')
                        ? buildPositionLabel('LB')
                        : const SizedBox(),
                    buildPositionPlayers(filteredPlayers, 'LB'),
                    filteredPlayers
                            .any((element) => element.naturalPosition == 'LWB')
                        ? buildPositionLabel('LWB')
                        : const SizedBox(),
                    buildPositionPlayers(filteredPlayers, 'LWB'),
                    filteredPlayers
                            .any((element) => element.naturalPosition == 'RB')
                        ? buildPositionLabel('RB')
                        : const SizedBox(),
                    buildPositionPlayers(filteredPlayers, 'RB'),
                    filteredPlayers
                            .any((element) => element.naturalPosition == 'RWB')
                        ? buildPositionLabel('RWB')
                        : const SizedBox(),
                    buildPositionPlayers(filteredPlayers, 'RWB'),
                    filteredPlayers
                            .any((element) => element.naturalPosition == 'DM')
                        ? buildPositionLabel('DM')
                        : const SizedBox(),
                    buildPositionPlayers(filteredPlayers, 'DM'),
                    filteredPlayers
                            .any((element) => element.naturalPosition == 'CM')
                        ? buildPositionLabel('CM')
                        : const SizedBox(),
                    buildPositionPlayers(filteredPlayers, 'CM'),
                    filteredPlayers
                            .any((element) => element.naturalPosition == 'LM')
                        ? buildPositionLabel('LM')
                        : const SizedBox(),
                    buildPositionPlayers(filteredPlayers, 'LM'),
                    filteredPlayers
                            .any((element) => element.naturalPosition == 'RM')
                        ? buildPositionLabel('RM')
                        : const SizedBox(),
                    buildPositionPlayers(filteredPlayers, 'RM'),
                    filteredPlayers
                            .any((element) => element.naturalPosition == 'AMC')
                        ? buildPositionLabel('AMC')
                        : const SizedBox(),
                    buildPositionPlayers(filteredPlayers, 'AMC'),
                    filteredPlayers
                            .any((element) => element.naturalPosition == 'AML')
                        ? buildPositionLabel('AML')
                        : const SizedBox(),
                    buildPositionPlayers(filteredPlayers, 'AML'),
                    filteredPlayers
                            .any((element) => element.naturalPosition == 'AMR')
                        ? buildPositionLabel('AMR')
                        : const SizedBox(),
                    buildPositionPlayers(filteredPlayers, 'AMR'),
                    filteredPlayers
                            .any((element) => element.naturalPosition == 'ST')
                        ? buildPositionLabel('ST')
                        : const SizedBox(),
                    buildPositionPlayers(filteredPlayers, 'ST'),
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
          ),
        ),
      ],
    );
  }

  Padding buildFilterOptions() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(10),
        vertical: getProportionateScreenHeight(8),
      ),
      child: Row(
        children: [
          buildSearchBar(),
          SizedBox(width: getProportionateScreenWidth(10)),
          buildFilterButton(),
        ],
      ),
    );
  }

  Ink buildFilterButton() {
    return Ink(
      decoration: ShapeDecoration(
        color: kSecondaryColor.withOpacity(0.2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: IconButton(
        icon: const Icon(Icons.filter_alt_outlined),
        onPressed: () {
          setState(() {
            showLoanPlayers = !showLoanPlayers;
          });
        },
      ),
    );
  }

  Expanded buildSearchBar() {
    return Expanded(
      child: TextFormField(
        controller: searchCtr,
        onChanged: (value) {
          setState(() {});
        },
        decoration: InputDecoration(
          labelText: 'Search',
          contentPadding: EdgeInsets.all(getProportionateScreenWidth(5)),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                searchCtr.clear();
              });
            },
            icon: const Icon(Icons.clear),
          ),
        ),
      ),
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
