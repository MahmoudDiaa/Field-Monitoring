import 'dart:convert';

import 'package:Field_Monitoring/generated/json/user_roles.g.dart';

import '../../../../generated/json/api_response_new_entity.g.dart';
import '../../../../generated/json/base/json_field.dart';
import '../../../network/api_response_new_entity.dart';

@JsonSerializable()
class UserRolesEntity {
  String? roleID;
  String? roleName;
  List<String>? permissions;

  UserRolesEntity();

  UserRolesEntity.invoke(this.roleID, this.roleName, this.permissions);

  factory UserRolesEntity.fromJson(Map<String, dynamic> json) =>
      $UserRolesEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserRolesEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  factory UserRolesEntity.fromRemote(
          ApiResponseNewUserUserRoles apiResponseNewUserUserRoles) =>
      UserRolesEntity.invoke(
          apiResponseNewUserUserRoles.roleID,
          apiResponseNewUserUserRoles.roleName,
          apiResponseNewUserUserRoles.permissions);


ApiResponseNewUserUserRoles toRemote()=>ApiResponseNewUserUserRoles.invoke(roleID, roleName, permissions);


}
