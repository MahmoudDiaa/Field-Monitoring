import 'package:Field_Monitoring/generated/json/base/json_convert_content.dart';
import 'package:Field_Monitoring/models/notification/notifications_entity.dart';

NotificationsEntity $NotificationsEntityFromJson(Map<String, dynamic> json) {
	final NotificationsEntity notificationsEntity = NotificationsEntity();
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		notificationsEntity.success = success;
	}
	final int? pagesCount = jsonConvert.convert<int>(json['pagesCount']);
	if (pagesCount != null) {
		notificationsEntity.pagesCount = pagesCount;
	}
	final List<NotificationsData>? data = jsonConvert.convertListNotNull<NotificationsData>(json['data']);
	if (data != null) {
		notificationsEntity.data = data;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		notificationsEntity.message = message;
	}
	final String? info = jsonConvert.convert<String>(json['info']);
	if (info != null) {
		notificationsEntity.info = info;
	}
	return notificationsEntity;
}

Map<String, dynamic> $NotificationsEntityToJson(NotificationsEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['success'] = entity.success;
	data['pagesCount'] = entity.pagesCount;
	data['data'] =  entity.data?.map((v) => v.toJson()).toList();
	data['message'] = entity.message;
	data['info'] = entity.info;
	return data;
}

NotificationsData $NotificationsDataFromJson(Map<String, dynamic> json) {
	final NotificationsData notificationsData = NotificationsData();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		notificationsData.id = id;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		notificationsData.title = title;
	}
	final String? body = jsonConvert.convert<String>(json['body']);
	if (body != null) {
		notificationsData.body = body;
	}
	final String? resourceId = jsonConvert.convert<String>(json['resourceId']);
	if (resourceId != null) {
		notificationsData.resourceId = resourceId;
	}
	final String? resourceType = jsonConvert.convert<String>(json['resourceType']);
	if (resourceType != null) {
		notificationsData.resourceType = resourceType;
	}
	final bool? isRead = jsonConvert.convert<bool>(json['isRead']);
	if (isRead != null) {
		notificationsData.isRead = isRead;
	}
	final String? sentDate = jsonConvert.convert<String>(json['sentDate']);
	if (sentDate != null) {
		notificationsData.sentDate = sentDate;
	}
	final String? resourceDescription = jsonConvert.convert<String>(json['resourceDescription']);
	if (resourceDescription != null) {
		notificationsData.resourceDescription = resourceDescription;
	}
	final String? resourceVisitDate = jsonConvert.convert<String>(json['resourceVisitDate']);
	if (resourceVisitDate != null) {
		notificationsData.resourceVisitDate = resourceVisitDate;
	}
	final int? resourceNumber = jsonConvert.convert<int>(json['resourceNumber']);
	if (resourceNumber != null) {
		notificationsData.resourceNumber = resourceNumber;
	}
	return notificationsData;
}

Map<String, dynamic> $NotificationsDataToJson(NotificationsData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['body'] = entity.body;
	data['resourceId'] = entity.resourceId;
	data['resourceType'] = entity.resourceType;
	data['isRead'] = entity.isRead;
	data['sentDate'] = entity.sentDate;
	data['resourceDescription'] = entity.resourceDescription;
	data['resourceVisitDate'] = entity.resourceVisitDate;
	data['resourceNumber'] = entity.resourceNumber;
	return data;
}