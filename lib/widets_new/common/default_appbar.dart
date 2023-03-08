import 'package:easy_stepper/easy_stepper.dart';

import '../../ui/constants/colors.dart';

AppBar defaultAppBar(String title)=>AppBar(
actions: [
Padding(
padding: const EdgeInsets.all(8.0),
child: Icon(Icons.close),
)
],
title: Text(title),
toolbarHeight: 100,
backgroundColor: CustomColor.primaryColor);