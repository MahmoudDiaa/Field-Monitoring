import 'package:Field_Monitoring/data/network/apis/notification/notification_api.dart';
import 'package:Field_Monitoring/models/notification/notifications_entity.dart';

class NotificationRepository {

  // api objects
  final NotificationApi _notificationApi;


  NotificationRepository( this._notificationApi);

  Future<NotificationsEntity> getNotification() async {
    return await _notificationApi
        .getNotification().catchError((error) => throw error);
  }


}
