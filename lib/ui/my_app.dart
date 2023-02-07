import 'package:boilerplate/constants/strings.dart';
import 'package:boilerplate/data/repository.dart';
import 'package:boilerplate/di/components/service_locator.dart';
import 'package:boilerplate/stores/category/category_store.dart';
import 'package:boilerplate/stores/incident/assigned_incident/assigned_incident_store.dart';
import 'package:boilerplate/stores/incident/created_incident/created_incident_store.dart';
import 'package:boilerplate/stores/language/language_store.dart';
import 'package:boilerplate/stores/theme/theme_store.dart';
import 'package:boilerplate/stores/user/user_store.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../data/respository/category_repository.dart';
import '../data/respository/incident_repository.dart';
import '../data/respository/priority_repository.dart';
import '../data/respository/subcategory_repository.dart';
import '../data/respository/user_repository.dart';
import '../stores/incident/supervised_incident/supervised_incident_store.dart';
import '../stores/incident_form/incident_form_store.dart';
import '../stores/priority/priority_store.dart';
import '../stores/subcategory/subcategory_store.dart';
import 'constants/colors.dart';
import 'splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // Create your store as a final variable in a base Widget. This works better
  // with Hot Reload than creating it directly in the `build` function.
  final ThemeStore _themeStore = ThemeStore(getIt<Repository>());

  // final PostStore _postStore = PostStore(getIt<Repository>());
  final CategoryStore _categoryStore =
      CategoryStore(getIt<CategoryRepository>());
  final SubCategoryStore _subcategoryStore =
      SubCategoryStore(getIt<SubCategoryRepository>());

  final LanguageStore _languageStore = LanguageStore(getIt<Repository>());
  final UserStore _userStore = UserStore(getIt<UserRepository>());
  final PriorityStore _priorityStore =
      PriorityStore(getIt<PriorityRepository>());

  //todo remove this as we replace it with three another stores
  // final IncidentStore _incidentStore =
  //     IncidentStore(getIt<IncidentRepository>());
  final CreatedIncidentStore _createdIncidentStore =
      CreatedIncidentStore(getIt<IncidentRepository>());
  final AssignedIncidentStore _assignedIncidentStore =
      AssignedIncidentStore(getIt<IncidentRepository>());
  final SupervisedIncidentStore _supervisedIncidentStore =
      SupervisedIncidentStore(getIt<IncidentRepository>());
  final IncidentFormStore _incidentFormStore =
      IncidentFormStore(getIt<IncidentRepository>());

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ThemeStore>(create: (_) => _themeStore),
        // Provider<PostStore>(create: (_) => _postStore),
        Provider<CategoryStore>(create: (_) => _categoryStore),
        Provider<SubCategoryStore>(create: (_) => _subcategoryStore),
        Provider<LanguageStore>(create: (ctx) => _languageStore),
        Provider<UserStore>(create: (_) => _userStore),
        Provider<PriorityStore>(create: (_) => _priorityStore),
        Provider<CreatedIncidentStore>(create: (_) => _createdIncidentStore),
        Provider<AssignedIncidentStore>(create: (_) => _assignedIncidentStore),
        Provider<SupervisedIncidentStore>(
            create: (_) => _supervisedIncidentStore),
        Provider<IncidentFormStore>(create: (_) => _incidentFormStore),
      ],
      child: Observer(
        name: 'global-observer',
        builder: (BuildContext context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: Strings.appName,
            // theme: _themeStore.darkMode
            //     ? AppThemeData.darkThemeData
            //     : AppThemeData.lightThemeData,
            onGenerateTitle: (ctx){
              _languageStore.init(ctx);
              return'';
            },locale: Locale(_languageStore.locale),
            theme: ThemeData(
                primaryColor: CustomColor.primaryColor,
                fontFamily: 'Montserrat'),
            routes: Routes.routes,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            //home: _userStore.isLoggedIn ? CategoryListPage() : LoginScreen(),
            home: SplashScreen2(),
          );
        },
      ),
    );
  }
}
