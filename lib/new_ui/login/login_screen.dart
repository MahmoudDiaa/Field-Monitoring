import 'package:Field_Monitoring/components/default_button.dart';
import 'package:Field_Monitoring/stores/language/language_store.dart';
import 'package:Field_Monitoring/ui/constants/colors.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/default_text_form_field.dart';
import '../../constants/images.dart';
import '../../data/respository/user_repository.dart';
import '../../data/sharedpref/constants/preferences.dart';
import '../../stores/login_form/login_form_store.dart';
import '../../utils/device/device_utils.dart';
import '../../utils/routes/routes.dart';
import '../../widgets/progress_indicator/progress_indicator_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
  late LanguageStore _languageStore;

  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

//focus node:-----------------------------------------------------------------
  late FocusNode _passwordFocusNode;

  //stores:---------------------------------------------------------------------
  final _store = LoginFormStore(GetIt.instance<UserRepository>());

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _languageStore = Provider.of<LanguageStore>(context);
  }

  @override
  void dispose() {
    _userEmailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Form(
              key: _key,
              child: Container(
                color: Colors.grey[200],
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                          child: Stack(alignment: Alignment.center, children: [
                        Image.asset(
                          splashScreenBackground2,
                          fit: BoxFit.fill,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'مـــن أجـــل بــيــئــة أفــضــل',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            Text(
                              'For Better Environment',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.white),
                            ),
                          ],
                        )
                      ])),
                      flex: 1,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 80),
                            child: Column(
                              children: [
                                Text(
                                  _languageStore.language.login,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                defaultTextFormField(
                                    textHint:
                                        "     ${_languageStore.language.login_et_user_email}",
                                    prefixIcon: Icons.mail_outline_rounded,
                                    controller: _userEmailController,
                                    textInputType: TextInputType.emailAddress,
                                    onChanged: (value) => _store
                                        .setUserId(_userEmailController.text.trim()),
                                    validate: (value) {
                                      if (value == null ||
                                          value.toString().isEmpty)
                                        return _store.formErrorStore.userEmail;
                                      return null;
                                    }),
                                SizedBox(
                                  height: 10,
                                ),
                                //password text form
                                defaultTextFormField(
                                  textHint:
                                      "     ${_languageStore.language.login_et_user_password}",
                                  prefixIcon: Icons.lock_outline_rounded,
                                  controller: _passwordController,
                                  textInputAction: TextInputAction.done,
                                  textInputType: TextInputType.visiblePassword,
                                  onChanged: (value) => _store
                                      .setPassword(_passwordController.text),
                                  obscure: true,
                                  focusNode: _passwordFocusNode,
                                  validate: (value) {
                                    if (value == null ||
                                        value.toString().isEmpty)
                                      return _store.formErrorStore.password;
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child:
                                      //login button
                                      defaultButton(
                                          label: _languageStore.language.login,
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(color: Colors.white),
                                          color: CustomColor.midGreenColor,
                                          onPressed: () {
                                            if (_store.canLogin) {
                                              DeviceUtils.hideKeyboard(context);
                                              _store.login();
                                            } else {
                                              _showErrorMessage(_languageStore
                                                  .language
                                                  .login_error_fill_fields);
                                            }
                                          }),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                //for navigate to the dashboard if login success
                                Observer(
                                  builder: (context) {
                                    return _store.success
                                        ? navigate(context)
                                        : _showErrorMessage(
                                            _store.errorStore.errorMessage);
                                  },
                                ),
                                //for show circular indicator
                                Observer(
                                  builder: (context) {
                                    return Visibility(
                                      visible: _store.loading,
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(_languageStore.language.forgetPassword),
                                Text(
                                  "copyright © orbits 2023",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      flex: 3,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 550,
                top: 160,
                width: 100,
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
                )
                // RawMaterialButton(
                //     onPressed: null,
                //     child: CarouselSlider(
                //       items: images,
                //       options: CarouselOptions(
                //           autoPlay: true,
                //           scrollPhysics: NeverScrollableScrollPhysics()),
                //     ),
                //     shape: CircleBorder(),
                //     fillColor: Colors.white),
                ),
          ],
        ),
      ),
    );
  }

  //helper widgets
  _showErrorMessage(String message) {
    if (message.isNotEmpty) {
      Future.delayed(Duration(milliseconds: 0), () {
        if (message.isNotEmpty) {
          FlushbarHelper.createError(
            message: message,
            title: _languageStore.language.home_tv_error,
            duration: Duration(seconds: 3),
          )..show(context);
        }
      });
    }

    return SizedBox.shrink();
  }

  Widget navigate(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool(Preferences.is_logged_in, true);
    });

    Future.delayed(Duration(milliseconds: 0), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.home, (Route<dynamic> route) => false);
    });

    return Container();
  }
}
