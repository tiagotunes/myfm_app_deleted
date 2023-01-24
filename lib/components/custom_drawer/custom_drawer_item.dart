import 'package:flutter/material.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/size_config.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenHeight(15)),
        child: Row(
          children: [
            Expanded(
              child: Icon(
                icon,
                size: getProportionateScreenWidth(25),
                color: kPrimaryColor.withOpacity(0.8),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                text,
                style: TextStyle(
                    color: kPrimaryColor.withOpacity(0.6),
                    fontSize: getProportionateScreenWidth(16),
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
