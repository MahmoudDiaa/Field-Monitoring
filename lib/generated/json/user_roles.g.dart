import 'package:Field_Monitoring/generated/json/base/json_convert_content.dart';
import 'package:Field_Monitoring/data/local/entities/user_roles/user_roles.dart';


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

Map<String, dynamic> $UserRolesEntityToJson(UserRolesEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['roleID'] = entity.roleID;
	data['roleName'] = entity.roleName;
	data['permissions'] =  entity.permissions;
	return data;
}