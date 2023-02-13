import 'package:dio/dio.dart';

import '../../../../models/notification/notifications_entity.dart';
import '../../../sharedpref/shared_preference_helper.dart';
import '../../constants/endpoints.dart';
import '../../dio_client.dart';

class NotificationApi {
  final DioClient _dioClient;
  SharedPreferenceHelper sharedPreferenceHelper;


  NotificationApi(
      this._dioClient, SharedPreferenceHelper this.sharedPreferenceHelper);

  /// Returns list of Incident in response
  Future<NotificationsEntity> getNotification() async {
    try {
      final res = await _dioClient.get(
          Endpoints.getNotifications,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization':
              'Bearer ${sharedPreferenceHelper.authUser?.accessToken ?? ''}',
            },
          ));
      print("Resource $res");
      return  NotificationsEntity.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }


}
