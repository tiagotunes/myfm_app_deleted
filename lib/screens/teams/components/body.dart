import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:myfm_app/screens/detailed_team/detailed_team_screen.dart';
import 'package:myfm_app/screens/teams/components/team_card.dart';
import 'package:myfm_app/services/database_helper.dart';
import 'package:myfm_app/size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.user});
  final User user;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Team>?>(
      future: DatabaseHelper.getAllTeams(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          return buildGridView(snapshot);
        } else {
          return Center(
            child: Text(
              'No teams in database',
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

  Padding buildGridView(AsyncSnapshot<List<Team>?> snapshot) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(3),
        horizontal: getProportionateScreenWidth(5),
      ),
      child: MasonryGridView.builder(
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        crossAxisSpacing: getProportionateScreenWidth(6),
        mainAxisSpacing: getProportionateScreenWidth(6),
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                DetailedTeamScreen.routeName,
                arguments: {
                  'user': widget.user,
                  'team': snapshot.data![index],
                },
              );
            },
            child: TeamCard(
              name: snapshot.data![index].name,
              color: snapshot.data![index].color!,
              imgPath: snapshot.data![index].imgBadgePath,
            ),
          );
        },
      ),
    );
  }
}
