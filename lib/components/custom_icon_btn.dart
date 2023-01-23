import 'package:flutter/material.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/size_config.dart';

class CustomIconBtn extends StatelessWidget {
  final IconData icon;
  const CustomIconBtn({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(46),
      height: getProportionateScreenWidth(46),
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        shape: BoxShape.circle,
        // borderRadius: BorderRadius.circular(15),
      ),
      child: IconButton(
        icon: Icon(icon),
        onPressed: () {},
      ),
    );
  }
}
