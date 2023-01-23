import 'package:flutter/material.dart';
import 'package:myfm_app/screens/home/components/fm_banner.dart';
import 'package:myfm_app/screens/home/components/home_header.dart';
import 'package:myfm_app/size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenWidth(10)),
          const HomeHeader(),
          SizedBox(height: getProportionateScreenWidth(20)),
          const FmBanner()
        ],
      ),
    );
  }
}


