import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/models/team_model.dart';
import 'package:myfm_app/services/database_helper.dart';
import 'package:myfm_app/size_config.dart';

class TeamFinances extends StatefulWidget {
  final Team team;
  const TeamFinances({
    super.key,
    required this.team,
  });

  @override
  State<TeamFinances> createState() => _TeamFinancesState();
}

class _TeamFinancesState extends State<TeamFinances> {
  var fV = NumberFormat('###,###,###');
  int wageBcurrentlySpending = 0;

  void _updateTeamFinances() async {
    wageBcurrentlySpending = await DatabaseHelper.getTotalWages(widget.team);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _updateTeamFinances();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Finances',
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: getProportionateScreenWidth(18),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(5)),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(getProportionateScreenWidth(10)),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                buildFinancialRow(
                  Icons.account_balance,
                  'Balance',
                  0,
                ),
                SizedBox(height: getProportionateScreenHeight(7)),
                buildFinancialRow(
                  Icons.attach_money_outlined,
                  'Transfer Budget',
                  widget.team.transferBudget!,
                ),
                SizedBox(height: getProportionateScreenHeight(7)),
                buildFinancialRow(
                  Icons.money_outlined,
                  'Wage Budget',
                  widget.team.wageBudget!,
                ),
                buildFinancialSubRow(
                  'Currently spending',
                  wageBcurrentlySpending,
                ),
                buildFinancialSubRow(
                  'Wage budget available',
                  widget.team.wageBudget! - wageBcurrentlySpending,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding buildFinancialSubRow(String text, int number) {
    return Padding(
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          Text(
            '${fV.format(number)} ${currencyOptions[currency]}',
            style: TextStyle(
              color: number < 0 ? Colors.red : kTextColor,
            ),
          ),
        ],
      ),
    );
  }

  Row buildFinancialRow(IconData icon, String text, int number) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildFinancialLabel(icon, text),
        Text(
          '${fV.format(number)} ${currencyOptions[currency]}',
          style: TextStyle(
            color: number < 0 ? Colors.red : Colors.black,
            fontSize: getProportionateScreenWidth(14),
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }

  Row buildFinancialLabel(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: getProportionateScreenWidth(5)),
        Text(
          text,
          style: TextStyle(
            color: Colors.black87,
            fontSize: getProportionateScreenWidth(16),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
