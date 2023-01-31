import 'package:flutter/material.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/size_config.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
    required this.isSelected,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final VoidCallback press;
  final bool isSelected;

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
                color: kPrimaryColor,
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                text,
                style: TextStyle(
                  color: isSelected
                      ? kPrimaryColor
                      : kPrimaryColor.withOpacity(0.8),
                  fontSize: getProportionateScreenWidth(16),
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
