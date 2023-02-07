import 'package:boilerplate/data/local/database.dart';
import 'package:boilerplate/data/network/apis/incident/incident_api.dart';
import 'package:boilerplate/data/network/apis/priorities/priorities_api.dart';
import 'package:boilerplate/data/network/dio_client.dart';
import 'package:boilerplate/data/repository.dart';
import 'package:boilerplate/data/respository/incident_repository.dart';
import 'package:boilerplate/data/respository/priority_repository.dart';
import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';
import 'package:boilerplate/di/module/local_module.dart';
import 'package:boilerplate/di/module/network_module.dart';
import 'package:boilerplate/stores/error/error_store.dart';
import 'package:boilerplate/stores/incident/assigned_incident/assigned_incident_store.dart';
import 'package:boilerplate/stores/incident/created_incident/created_incident_store.dart';
import 'package:boilerplate/stores/incident/supervised_incident/supervised_incident_store.dart';
import 'package:boilerplate/stores/language/language_store.dart';
import 'package:boilerplate/stores/theme/theme_store.dart';
import 'package:boilerplate/stores/user/user_store.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/network/apis/categories/category_api.dart';
import '../../data/network/apis/subcategories/subcategory_api.dart';
import '../../data/network/apis/user/user_api.dart';
import '../../data/respository/category_repository.dart';
import '../../data/respository/subcategory_repository.dart';
import '../../data/respository/user_repository.dart';
import '../../stores/category/category_store.dart';
import '../../stores/forget_password_form/forget_password_form_store.dart';
import '../../stores/incident_form/incident_form_store.dart';
import '../../stores/login_form/login_form_store.dart';
import '../../stores/priority/priority_store.dart';
import '../../stores/subcategory/subcategory_store.dart';
final getIt = GetIt.instance;

Future<void> setupLocator() async {
  // factories:-----------------------------------------------------------------
  getIt.registerFactory(() => ErrorStore());

  // async singletons:----------------------------------------------------------
  getIt
      .registerSingletonAsync<AppDatabase>(() => LocalModule.provideDatabase());
  getIt.registerSingletonAsync<SharedPreferences>(
      () => LocalModule.provideSharedPreferences());
  // getIt.registerSingleton<AppLocalizations>(LocalModule.provideLang(context));

  // singletons:----------------------------------------------------------------
  getIt.registerSingleton(
      SharedPreferenceHelper(await getIt.getAsync<SharedPreferences>()));
  getIt.registerSingleton<Dio>(
      NetworkModule.provideDio(getIt<SharedPreferenceHelper>()));
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  // getIt.registerSingleton(RestClient());

  // api's:---------------------------------------------------------------------
  getIt.registerSingleton(
      UserApi(getIt<DioClient>(), getIt<SharedPreferenceHelper>()));
  // getIt.registerSingleton(PostApi(getIt<DioClient>(), getIt<RestClient>()));
  getIt.registerSingleton(
      CategoryApi(getIt<DioClient>(), getIt<SharedPreferenceHelper>()));
  getIt.registerSingleton(
      SubCategoryApi(getIt<DioClient>(), getIt<SharedPreferenceHelper>()));
  getIt.registerSingleton(
      IncidentApi(getIt<DioClient>(), getIt<SharedPreferenceHelper>()));
  getIt.registerSingleton(
      prioritiesApi(getIt<DioClient>(), getIt<SharedPreferenceHelper>()));
  //
  // // data sources
  // getIt.registerSingleton(PostDataSource(await getIt.getAsync<AppDatabase>()));
  // getIt.registerSingleton(PrioritiesDataSource(await getIt.getAsync<AppDatabase>()));
  // getIt.registerSingleton(CategoryDataSource(await getIt.getAsync<AppDatabase>()));
  // getIt.registerSingleton(
  //     SubCategoryDataSource(await getIt.getAsync<AppDatabase>()));
  // getIt.registerSingleton(IncidentDataSource(await getIt.getAsync<AppDatabase>()));

  // repository:----------------------------------------------------------------
  getIt.registerSingleton(Repository(

    getIt<SharedPreferenceHelper>()
  ));
  getIt.registerSingleton(CategoryRepository(
      (await getIt.getAsync<AppDatabase>()).categoryDao, getIt<CategoryApi>()));
  getIt.registerSingleton(SubCategoryRepository(
      (await getIt.getAsync<AppDatabase>()).subCategoryDao, getIt<SubCategoryApi>()));
  getIt.registerSingleton(UserRepository(
    getIt<UserApi>(),
    getIt<SharedPreferenceHelper>(),
  ));
  getIt.registerSingleton(IncidentRepository(
      (await getIt.getAsync<AppDatabase>()).incidentDao, getIt<IncidentApi>()));
  getIt.registerSingleton(PriorityRepository(
      (await getIt.getAsync<AppDatabase>()).priorityDao, getIt<prioritiesApi>()));

  // stores:--------------------------------------------------------------------
  getIt.registerSingleton(LanguageStore(getIt<Repository>()));
  // getIt.registerSingleton(PostStore(getIt<Repository>()));
  getIt.registerSingleton(CategoryStore(getIt<CategoryRepository>()));
  getIt.registerSingleton(SubCategoryStore(getIt<SubCategoryRepository>()));
  getIt.registerSingleton(ThemeStore(getIt<Repository>()));
  getIt.registerSingleton(UserStore(getIt<UserRepository>()));
  getIt.registerSingleton(PriorityStore(getIt<PriorityRepository>()));
  //TODO remove this as we replace it with three another stores
  // getIt.registerSingleton(IncidentStore(getIt<IncidentRepository>()));
  getIt.registerSingleton(CreatedIncidentStore(getIt<IncidentRepository>()));
  getIt.registerSingleton(AssignedIncidentStore(getIt<IncidentRepository>()));
  getIt.registerSingleton(SupervisedIncidentStore(getIt<IncidentRepository>()));

  getIt.registerSingleton(IncidentFormStore(getIt<IncidentRepository>()));

  getIt.registerFactory(() => LoginFormStore(getIt<UserRepository>()));
  getIt.registerFactory(() => ForgetPasswordFormStore(getIt<UserRepository>()));
}
