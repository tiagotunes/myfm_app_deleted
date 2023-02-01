import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/services/database_helper.dart';
import 'package:myfm_app/size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

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
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return TeamCard(
                name: snapshot.data![index].name,
                color: snapshot.data![index].color!,
              );
            },
          );
        } else {
          return Center(
              child: Text(
            'No teams in database',
            style: TextStyle(
              color: kSecondaryColor.withOpacity(0.8),
              fontSize: getProportionateScreenWidth(25),
              fontWeight: FontWeight.bold,
            ),
          ));
        }
      },
    );
  }
}

class TeamCard extends StatelessWidget {
  const TeamCard({
    super.key,
    required this.name,
    required this.color,
  });
  final String name, color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
      decoration: BoxDecoration(
        color: Color(int.parse(color)),
        border: Border.all(color: kSecondaryColor.withOpacity(0.5), width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/icons/shield.svg',
            width: getProportionateScreenWidth(100),
          ),
          SizedBox(height: getProportionateScreenHeight(5)),
          Text(
            name,
            // 'Test with a very very very long name',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: getProportionateScreenWidth(20),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
