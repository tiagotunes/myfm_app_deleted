import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  bool selectAllPos = true;
  List<String> posTags = [
    'GK',
    'CB',
    'LB',
    'LWB',
    'RB',
    'RWB',
    'DM',
    'CM',
    'LM',
    'RM',
    'AMC',
    'AML',
    'AMR',
    'ST'
  ];
  List<String> posOpts = [
    'GK',
    'CB',
    'LB',
    'LWB',
    'RB',
    'RWB',
    'DM',
    'CM',
    'LM',
    'RM',
    'AMC',
    'AML',
    'AMR',
    'ST'
  ];

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
                    .where((player) =>
                        showLoanPlayers ? true : player.isLoanedOut == 0)
                    .where((player) => posTags.contains(player.naturalPosition))
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
        icon: const Icon(Icons.filter_list),
        onPressed: () async {
          await buildFilterModal();
          setState(() {});
        },
      ),
    );
  }

  Future<bool?> buildFilterModal() {
    return showModalBottomSheet<bool>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenWidth(8),
                  horizontal: getProportionateScreenWidth(12),
                ),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Apply'),
                      ),
                      buildShowLoanPlayersFilter(setState),
                      Padding(
                        padding: EdgeInsets.only(
                          top: getProportionateScreenWidth(10),
                          bottom: getProportionateScreenWidth(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Position',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: getProportionateScreenWidth(15),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: getProportionateScreenWidth(8),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (selectAllPos) {
                                      posTags = [];
                                    } else {
                                      posTags = posOpts;
                                    }
                                    selectAllPos = !selectAllPos;
                                  });
                                },
                                child: SvgPicture.asset(
                                  selectAllPos
                                      ? 'assets/icons/selectAll.svg'
                                      : 'assets/icons/selectAllOff.svg',
                                  width: getProportionateScreenWidth(26),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      buildPositionFilter(setState),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Container buildPositionFilter(StateSetter setState) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ChipsChoice<String>.multiple(
        value: posTags,
        onChanged: (value) {
          setState(() {
            posTags = value;
          });
        },
        choiceItems: C2Choice.listFrom(
          source: posOpts,
          value: (index, item) => item,
          label: (index, item) => item,
        ),
        choiceStyle: const C2ChoiceStyle(
            color: kPrimaryColor,
            borderColor: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        choiceActiveStyle: C2ChoiceStyle(
            color: Colors.white,
            backgroundColor: Colors.black.withOpacity(0.9),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
      ),
    );
  }

  Row buildShowLoanPlayersFilter(StateSetter setState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Loaned out players',
          style: TextStyle(
            color: Colors.black87,
            fontSize: getProportionateScreenWidth(15),
          ),
        ),
        Switch(
          value: showLoanPlayers,
          activeColor: kPrimaryColor,
          onChanged: (value) {
            setState(() {
              showLoanPlayers = value;
            });
          },
        )
      ],
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
