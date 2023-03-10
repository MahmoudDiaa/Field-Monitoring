import 'package:Field_Monitoring/new_ui/add_incident/add_new_incident_home/add_new_incident_home.dart';
import 'package:Field_Monitoring/new_ui/home/home_page.dart';
import 'package:Field_Monitoring/new_ui/incident_details/incident_details.dart';
import 'package:Field_Monitoring/new_ui/login/login_screen.dart';
import 'package:Field_Monitoring/new_ui/splash_screen/splash_screen.dart';
import 'package:Field_Monitoring/ui/dashboard/dashboard_screen.dart';
import 'package:Field_Monitoring/ui/notifcations/notifcations.dart';
import 'package:Field_Monitoring/ui/profile/profile.dart';
import 'package:Field_Monitoring/ui/reports/reports.dart';
import 'package:Field_Monitoring/ui/sdad/incident_finally_sdad_screen.dart';
import 'package:Field_Monitoring/ui/sdad/incident_sdad_screen.dart';
import 'package:flutter/material.dart';

import '../../constants/enums.dart';
import '../../ui/authentication/auth_screen.dart';
import '../../ui/home/categories.dart';
import '../../ui/incidents/created_incidents/created_incident_list_screen.dart';
import '../../widgets/incident/incidents_map.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String incidentDetails = '/incidentDetails';

  static const String home = '/home';
  static const String categoryList = '/categoryList';
  static const String createdIncident = '/createdIncident';
  static const String incidentFormStep1 = '/incidentFormStep1';
  static const String dashboard = '/dashboard';
  static const String report = '/report';
  static const String profile = '/profile';
  static const String notification = '/notification';
  static const String notificationDetails = '/notificationDetails';
  static const String changePassword = '/changePassword';
  static const String sdadScreen = '/sdadScreen';
  static const String finallysdadScreen = '/finallySdadScreen';
  static const String map = '/map';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    // AuthenticationScreen(authScreenMode: AuthScreenMode.Login),
    signup: (BuildContext context) => AuthenticationScreen(
          authScreenMode: AuthScreenMode.SignUp,
        ),
    changePassword: (BuildContext context) => AuthenticationScreen(
          authScreenMode: AuthScreenMode.ChangePassword,
        ),
    home: (BuildContext context) => HomeScreenNew(),
    categoryList: (BuildContext context) => CategoryListPage(),
    // incidentFormStep1: (BuildContext context) => IncidentFormStep1(),
    incidentFormStep1: (BuildContext context) => AddNewIncidentHome(),
    dashboard: (BuildContext context) => DashboardScreen(),
    sdadScreen: (BuildContext context) => IncidentSdadScreen(),
    finallysdadScreen: (BuildContext context) => IncidentFinallySdadScreen(),
    report: (BuildContext context) => ReportScreen(),
    profile: (BuildContext context) => Profile(),
    notification: (BuildContext context) => Notifications(),
    createdIncident: (BuildContext context) => CreatedIncidentListScreen(),
    map: (_) => IncidentsMap(),
    incidentDetails:(_)=>IncidentDetailsScreen(),
  };
}
