import 'package:boilerplate/constants/strings.dart';
import 'package:boilerplate/generated/json/base/json_field.dart';
import 'package:boilerplate/generated/json/api_response_new_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LoginResponseEntity {
  bool? success;
  String? message;
  @JSONField(name: "access_token")
  String? accessToken;
  int? expiresIn;
  User? user;

  LoginResponseEntity();

  factory LoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      $ApiResponseNewEntityFromJson(json);

  Map<String, dynamic> toJson() => $ApiResponseNewEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class User {
  String? fullName;
  String? userName;
  String? email;
  dynamic mobile;
  List<String>? department=["إدارة شرق"];
  List<String>? municipalities=["البلديات"];
  List<String>? roles;
  List<ApiResponseNewUserUserRoles>? userRoles;

  User();

  factory User.fromJson(Map<String, dynamic> json) =>
      $ApiResponseNewUserFromJson(json);

  Map<String, dynamic> toJson() => $ApiResponseNewUserToJson(this);

  //assigned is for moqawel
  bool isHasAssignedPermission() => userRoles!.any((userRole) {
        return userRole.permissions!.contains(UserPermission.Assigned);
      });

  // created is for Rased
  bool isHasCreatedPermission() => userRoles!.any((userRole) {
        return userRole.permissions!.contains(UserPermission.Created);
      });
  // supervised is for supervisor
  bool isHasSupervisedPermission() => userRoles!.any((userRole) {
        return userRole.permissions!.contains(UserPermission.Supervised);
      });

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ApiResponseNewUserUserRoles {
  String? roleID;
  String? roleName;
  List<String>? permissions;

  ApiResponseNewUserUserRoles();

  ApiResponseNewUserUserRoles.invoke(
      this.roleID, this.roleName, this.permissions);

  factory ApiResponseNewUserUserRoles.fromJson(Map<String, dynamic> json) =>
      $ApiResponseNewUserUserRolesFromJson(json);

  Map<String, dynamic> toJson() => $ApiResponseNewUserUserRolesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
