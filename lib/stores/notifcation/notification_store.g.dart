// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NotificationStore on _NotificationStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_NotificationStore.loading'))
      .value;

  late final _$fetchNotificationFutureAtom = Atom(
      name: '_NotificationStore.fetchNotificationFuture', context: context);

  @override
  ObservableFuture<NotificationsEntity?> get fetchNotificationFuture {
    _$fetchNotificationFutureAtom.reportRead();
    return super.fetchNotificationFuture;
  }

  @override
  set fetchNotificationFuture(ObservableFuture<NotificationsEntity?> value) {
    _$fetchNotificationFutureAtom
        .reportWrite(value, super.fetchNotificationFuture, () {
      super.fetchNotificationFuture = value;
    });
  }

  late final _$notificationsEntityAtom =
      Atom(name: '_NotificationStore.notificationsEntity', context: context);

  @override
  NotificationsEntity? get notificationsEntity {
    _$notificationsEntityAtom.reportRead();
    return super.notificationsEntity;
  }

  @override
  set notificationsEntity(NotificationsEntity? value) {
    _$notificationsEntityAtom.reportWrite(value, super.notificationsEntity, () {
      super.notificationsEntity = value;
    });
  }

  late final _$successAtom =
      Atom(name: '_NotificationStore.success', context: context);

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  late final _$getNotificationsAsyncAction =
      AsyncAction('_NotificationStore.getNotifications', context: context);

  @override
  Future<dynamic> getNotifications() {
    return _$getNotificationsAsyncAction.run(() => super.getNotifications());
  }

  @override
  String toString() {
    return '''
fetchNotificationFuture: ${fetchNotificationFuture},
notificationsEntity: ${notificationsEntity},
success: ${success},
loading: ${loading}
    ''';
  }
}
