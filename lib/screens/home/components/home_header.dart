import 'package:flutter/material.dart';
import 'package:myfm_app/components/custom_icon_btn.dart';
import 'package:myfm_app/screens/home/components/search_field.dart';
import 'package:myfm_app/size_config.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          SearchField(),
          CustomIconBtn(icon: Icons.playlist_add_rounded),
        ],
      ),
    );
  }
}