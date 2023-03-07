import 'package:Field_Monitoring/stores/language/language_store.dart';
import 'package:Field_Monitoring/stores/user/user_store.dart';
import 'package:Field_Monitoring/ui/constants/colors.dart';
import 'package:Field_Monitoring/utils/device/device_utils.dart';
import 'package:Field_Monitoring/widets_new/home/home_incedent_list_item/HomeIncednetListItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/enums.dart';
import '../../constants/images.dart';
import '../../data/sharedpref/shared_preference_helper.dart';
import '../../models/dashboard/dashboard.dart';
import '../../stores/incident/created_incident/created_incident_store.dart';
import '../../utils/routes/routes.dart';

class HomeScreenNew extends StatefulWidget {
  const HomeScreenNew({Key? key}) : super(key: key);

  @override
  State<HomeScreenNew> createState() => _HomeScreenNewState();
}

class _HomeScreenNewState extends State<HomeScreenNew> {
  late LanguageStore _languageStore;
  late UserStore _userStore;
  SharedPreferenceHelper? sharedPreferenceHelper;
  late CreatedIncidentStore _incidentStore;
  List<DashboardWidgets> userPermissions = [
    DashboardWidgets.Created,
    DashboardWidgets.Supervised,
    DashboardWidgets.Assigned
  ];

  IncidentStatusEnum statusEnum = IncidentStatusEnum.Upped;

