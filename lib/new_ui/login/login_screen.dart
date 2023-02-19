import 'package:Field_Monitoring/components/default_button.dart';
import 'package:Field_Monitoring/stores/language/language_store.dart';
import 'package:Field_Monitoring/ui/constants/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../components/default_text_form_field.dart';

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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _languageStore = Provider.of(context);
  }

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              color: Colors.grey[200],
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                        child: Stack(alignment: Alignment.center, children: [
                      Image.asset(
                        'assets/images/splash/splash_background.png',
                        fit: BoxFit.fitWidth,
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
                          )
                        ],
                      )
                    ])),
                    flex: 2,
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
                                controller: mailController,
                                textInputType: TextInputType.emailAddress,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              defaultTextFormField(
                                textHint:
                                    "     ${_languageStore.language.login_et_user_password}",
                                prefixIcon: Icons.lock_outline_rounded,
                                controller: passwordController,
                                textInputType: TextInputType.visiblePassword,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: defaultButton(
                                    label: _languageStore.language.login,
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(color: Colors.white),
                                    color: CustomColor.greenColor),
                              ),
                              SizedBox(
                                height: 30,
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
            Container(
              height: 100,
              width: 100,
              margin: MediaQuery.of(context).viewInsets.bottom == 0
                  ? EdgeInsets.only(
                      top: (MediaQuery.of(context).size.height -
                              MediaQuery.of(context).padding.top -
                              MediaQuery.of(context).padding.bottom) /
                          3)
                  : EdgeInsets.only(
                      top: (MediaQuery.of(context).size.height -
                              MediaQuery.of(context).padding.top -
                              MediaQuery.of(context).padding.bottom) /
                          7),
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
