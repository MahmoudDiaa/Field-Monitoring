// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter/material.dart' show debugPrint;
import 'package:Field_Monitoring/data/local/entities/user_roles/user_roles.dart';
import 'package:Field_Monitoring/data/network/api_response_new_entity.dart';
import 'package:Field_Monitoring/models/incident_details/incident_details_response_entity.dart';
import 'package:Field_Monitoring/models/notification/notifications_entity.dart';

JsonConvert jsonConvert = JsonConvert();
typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);
typedef EnumConvertFunction<T> = T Function(String value);

class JsonConvert {
	static final Map<String, JsonConvertFunction> convertFuncMap = {
		(UserRolesEntity).toString(): UserRolesEntity.fromJson,
		(LoginResponseEntity).toString(): LoginResponseEntity.fromJson,
		(User).toString(): User.fromJson,
		(ApiResponseNewUserUserRoles).toString(): ApiResponseNewUserUserRoles.fromJson,
		(IncidentDetailsResponseEntity).toString(): IncidentDetailsResponseEntity.fromJson,
		(IncidentDetailsResponseData).toString(): IncidentDetailsResponseData.fromJson,
		(IncidentDetailsResponseDataStatus).toString(): IncidentDetailsResponseDataStatus.fromJson,
		(IncidentDetailsResponseDataPriorityLevel).toString(): IncidentDetailsResponseDataPriorityLevel.fromJson,
		(IncidentDetailsResponseDataCategory).toString(): IncidentDetailsResponseDataCategory.fromJson,
		(IncidentDetailsResponseDataSubCategory).toString(): IncidentDetailsResponseDataSubCategory.fromJson,
		(IncidentDetailsResponseDataAmountUnit).toString(): IncidentDetailsResponseDataAmountUnit.fromJson,
		(IncidentDetailsResponseDataImages).toString(): IncidentDetailsResponseDataImages.fromJson,
		(IncidentDetailsResponseDataIncidentHistory).toString(): IncidentDetailsResponseDataIncidentHistory.fromJson,
		(IncidentDetailsResponseDataIncidentHistoryIncident).toString(): IncidentDetailsResponseDataIncidentHistoryIncident.fromJson,
		(IncidentDetailsResponseDataIncidentHistoryIncidentImages).toString(): IncidentDetailsResponseDataIncidentHistoryIncidentImages.fromJson,
		(IncidentDetailsResponseDataIncidentHistoryIncidentLocation).toString(): IncidentDetailsResponseDataIncidentHistoryIncidentLocation.fromJson,
		(IncidentDetailsResponseDataIncidentHistoryIncidentAmountUnit).toString(): IncidentDetailsResponseDataIncidentHistoryIncidentAmountUnit.fromJson,
		(IncidentDetailsResponseDataIncidentHistoryIncidentCategory).toString(): IncidentDetailsResponseDataIncidentHistoryIncidentCategory.fromJson,
		(IncidentDetailsResponseDataIncidentHistoryIncidentSubCategory).toString(): IncidentDetailsResponseDataIncidentHistoryIncidentSubCategory.fromJson,
		(IncidentDetailsResponseDataIncidentHistoryIncidentStatus).toString(): IncidentDetailsResponseDataIncidentHistoryIncidentStatus.fromJson,
		(IncidentDetailsResponseDataIncidentHistoryIncidentStatusUpdateUser).toString(): IncidentDetailsResponseDataIncidentHistoryIncidentStatusUpdateUser.fromJson,
		(IncidentDetailsResponseDataIncidentHistoryIncidentAssignedUser).toString(): IncidentDetailsResponseDataIncidentHistoryIncidentAssignedUser.fromJson,
		(IncidentDetailsResponseDataIncidentHistoryIncidentCreatedUser).toString(): IncidentDetailsResponseDataIncidentHistoryIncidentCreatedUser.fromJson,
		(IncidentDetailsResponseDataIncidentHistoryIncidentPriorityLevel).toString(): IncidentDetailsResponseDataIncidentHistoryIncidentPriorityLevel.fromJson,
		(IncidentDetailsResponseDataIncidentHistoryHistoricalImages).toString(): IncidentDetailsResponseDataIncidentHistoryHistoricalImages.fromJson,
		(IncidentDetailsResponseDataIncidentHistoryAssignedUser).toString(): IncidentDetailsResponseDataIncidentHistoryAssignedUser.fromJson,
		(NotificationsEntity).toString(): NotificationsEntity.fromJson,
		(NotificationsData).toString(): NotificationsData.fromJson,
	};

  T? convert<T>(dynamic value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    if (value is T) {
      return value;
    }
    try {
      return _asT<T>(value, enumConvert: enumConvert);
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return null;
    }
  }

