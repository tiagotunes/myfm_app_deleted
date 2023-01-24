import 'package:flutter/material.dart';
import 'package:myfm_app/size_config.dart';

class SearchScreen extends StatelessWidget {
  static String routeName = '/search';
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: TextField(
              onChanged: (value) {
                // TBD
              },
              decoration: InputDecoration(
                hintText: 'Search',
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                prefixIcon: const Icon(Icons.search_sharp),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {},
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenHeight(9),
                ),
                filled: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