  @override
  void initState() {
    super.initState();
  } //map for set test data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //appbar
                        Row(
                          children: [
                            //todo un comment this
                            // _languageStore.language.localeName == 'ar'
                            //     ? SvgPicture.asset(homeMenuAr)
                            //     : SvgPicture.asset(homeMenu),
                            InkWell(
                                child: Icon(
                                  Icons.logout,
                                  color: Colors.white,
                                ),
                                onTap: () {
                                  SharedPreferences.getInstance()
                                      .then((preference) {
                                    _userStore.logout();
                                    Navigator.of(context)
                                        .pushReplacementNamed(Routes.login);
                                  });
                                }),
                            Spacer(),
                            Column(
                              children: [
                                Text(
                                  "منصة معالجة التشوه البصري",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(color: Colors.white),
                                ),
                                Text(
                                  "أمانة منطقة حائل",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                            Spacer(),
                            Stack(
                              children: [
                                SvgPicture.asset(homeNotification),
                                Positioned(
                                  left: 12,
                                  bottom: 14,
                                  child: new Container(
                                    decoration: new BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    constraints: BoxConstraints(
                                      minWidth: 14,
                                      minHeight: 14,
                                    ),
                                    child: Text(
                                      '12',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.symmetric(
                              horizontal: 12),
                          child: Text(
                            _languageStore.language.welcome,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(color: Colors.white),
                          ),
                        ),

                        Row(
                          children: [
                            SvgPicture.asset(homeProfile, width: 70),
                            Wrap(
                              verticalDirection: VerticalDirection.down,
                              spacing: 0,
                              runSpacing: 0,
                              direction: Axis.vertical,
                              children: [
                                Text(
                                  "${sharedPreferenceHelper?.authUser?.user?.fullName ?? sharedPreferenceHelper?.authUser?.user?.userName}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  maxLines: 1,
                                ),
                                Text(
                                  "${sharedPreferenceHelper?.authUser?.user?.roles}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          color: Colors.white, height: 0.8),
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(splashScreenBackground),
                        fit: BoxFit.fill)),
              ),
              flex: 3,
            ),
            Observer(
                builder: (BuildContext context) => !_incidentStore.loading
                    ? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(18, 50, 18, 0),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 25),
                                  child: _userStore
                                          .getUser()
                                          .isHasAssignedPermission()
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Spacer(),
                                            InkWell(
                                              onTap: () => setState(() =>
                                                  statusEnum =
                                                      IncidentStatusEnum.Upped),
                                              child: Text(
                                                _languageStore
                                                    .language.reopenedIncident,
                                                style: isReopened()
                                                    ? Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge
                                                        ?.copyWith(
                                                            letterSpacing: 1,
                                                            shadows: [
                                                              Shadow(
                                                                  color: Colors
                                                                      .black,
                                                                  offset:
                                                                      Offset(0,
                                                                          -10))
                                                            ],
                                                            color: Colors
                                                                .transparent,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            decorationColor:
                                                                CustomColor
                                                                    .lightGreenColor,
                                                            decorationThickness:
                                                                5,
                                                            decorationStyle:
                                                                TextDecorationStyle
                                                                    .solid)
                                                    : Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium,
                                              ),
                                            ),
                                            Spacer(),
                                            InkWell(
                                              onTap: () => setState(() =>
                                                  statusEnum =
                                                      IncidentStatusEnum
                                                          .Solved),
                                              child: Text(
                                                _languageStore
                                                    .language.acceptedIncident,
                                                style: isSolved()
                                                    ? Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge
                                                        ?.copyWith(
                                                            letterSpacing: 1,
                                                            shadows: [
                                                              Shadow(
                                                                  color: Colors
                                                                      .black,
                                                                  offset:
                                                                      Offset(0,
                                                                          -10))
                                                            ],
                                                            color: Colors
                                                                .transparent,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            decorationColor:
                                                                CustomColor
                                                                    .lightGreenColor,
                                                            decorationThickness:
                                                                5,
                                                            decorationStyle:
                                                                TextDecorationStyle
                                                                    .solid)
                                                    : Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium,
                                              ),
                                            ),
                                            Spacer()
                                          ],
                                        )
                                      : Row(
                                          children: [
                                            Text(
                                              _languageStore
                                                  .language.ownedIncidents,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall
                                                  ?.copyWith(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Spacer(),
                                            Text(
                                              _languageStore.language.seeMore,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall
                                                  ?.copyWith(
                                                      color: Colors.black,
                                                      decoration: TextDecoration
                                                          .underline),
                                            )
                                          ],
                                        ),
                                ),
                                Container(
                                  constraints: BoxConstraints(
                                      minHeight: 300, maxHeight: 350),
                                  alignment: Alignment.bottomCenter,
                                  child: ListView.builder(
                                      itemCount: _incidentStore
                                          .incidentList!.incidents!.length,
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemBuilder: (BuildContext context,
                                              int index) =>
                                          (_incidentStore
                                                              .incidentList!
                                                              .incidents![index]
                                                              .status ==
                                                          statusEnum &&
                                                      _userStore
                                                          .getUser()
                                                          .isHasAssignedPermission()) ||
                                                  _userStore
                                                      .getUser()
                                                      .isHasCreatedPermission()
                                              ? HomeIncidentListItem(
                                                  image: splashScreenBackground,
                                                  languageStore: _languageStore,
                                                  date: _incidentStore
                                                      .incidentList!
                                                      .incidents![index]
                                                      .createDate
                                                      .toString()
                                                      .split(' ')[0],
                                                  notes: _incidentStore
                                                          .incidentList!
                                                          .incidents![index]
                                                          .notes ??
                                                      "لا يوجد",
                                                  section: _incidentStore
                                                          .incidentList!
                                                          .incidents![index]
                                                          .incidentSubCategoryArabicName ??
                                                      "",
                                                )
                                              : SizedBox()),
                                ),
                              ],
                            ),
                          ),
                        ),
                        flex: 6,
                      )
                    : CircularProgressIndicator())
          ],
        ),
        Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            left: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      CustomColor.midGreenColor,
                      CustomColor.darkGreenColor,
                    ],
                  )),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(homeDocument),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 175,
                            child: _userStore.getUser().isHasCreatedPermission()
                                ? Text(
                                    _languageStore.language.incidentCount,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                    maxLines: 2,
                                  )
                                : Column(
                                    children: [
                                      Text(
                                        _languageStore.language.yourProgress,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                      ),
                                      LinearPercentIndicator(
                                        lineHeight: 10,
                                        backgroundColor:
                                            CustomColor.darkGreenColor,
                                        progressColor:
                                            CustomColor.moreLightGreenColor,
                                        percent: 0.5,
                                        isRTL: true,
                                        barRadius: Radius.circular(12),
                                      )
                                    ],
                                  ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                  color: Colors.grey.withOpacity(0.8),
                                ),
                                left: BorderSide(
                                    color: Colors.grey.withOpacity(0.8)),
                                bottom: BorderSide(
                                    color: Colors.grey.withOpacity(0.8)),
                                right: BorderSide(
                                    color: Colors.grey.withOpacity(0.8))),
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            width: 65,
                            height: 65,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                    color: Colors.white,
                                  ),
                                  left: BorderSide(color: Colors.white),
                                  bottom: BorderSide(color: Colors.white),
                                  right: BorderSide(color: Colors.white)),
                              shape: BoxShape.circle,
                            ),
                            child: _userStore.getUser().isHasCreatedPermission()
                                ? Text(
                                    '25',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  )
                                : Text(
                                    '50%',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ),
            ))
      ]),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 8, 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.all(8.0),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: RawMaterialButton(
                    onPressed: () {},
                    shape: CircleBorder(),
                    child: SvgPicture.asset(homeBottomBarChartDots),
                  ),
                ),
                Text(
                  _languageStore.language.myReports,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black),
                )
              ],
            ),
          ),
          Spacer(),
          _userStore.getUser().isHasCreatedPermission()
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: CustomColor.lightGreenColor,
                        shape: BoxShape.circle,
                      ),
                      child: RawMaterialButton(
                        onPressed: () => Navigator.of(context)
                            .pushNamed(Routes.incidentFormStep1),
                        shape: CircleBorder(),
                        child: SvgPicture.asset(homeBottomBarFilePlus),
                      ),
                    ),
                    Text(
                      _languageStore.language.newIncident,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )
                  ],
                )
              : SizedBox(),
          Spacer(),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 30, 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.all(8.0),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: RawMaterialButton(
                    onPressed: () => Navigator.of(context).pushNamed(Routes.map,
                        arguments: {"userPermissions": userPermissions}),
                    shape: CircleBorder(),
                    child: SvgPicture.asset(homeBottomBarLocation),
                  ),
                ),
                Text(
                  _languageStore.language.incidentMap,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() async {
    sharedPreferenceHelper = GetIt.instance<SharedPreferenceHelper>();

    super.didChangeDependencies();
    _languageStore = Provider.of<LanguageStore>(context);
    _incidentStore = Provider.of<CreatedIncidentStore>(context);
    _userStore = Provider.of<UserStore>(context);
    if (!_incidentStore.loading) {
      _incidentStore.getIncidents();
    }
  }

  bool isSolved() => statusEnum == IncidentStatusEnum.Solved;

  bool isReopened() => statusEnum == IncidentStatusEnum.Upped;
}
