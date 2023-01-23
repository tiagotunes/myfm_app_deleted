import 'package:flutter/material.dart';
import 'package:myfm_app/enums.dart';
import 'package:myfm_app/size_config.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectMenu,
  }) : super(key: key);

  final MenuState selectMenu;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 14,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -7),
              blurRadius: 10,
              color: Color(0xFFDADADA),
            ),
            BoxShadow(
              offset: Offset(0, 7),
              blurRadius: 10,
              color: Color(0xFFDADADA),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: MenuState.home == selectMenu
                    ? const Icon(Icons.home, size: 28)
                    : const Icon(Icons.home_outlined, size: 28),
              ),
              IconButton(
                onPressed: () {},
                icon: MenuState.teams == selectMenu
                    ? const Icon(Icons.shield, size: 28)
                    : const Icon(Icons.shield_outlined, size: 28),
              ),
              IconButton(
                onPressed: () {},
                icon: MenuState.favorite == selectMenu
                    ? const Icon(Icons.favorite, size: 28)
                    : const Icon(Icons.favorite_outline, size: 28),
              ),
              IconButton(
                onPressed: () {},
                icon: MenuState.profile == selectMenu
                    ? const Icon(Icons.person, size: 28)
                    : const Icon(Icons.person_outline, size: 28),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
