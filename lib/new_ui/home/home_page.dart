import 'package:Field_Monitoring/stores/language/language_store.dart';
import 'package:Field_Monitoring/stores/user/user_store.dart';
import 'package:Field_Monitoring/ui/constants/colors.dart';
import 'package:Field_Monitoring/widets_new/home/home_incedent_list_item/HomeIncednetListItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  //map for set test data
  var dummy = ["حفر شوارع", "حفر شوارع2"];

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
                            InkWell(child: Icon(Icons.logout,color: Colors.white,),onTap: (){
                              SharedPreferences.getInstance().then((preference) {
                                _userStore.logout();
                                Navigator.of(context).pushReplacementNamed(Routes.login);
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
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Row(
                                    children: [
                                      Text(
                                        _languageStore.language.ownedIncidents,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                      ),
                                      Spacer(),
                                      Text(
                                        _languageStore.language.seeMore,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                color: Colors.black,
                                                decoration:
                                                    TextDecoration.underline),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  constraints: BoxConstraints(
                                      minHeight: 300, maxHeight: 370),
                                  alignment: Alignment.bottomCenter,
                                  child: ListView.builder(
                                      itemCount: _incidentStore
                                          .incidentList!.incidents!.length,
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, int index) =>
                                              HomeIncidentListItem(
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
                                              )),
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
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(homeDocument),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _languageStore.language.incidentCount,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Colors.white),
                          ),
                          Text(
                            _languageStore.language.yourCurrentIncidents,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 90,height: 90,
                          alignment: Alignment.center,

                          decoration: BoxDecoration(

                            border: Border(
                                top: BorderSide(color: Colors.grey.withOpacity(0.8),),
                                left: BorderSide(color: Colors.grey.withOpacity(0.8)),
                                bottom: BorderSide(color: Colors.grey.withOpacity(0.8)),
                                right: BorderSide(color: Colors.grey.withOpacity(0.8))),
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            width: 65,height: 65,
                            alignment: Alignment.center,

                            decoration: BoxDecoration(

                                border: Border(
                                    top: BorderSide(color: Colors.white,),
                                    left: BorderSide(color: Colors.white),
                                    bottom: BorderSide(color: Colors.white),
                                    right: BorderSide(color: Colors.white)),
                                shape: BoxShape.circle,
                               ),
                            child: Text(
                              '25',
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
          Column(
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
                  onPressed: () =>
                      Navigator.of(context).pushNamed(Routes.incidentFormStep1),
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
          ),
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
  void didChangeDependencies() {
    sharedPreferenceHelper = GetIt.instance<SharedPreferenceHelper>();

    super.didChangeDependencies();
    _languageStore = Provider.of<LanguageStore>(context);
    _incidentStore = Provider.of<CreatedIncidentStore>(context);
    _userStore = Provider.of<UserStore>(context);
    if (!_incidentStore.loading) {
      _incidentStore.getIncidents();
    }
  }
}
