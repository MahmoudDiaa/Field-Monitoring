import 'dart:async';

import 'package:Field_Monitoring/constants/assets.dart';
import 'package:Field_Monitoring/data/sharedpref/constants/preferences.dart';
import 'package:Field_Monitoring/utils/routes/routes.dart';
import 'package:Field_Monitoring/widgets/app_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      child: Center(child: AppIconWidget(image: Assets.appLogo)),
    );
  }

  startTimer() {
    var _duration = Duration(milliseconds: 2000);
    return Timer(_duration, navigate);
  }

  navigate() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (preferences.getBool(Preferences.is_logged_in) ?? false) {
      Navigator.of(context).pushReplacementNamed(Routes.categoryList);
    } else {
      Navigator.of(context).pushReplacementNamed(Routes.login);
    }
  }
}
