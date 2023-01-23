import 'package:flutter/material.dart';
import 'package:myfm_app/constants.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 115,
          width: 115,
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/default_user.png'),
              ),
              Positioned(
                right: -12,
                bottom: 0,
                child: SizedBox(
                    height: 46,
                    width: 46,
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
        )
      ],
    );
  }
}
