import 'package:Field_Monitoring/models/notification/notifications_entity.dart';
import 'package:Field_Monitoring/stores/language/language_store.dart';
import 'package:Field_Monitoring/stores/notifcation/notification_store.dart';
import 'package:Field_Monitoring/ui/constants/colors.dart';
import 'package:Field_Monitoring/widgets/notification/notification_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
   late NotificationStore _notificationStore;
  late LanguageStore _languageStore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_languageStore.language.notification,),backgroundColor: CustomColor.primaryColor,
        ),
        body: Observer(
          builder:(BuildContext context)=>_notificationStore.loading?Container(): ListView.builder(
            itemCount: _notificationStore.notificationsEntity!.data?.length,
            itemBuilder: (context, position) => NotificationBody(
                notification: _notificationStore.notificationsEntity!.data![position]),
          ),
        ));
  }

  @override
  void didChangeDependencies()  {
    super.didChangeDependencies();
    _languageStore = Provider.of<LanguageStore>(context);
    _notificationStore =
         Provider.of<NotificationStore>(context);
    if(!_notificationStore.loading){
      _notificationStore.getNotifications();

    }
  }
}
