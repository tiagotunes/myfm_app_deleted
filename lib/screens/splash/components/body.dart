import 'package:flutter/material.dart';
import 'package:myfm_app/components/default_button.dart';
import 'package:myfm_app/constants.dart';
import 'package:myfm_app/models/user_model.dart';
import 'package:myfm_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:myfm_app/screens/home/home_screen.dart';
import 'package:myfm_app/screens/splash/components/splash_content.dart';
import 'package:myfm_app/services/database_helper.dart';
import 'package:myfm_app/size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<User>? users;

  @override
  void initState() {
    super.initState();
    checkUsers();
  }

  Future checkUsers() async {
    users = await DatabaseHelper.getAllUsers();
  }

  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to My FM, let's get started!",
      "image": "assets/images/splash18.png"
    },
    {
      "text": "Build your team and manage it from your pocket.",
      "image": "assets/images/splash15.png"
    },
    {
      "text": "The beautiful game it's in your hands!",
      "image": "assets/images/splash16.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  text: splashData[index]["text"]!,
                  image: splashData[index]["image"]!,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: [
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index),
                      ),
                    ),
                    const Spacer(flex: 3),
                    DefaultButton(
                      text: 'Continue',
                      press: () {
                        // print(users!.isEmpty);
                        if (users != null && users!.isNotEmpty) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            HomeScreen.routeName,
                            ModalRoute.withName('/'),
                            arguments: {'user': users![0]},
                          );
                        } else {
                          Navigator.pushNamed(
                            context,
                            CompleteProfileScreen.routeName,
                          );
                        }
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5.0),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3.0),
      ),
    );
  }
}
