import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/models/player_model.dart';
import 'package:myfm_app/models/team_model.dart';
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
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Text(snapshot.data![index].name),
                  const SizedBox(width: 5),
                  SvgPicture.asset(
                    snapshot.data![index].nationFlag,
                    width: getProportionateScreenWidth(20),
                  ),
                  const SizedBox(width: 5),
                  Text(
                      "${widget.team.year - DateTime.parse(snapshot.data![index].birthdate).year} years"),
                ],
              );
            },
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
}
