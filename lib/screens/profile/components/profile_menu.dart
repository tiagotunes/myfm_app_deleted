import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myfm_app/size_config.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  // final IconData icon;
  final String icon;
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
          onPressed: press,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(20),
            backgroundColor: const Color(0xFFF5F6F9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                width: getProportionateScreenWidth(26),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const Icon(Icons.arrow_forward_ios_outlined, size: 17),
            ],
          )),
    );
  }
}
