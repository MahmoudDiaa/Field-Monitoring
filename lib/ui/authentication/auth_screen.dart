import 'package:Field_Monitoring/ui/authentication/signup_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/enums.dart';
import '../../stores/language/language_store.dart';
import '../constants/colors.dart';
import 'change_password_widget.dart';
import 'login_widget.dart';

class AuthenticationScreen extends StatefulWidget {
  AuthScreenMode authScreenMode;

  String? initialPassword;
  String? initialUserName;

  AuthenticationScreen(
      {required this.authScreenMode,
      this.initialUserName,
      this.initialPassword});

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  // ignore: close_sinks
  late LanguageStore _languageStore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.primaryColor,
        body: WillPopScope(
          onWillPop: () async => false,
          child: widget.authScreenMode == AuthScreenMode.Login
              ? LoginFormWidget(
                  initialUserName: widget.initialUserName,
                  initialPassword: widget.initialPassword,
                )
              : widget.authScreenMode == AuthScreenMode.SignUp
                  ? SignUpFormWidget()
                  : widget.authScreenMode == AuthScreenMode.ChangePassword
                      ? ChangePasswordFormWidget()
                      : Text('No Auth Screen Mode!'),
        ));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _languageStore = Provider.of<LanguageStore>(context);
  }
}
