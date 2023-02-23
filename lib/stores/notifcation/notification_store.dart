import 'package:Field_Monitoring/data/respository/notification_repository.dart';
import 'package:Field_Monitoring/models/notification/notifications_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../utils/dio/dio_error_util.dart';
import '../error/error_store.dart';

part 'notification_store.g.dart';

class NotificationStore = _NotificationStore with _$NotificationStore;
@Singleton()
abstract class _NotificationStore with Store {
  final NotificationRepository _notificationRepository;

  //constructor
  _NotificationStore(this._notificationRepository);
// store for handling errors
  final ErrorStore errorStore = ErrorStore();
  static ObservableFuture<NotificationsEntity?> emptyNotificationResponse =
      ObservableFuture.value(null);
  @observable
  ObservableFuture<NotificationsEntity?> fetchNotificationFuture =
      ObservableFuture<NotificationsEntity?>(emptyNotificationResponse);
  @observable
  NotificationsEntity? notificationsEntity;

  @observable
  bool success = false;

  @computed
  bool get loading => fetchNotificationFuture.status == FutureStatus.pending;

  //actions
  @action
  Future getNotifications() async {
    var future;
    future= _notificationRepository.getNotification();
    fetchNotificationFuture=ObservableFuture(future);
    future.then((NotificationsEntity notifications){
      notificationsEntity=notifications;
    }).catchError((error) {
      print("notification error $error");
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }
}
