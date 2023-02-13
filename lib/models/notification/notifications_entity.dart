import 'package:Field_Monitoring/generated/json/base/json_field.dart';
import 'package:Field_Monitoring/generated/json/notifications_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class NotificationsEntity {

	bool? success;
	int? pagesCount;
	List<NotificationsData>? data;
	String? message;
	String? info;
  
  NotificationsEntity();

  factory NotificationsEntity.fromJson(Map<String, dynamic> json) => $NotificationsEntityFromJson(json);

  Map<String, dynamic> toJson() => $NotificationsEntityToJson(this);

  NotificationsEntity copyWith({bool? success, int? pagesCount, List<NotificationsData>? data, String? message, String? info}) {
      return NotificationsEntity()..success= success ?? this.success
			..pagesCount= pagesCount ?? this.pagesCount
			..data= data ?? this.data
			..message= message ?? this.message
			..info= info ?? this.info;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class NotificationsData {

	String? id;
	String? title;
	String? body;
	String? resourceId;
	String? resourceType;
	bool? isRead;
	String? sentDate;
	String? resourceDescription;
	String? resourceVisitDate;
	int? resourceNumber;
  
  NotificationsData();

  factory NotificationsData.fromJson(Map<String, dynamic> json) => $NotificationsDataFromJson(json);

  Map<String, dynamic> toJson() => $NotificationsDataToJson(this);

  NotificationsData copyWith({String? id, String? title, String? body, String? resourceId, String? resourceType, bool? isRead, String? sentDate, String? resourceDescription, String? resourceVisitDate, int? resourceNumber}) {
      return NotificationsData()..id= id ?? this.id
			..title= title ?? this.title
			..body= body ?? this.body
			..resourceId= resourceId ?? this.resourceId
			..resourceType= resourceType ?? this.resourceType
			..isRead= isRead ?? this.isRead
			..sentDate= sentDate ?? this.sentDate
			..resourceDescription= resourceDescription ?? this.resourceDescription
			..resourceVisitDate= resourceVisitDate ?? this.resourceVisitDate
			..resourceNumber= resourceNumber ?? this.resourceNumber;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}