import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomProgressIndicatorTextWidget extends StatelessWidget {
  String? message;

  CustomProgressIndicatorTextWidget({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    this.message =
        this.message ?? AppLocalizations.of(context)!.loading;
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 100,

        child: Center(
          child: Text(message ?? ''),
        ),
        //decoration: BoxDecoration(color: Color.fromARGB(100, 105, 105, 105)),
      ),
    );
  }
}
