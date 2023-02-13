import 'package:Field_Monitoring/generated/json/base/json_convert_content.dart';
import 'package:Field_Monitoring/data/network/api_response_new_entity.dart';
import 'package:Field_Monitoring/constants/strings.dart';


LoginResponseEntity $LoginResponseEntityFromJson(Map<String, dynamic> json) {
	final LoginResponseEntity loginResponseEntity = LoginResponseEntity();
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		loginResponseEntity.success = success;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		loginResponseEntity.message = message;
	}
	final String? accessToken = jsonConvert.convert<String>(json['access_token']);
	if (accessToken != null) {
		loginResponseEntity.accessToken = accessToken;
	}
	final int? expiresIn = jsonConvert.convert<int>(json['expiresIn']);
	if (expiresIn != null) {
		loginResponseEntity.expiresIn = expiresIn;
	}
	final User? user = jsonConvert.convert<User>(json['user']);
	if (user != null) {
		loginResponseEntity.user = user;
	}
	return loginResponseEntity;
}

Map<String, dynamic> $LoginResponseEntityToJson(LoginResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['success'] = entity.success;
	data['message'] = entity.message;
	data['access_token'] = entity.accessToken;
	data['expiresIn'] = entity.expiresIn;
	data['user'] = entity.user?.toJson();
	return data;
}

User $UserFromJson(Map<String, dynamic> json) {
	final User user = User();
	final String? fullName = jsonConvert.convert<String>(json['fullName']);
	if (fullName != null) {
		user.fullName = fullName;
	}
	final String? userName = jsonConvert.convert<String>(json['userName']);
	if (userName != null) {
		user.userName = userName;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		user.email = email;
	}
	final dynamic mobile = jsonConvert.convert<dynamic>(json['mobile']);
	if (mobile != null) {
		user.mobile = mobile;
	}
	final List<String>? department = jsonConvert.convertListNotNull<String>(json['department']);
	if (department != null) {
		user.department = department;
	}
	final List<String>? municipalities = jsonConvert.convertListNotNull<String>(json['municipalities']);
	if (municipalities != null) {
		user.municipalities = municipalities;
	}
	final List<String>? roles = jsonConvert.convertListNotNull<String>(json['roles']);
	if (roles != null) {
		user.roles = roles;
	}
	final List<ApiResponseNewUserUserRoles>? userRoles = jsonConvert.convertListNotNull<ApiResponseNewUserUserRoles>(json['userRoles']);
	if (userRoles != null) {
		user.userRoles = userRoles;
	}
	return user;
}

Map<String, dynamic> $UserToJson(User entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['fullName'] = entity.fullName;
	data['userName'] = entity.userName;
	data['email'] = entity.email;
	data['mobile'] = entity.mobile;
	data['department'] =  entity.department;
	data['municipalities'] =  entity.municipalities;
	data['roles'] =  entity.roles;
	data['userRoles'] =  entity.userRoles?.map((v) => v.toJson()).toList();
	return data;
}

ApiResponseNewUserUserRoles $ApiResponseNewUserUserRolesFromJson(Map<String, dynamic> json) {
	final ApiResponseNewUserUserRoles apiResponseNewUserUserRoles = ApiResponseNewUserUserRoles();
	final String? roleID = jsonConvert.convert<String>(json['roleID']);
	if (roleID != null) {
		apiResponseNewUserUserRoles.roleID = roleID;
	}
	final String? roleName = jsonConvert.convert<String>(json['roleName']);
	if (roleName != null) {
		apiResponseNewUserUserRoles.roleName = roleName;
	}
	final List<String>? permissions = jsonConvert.convertListNotNull<String>(json['permissions']);
	if (permissions != null) {
		apiResponseNewUserUserRoles.permissions = permissions;
	}
	return apiResponseNewUserUserRoles;
}

Map<String, dynamic> $ApiResponseNewUserUserRolesToJson(ApiResponseNewUserUserRoles entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['roleID'] = entity.roleID;
	data['roleName'] = entity.roleName;
	data['permissions'] =  entity.permissions;
	return data;
}