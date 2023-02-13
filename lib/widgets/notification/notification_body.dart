import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/notification/notifications_entity.dart';
import '../../utils/routes/routes.dart';

class NotificationBody extends StatelessWidget {
  final NotificationsData notification;

  const NotificationBody({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[300],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(padding: EdgeInsets.all(4),
              child: !notification.isRead!
                  ? Icon(
                Icons.circle,
                color: Colors.red,
                size: 10,
              )
                  : Container(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 8),
              child: Row(
                children: [

                  Text(
                    notification.title!,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Spacer(),
                  Text(
                    notification.sentDate!.split(".")[0],
                    style: Theme.of(context).textTheme.labelLarge,
                  ),


                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    notification.body!,
                    style: Theme.of(context).textTheme.labelLarge,maxLines: 5,
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
