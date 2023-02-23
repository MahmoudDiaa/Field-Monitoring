import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/sharedpref/constants/preferences.dart';
import '../../utils/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var images = [
    SvgPicture.asset(
      'assets/images/splash/splash_screen_leaf.svg',
    ),
    SvgPicture.asset(
      'assets/images/splash/splash_screen_building.svg',
    ),
    SvgPicture.asset(
      'assets/images/splash/splash_screen_location.svg',
    ),
  ];

  @override
  void initState() {
    super.initState();
  startTimer();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                      child: Image.asset(
                        'assets/images/background_new.jpeg',
                    fit: BoxFit.fitHeight,
                  )),
                  flex: 3,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'مـــن أجـــل بــيــئــة أفــضــل',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'For Better Environment',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w100),
                      )
                    ],
                  ),
                  flex: 2,
                )
              ],
            ),
            Container(
              height: 100,
              width: 100,
              margin: EdgeInsets.only(top: 150),
              child: RawMaterialButton(
                  onPressed: null,
                  child: CarouselSlider(
                    items: images,
                    options: CarouselOptions(
                        autoPlay: true,
                        scrollPhysics: NeverScrollableScrollPhysics()),
                  ),
                  shape: CircleBorder(),
                  fillColor: Colors.white),
            )
          ],
        ),
      ),
    );
  }
  startTimer() {
    var _duration = Duration(milliseconds: 2000);
    return Timer(_duration, navigate);
  }
  navigate() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (preferences.getBool(Preferences.is_logged_in) ?? false) {
      Navigator.of(context).pushReplacementNamed(Routes.dashboard);
    } else {
      Navigator.of(context).pushReplacementNamed(Routes.login);
    }
  }
}
