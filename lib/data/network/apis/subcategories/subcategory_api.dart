import 'package:Field_Monitoring/data/network/dio_client.dart';
import 'package:Field_Monitoring/data/sharedpref/shared_preference_helper.dart';
import 'package:Field_Monitoring/models/subcategory/subcategory_list.dart';
import 'package:dio/dio.dart';

import '../../constants/endpoints.dart';

class SubCategoryApi {
  final DioClient _dioClient;

  SharedPreferenceHelper sharedPreferenceHelper;

  SubCategoryApi(
      this._dioClient, SharedPreferenceHelper this.sharedPreferenceHelper);

  /// Returns list of category in response
  Future<SubCategoryList> getCategories({categoryId}) async {
    try {
      final res = await _dioClient.get(
          categoryId == null
              ? Endpoints.getSubCategories
              : '${Endpoints.getSubCategories}?categoryId=${categoryId}',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization':
                  'Bearer ${sharedPreferenceHelper.authUser?.accessToken ?? ''}',
            },
          ));
      return SubCategoryList.fromJson(res['data']);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
