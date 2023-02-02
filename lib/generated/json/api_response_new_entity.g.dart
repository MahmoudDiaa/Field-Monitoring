import 'package:boilerplate/generated/json/base/json_convert_content.dart';
import 'package:boilerplate/data/network/api_response_new_entity.dart';

import '../../data/local/entities/user_roles/user_roles.dart';

LoginResponseEntity $ApiResponseNewEntityFromJson(Map<String, dynamic> json) {
	final LoginResponseEntity apiResponseNewEntity = LoginResponseEntity();
	final bool? success = jsonConvert.convert<bool>(json['success']);
	if (success != null) {
		apiResponseNewEntity.success = success;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		apiResponseNewEntity.message = message;
	}
	final String? accessToken = jsonConvert.convert<String>(json['access_token']);
	if (accessToken != null) {
		apiResponseNewEntity.accessToken = accessToken;
	}
	final int? expiresIn = jsonConvert.convert<int>(json['expiresIn']);
	if (expiresIn != null) {
		apiResponseNewEntity.expiresIn = expiresIn;
	}
	final User? user = jsonConvert.convert<User>(json['user']);
	if (user != null) {
		apiResponseNewEntity.user = user;
	}
	return apiResponseNewEntity;
}

Map<String, dynamic> $ApiResponseNewEntityToJson(LoginResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['success'] = entity.success;
	data['message'] = entity.message;
	data['access_token'] = entity.accessToken;
	data['expiresIn'] = entity.expiresIn;
	data['user'] = entity.user?.toJson();
	return data;
}

User $ApiResponseNewUserFromJson(Map<String, dynamic> json) {
	final User apiResponseNewUser = User();
	final String? fullName = jsonConvert.convert<String>(json['fullName']);
	if (fullName != null) {
		apiResponseNewUser.fullName = fullName;
	}
	final String? userName = jsonConvert.convert<String>(json['userName']);
	if (userName != null) {
		apiResponseNewUser.userName = userName;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		apiResponseNewUser.email = email;
	}
	final dynamic? mobile = jsonConvert.convert<dynamic>(json['mobile']);
	if (mobile != null) {
		apiResponseNewUser.mobile = mobile;
	}
	final List<String>? roles = jsonConvert.convertListNotNull<String>(json['roles']);
	if (roles != null) {
		apiResponseNewUser.roles = roles;
	}
	final List<ApiResponseNewUserUserRoles>? userRoles = jsonConvert.convertListNotNull<ApiResponseNewUserUserRoles>(json['userRoles']);
	if (userRoles != null) {
		apiResponseNewUser.userRoles = userRoles;
	}
	return apiResponseNewUser;
}

Map<String, dynamic> $ApiResponseNewUserToJson(User entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['fullName'] = entity.fullName;
	data['userName'] = entity.userName;
	data['email'] = entity.email;
	data['mobile'] = entity.mobile;
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
UserRolesEntity $UserRolesEntityFromJson(Map<String, dynamic> json) {
	final UserRolesEntity userRolesEntity = UserRolesEntity();
	final String? roleID = jsonConvert.convert<String>(json['roleID']);
	if (roleID != null) {
		userRolesEntity.roleID = roleID;
	}
	final String? roleName = jsonConvert.convert<String>(json['roleName']);
	if (roleName != null) {
		userRolesEntity.roleName = roleName;
	}
	final List<String>? permissions = jsonConvert.convertListNotNull<String>(json['permissions']);
	if (permissions != null) {
		userRolesEntity.permissions = permissions;
	}
	return userRolesEntity;
}

Map<String, dynamic> $ApiResponseNewUserUserRolesToJson(ApiResponseNewUserUserRoles entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['roleID'] = entity.roleID;
	data['roleName'] = entity.roleName;
	data['permissions'] =  entity.permissions;
	return data;
}
Map<String, dynamic> $UserRolesEntityToJson(UserRolesEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['roleID'] = entity.roleID;
	data['roleName'] = entity.roleName;
	data['permissions'] =  entity.permissions;
	return data;
}