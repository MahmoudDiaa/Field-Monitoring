import 'package:Field_Monitoring/data/network/dio_client.dart';
import 'package:Field_Monitoring/data/sharedpref/shared_preference_helper.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../models/category/category_list.dart';
import '../../constants/endpoints.dart';
@Singleton()
class CategoryApi {
  final DioClient _dioClient;

  SharedPreferenceHelper sharedPreferenceHelper;

  CategoryApi(
      this._dioClient, SharedPreferenceHelper this.sharedPreferenceHelper);

  /// Returns list of category in response
  Future<CategoryList> getCategories() async {
    try {
      final res = await _dioClient.get(Endpoints.getCategories,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization':
                  'Bearer ${sharedPreferenceHelper.authUser?.accessToken ?? ''}',
            },
          ));
      return CategoryList.fromJson(res['data']);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
