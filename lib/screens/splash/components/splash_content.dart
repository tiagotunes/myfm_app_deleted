import 'package:flutter/material.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          "My FM",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(text),
        const Spacer(flex: 2),
        // Container(
        //   width: getProportionateScreenWidth(220),
        //   height: getProportionateScreenHeight(330),
        //   decoration: BoxDecoration(
        //     image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
        //     borderRadius: const BorderRadius.all(Radius.circular(18.0)),
        //   ),
        // ),
        Image.asset(
          image,
          height: getProportionateScreenHeight(300),
        )
      ],
    );
  }
}