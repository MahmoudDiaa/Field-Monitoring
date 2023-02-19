import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                    'assets/images/splash/splash_background.png',
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

}