  List<T?>? convertList<T>(List<dynamic>? value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => _asT<T>(e,enumConvert: enumConvert)).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

List<T>? convertListNotNull<T>(dynamic value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) => _asT<T>(e,enumConvert: enumConvert)!).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  T? _asT<T extends Object?>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    final String type = T.toString();
    final String valueS = value.toString();
    if (enumConvert != null) {
      return enumConvert(valueS) as T;
    } else if (type == "String") {
      return valueS as T;
    } else if (type == "int") {
      final int? intValue = int.tryParse(valueS);
      if (intValue == null) {
        return double.tryParse(valueS)?.toInt() as T?;
      } else {
        return intValue as T;
      }
    } else if (type == "double") {
      return double.parse(valueS) as T;
    } else if (type == "DateTime") {
      return DateTime.parse(valueS) as T;
    } else if (type == "bool") {
      if (valueS == '0' || valueS == '1') {
        return (valueS == '1') as T;
      }
      return (valueS == 'true') as T;
    } else if (type == "Map" || type.startsWith("Map<")) {
      return value as T;
    } else {
      if (convertFuncMap.containsKey(type)) {
        return convertFuncMap[type]!(Map<String, dynamic>.from(value)) as T;
      } else {
        throw UnimplementedError('$type unimplemented');
      }
    }
  }

	//list is returned by type
	static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
		if(<UserRolesEntity>[] is M){
			return data.map<UserRolesEntity>((Map<String, dynamic> e) => UserRolesEntity.fromJson(e)).toList() as M;
		}
		if(<LoginResponseEntity>[] is M){
			return data.map<LoginResponseEntity>((Map<String, dynamic> e) => LoginResponseEntity.fromJson(e)).toList() as M;
		}
		if(<User>[] is M){
			return data.map<User>((Map<String, dynamic> e) => User.fromJson(e)).toList() as M;
		}
		if(<ApiResponseNewUserUserRoles>[] is M){
			return data.map<ApiResponseNewUserUserRoles>((Map<String, dynamic> e) => ApiResponseNewUserUserRoles.fromJson(e)).toList() as M;
		}
		if(<IncidentDetailsResponseEntity>[] is M){
			return data.map<IncidentDetailsResponseEntity>((Map<String, dynamic> e) => IncidentDetailsResponseEntity.fromJson(e)).toList() as M;
		}
		if(<IncidentDetailsResponseData>[] is M){
			return data.map<IncidentDetailsResponseData>((Map<String, dynamic> e) => IncidentDetailsResponseData.fromJson(e)).toList() as M;
		}
		if(<IncidentDetailsResponseDataStatus>[] is M){
			return data.map<IncidentDetailsResponseDataStatus>((Map<String, dynamic> e) => IncidentDetailsResponseDataStatus.fromJson(e)).toList() as M;
		}
		if(<IncidentDetailsResponseDataPriorityLevel>[] is M){
			return data.map<IncidentDetailsResponseDataPriorityLevel>((Map<String, dynamic> e) => IncidentDetailsResponseDataPriorityLevel.fromJson(e)).toList() as M;
		}
		if(<IncidentDetailsResponseDataCategory>[] is M){
			return data.map<IncidentDetailsResponseDataCategory>((Map<String, dynamic> e) => IncidentDetailsResponseDataCategory.fromJson(e)).toList() as M;
		}
		if(<IncidentDetailsResponseDataSubCategory>[] is M){
			return data.map<IncidentDetailsResponseDataSubCategory>((Map<String, dynamic> e) => IncidentDetailsResponseDataSubCategory.fromJson(e)).toList() as M;
		}
		if(<IncidentDetailsResponseDataAmountUnit>[] is M){
			return data.map<IncidentDetailsResponseDataAmountUnit>((Map<String, dynamic> e) => IncidentDetailsResponseDataAmountUnit.fromJson(e)).toList() as M;
		}
		if(<IncidentDetailsResponseDataImages>[] is M){
			return data.map<IncidentDetailsResponseDataImages>((Map<String, dynamic> e) => IncidentDetailsResponseDataImages.fromJson(e)).toList() as M;
		}
		if(<IncidentDetailsResponseDataIncidentHistory>[] is M){
			return data.map<IncidentDetailsResponseDataIncidentHistory>((Map<String, dynamic> e) => IncidentDetailsResponseDataIncidentHistory.fromJson(e)).toList() as M;
		}
		if(<IncidentDetailsResponseDataIncidentHistoryIncident>[] is M){
			return data.map<IncidentDetailsResponseDataIncidentHistoryIncident>((Map<String, dynamic> e) => IncidentDetailsResponseDataIncidentHistoryIncident.fromJson(e)).toList() as M;
		}
		if(<IncidentDetailsResponseDataIncidentHistoryIncidentImages>[] is M){
			return data.map<IncidentDetailsResponseDataIncidentHistoryIncidentImages>((Map<String, dynamic> e) => IncidentDetailsResponseDataIncidentHistoryIncidentImages.fromJson(e)).toList() as M;
		}
		if(<IncidentDetailsResponseDataIncidentHistoryIncidentLocation>[] is M){
			return data.map<IncidentDetailsResponseDataIncidentHistoryIncidentLocation>((Map<String, dynamic> e) => IncidentDetailsResponseDataIncidentHistoryIncidentLocation.fromJson(e)).toList() as M;
		}
		if(<IncidentDetailsResponseDataIncidentHistoryIncidentAmountUnit>[] is M){
			return data.map<IncidentDetailsResponseDataIncidentHistoryIncidentAmountUnit>((Map<String, dynamic> e) => IncidentDetailsResponseDataIncidentHistoryIncidentAmountUnit.fromJson(e)).toList() as M;
		}
		if(<IncidentDetailsResponseDataIncidentHistoryIncidentCategory>[] is M){
			return data.map<IncidentDetailsResponseDataIncidentHistoryIncidentCategory>((Map<String, dynamic> e) => IncidentDetailsResponseDataIncidentHistoryIncidentCategory.fromJson(e)).toList() as M;
		}
		if(<IncidentDetailsResponseDataIncidentHistoryIncidentSubCategory>[] is M){
			return data.map<IncidentDetailsResponseDataIncidentHistoryIncidentSubCategory>((Map<String, dynamic> e) => IncidentDetailsResponseDataIncidentHistoryIncidentSubCategory.fromJson(e)).toList() as M;
		}
		if(<IncidentDetailsResponseDataIncidentHistoryIncidentStatus>[] is M){
			return data.map<IncidentDetailsResponseDataIncidentHistoryIncidentStatus>((Map<String, dynamic> e) => IncidentDetailsResponseDataIncidentHistoryIncidentStatus.fromJson(e)).toList() as M;
		}
		if(<IncidentDetailsResponseDataIncidentHistoryIncidentStatusUpdateUser>[] is M){
			return data.map<IncidentDetailsResponseDataIncidentHistoryIncidentStatusUpdateUser>((Map<String, dynamic> e) => IncidentDetailsResponseDataIncidentHistoryIncidentStatusUpdateUser.fromJson(e)).toList() as M;
		}
		if(<IncidentDetailsResponseDataIncidentHistoryIncidentAssignedUser>[] is M){
			return data.map<IncidentDetailsResponseDataIncidentHistoryIncidentAssignedUser>((Map<String, dynamic> e) => IncidentDetailsResponseDataIncidentHistoryIncidentAssignedUser.fromJson(e)).toList() as M;
		}
		if(<IncidentDetailsResponseDataIncidentHistoryIncidentCreatedUser>[] is M){
			return data.map<IncidentDetailsResponseDataIncidentHistoryIncidentCreatedUser>((Map<String, dynamic> e) => IncidentDetailsResponseDataIncidentHistoryIncidentCreatedUser.fromJson(e)).toList() as M;
		}
		if(<IncidentDetailsResponseDataIncidentHistoryIncidentPriorityLevel>[] is M){
			return data.map<IncidentDetailsResponseDataIncidentHistoryIncidentPriorityLevel>((Map<String, dynamic> e) => IncidentDetailsResponseDataIncidentHistoryIncidentPriorityLevel.fromJson(e)).toList() as M;
		}
		if(<IncidentDetailsResponseDataIncidentHistoryHistoricalImages>[] is M){
			return data.map<IncidentDetailsResponseDataIncidentHistoryHistoricalImages>((Map<String, dynamic> e) => IncidentDetailsResponseDataIncidentHistoryHistoricalImages.fromJson(e)).toList() as M;
		}
		if(<IncidentDetailsResponseDataIncidentHistoryAssignedUser>[] is M){
			return data.map<IncidentDetailsResponseDataIncidentHistoryAssignedUser>((Map<String, dynamic> e) => IncidentDetailsResponseDataIncidentHistoryAssignedUser.fromJson(e)).toList() as M;
		}
		if(<NotificationsEntity>[] is M){
			return data.map<NotificationsEntity>((Map<String, dynamic> e) => NotificationsEntity.fromJson(e)).toList() as M;
		}
		if(<NotificationsData>[] is M){
			return data.map<NotificationsData>((Map<String, dynamic> e) => NotificationsData.fromJson(e)).toList() as M;
		}

		debugPrint("${M.toString()} not found");
	
		return null;
}

	static M? fromJsonAsT<M>(dynamic json) {
		if (json is List) {
			return _getListChildType<M>(json.map((e) => e as Map<String, dynamic>).toList());
		} else {
			return jsonConvert.convert<M>(json);
		}
	}
}