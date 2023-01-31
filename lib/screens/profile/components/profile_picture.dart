import 'package:flutter/material.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/size_config.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(110),
      width: getProportionateScreenWidth(110),
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('assets/images/default_user.png'),
          ),
          Positioned(
            right: -10,
            bottom: 0,
            child: SizedBox(
                height: getProportionateScreenWidth(45),
                width: getProportionateScreenWidth(45),
                child: FittedBox(
                  child: FloatingActionButton(
                    elevation: 2,
                    backgroundColor: const Color(0xFFF5F6F9),
                    onPressed: () {},
                    child: const Icon(
                      Icons.image,
                      color: kSecondaryColor,
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}