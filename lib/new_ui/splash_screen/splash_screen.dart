import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/images.dart';
import '../../data/sharedpref/constants/preferences.dart';
import '../../utils/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var images = [
    SvgPicture.asset(splashScreenLeaf),
    SvgPicture.asset(splashScreenBuilding),
    SvgPicture.asset(splashScreenLocation),
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
                    splashScreenBackground,
                    fit: BoxFit.fitHeight,
                  )),
                  flex: 3,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'منصة معالجة التشوة البصري',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
  Text(
                        'حائل الأجمل',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),

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
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage(logo),
                        fit: BoxFit.contain,
                        alignment: Alignment.center),
                    borderRadius: BorderRadius.circular(50)),
              ),
              // child: RawMaterialButton(
              //     onPressed: null,
              //     child: CarouselSlider(
              //       items: images,
              //       options: CarouselOptions(
              //           autoPlay: true,
              //           scrollPhysics: NeverScrollableScrollPhysics()),
              //     ),
              //     shape: CircleBorder(),
              //     fillColor: Colors.white),
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
      Navigator.of(context).pushReplacementNamed(Routes.home);
    } else {
      Navigator.of(context).pushReplacementNamed(Routes.login);
    }
  }
}
