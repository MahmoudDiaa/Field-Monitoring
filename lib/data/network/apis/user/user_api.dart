import 'dart:convert';

import 'package:Field_Monitoring/data/network/api_response_new_entity.dart';
import 'package:Field_Monitoring/data/network/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../sharedpref/shared_preference_helper.dart';
import '../../constants/endpoints.dart';
@Singleton()
class UserApi {
  final DioClient _dioClient;
  LoginResponseEntity? apiResponse;
  SharedPreferenceHelper sharedPreferenceHelper;

  UserApi(this._dioClient, this.sharedPreferenceHelper);

  /// Returns list of category in response
  Future<LoginResponseEntity?> login(username, password) async {
    try {
      final res = await _dioClient.post(Endpoints.login,
          data: jsonEncode({'userName': username, 'password': password}),
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ));
      return apiResponse = LoginResponseEntity.fromJson(res);
      //return apiResponse!.success == true ? AuthUser.fromMap(res) : null;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<LoginResponseEntity?> register(
      firstName, lastName, email, userName, password) async {
    try {
      final res = await _dioClient.post(
          '${Endpoints.signUp}?frontVerifyUrl=http://51.15.23.9:8085/auth/signin/verifyemail',
          data: jsonEncode({
            'UserName': userName,
            'Email': email,
            'Password': password,
            'Age': '11',
            'Gender': '1',
            'FullName': email,
            "firstName": firstName,
            "lastName": lastName,
            "roles": ["IncidentEmployee"]
          }),
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ));
      apiResponse = LoginResponseEntity.fromJson(res);
      return apiResponse;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<LoginResponseEntity?> changePassword(currentPassword, password) async {
    try {
      final res = await _dioClient.post(Endpoints.changePassword,
          data: jsonEncode({
            'currentPassword': currentPassword,
            'newPassword': password,
          }),
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization':
                  'Bearer ${sharedPreferenceHelper.authUser?.accessToken ?? ''}',
            },
          ));
      apiResponse = LoginResponseEntity.fromJson(res);
      return apiResponse;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<LoginResponseEntity?> sendForgetPasswordLink(email) async {
    try {
      final res = await _dioClient.post(Endpoints.forgetPasswordLink,
          data: jsonEncode({
            'email': email,
          }),
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ));
      apiResponse = LoginResponseEntity.fromJson(res);
      return apiResponse;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<LoginResponseEntity?> resetPassword(code, email, password) async {
    try {
      final res = await _dioClient.post(Endpoints.resetPassword,
          data: jsonEncode({
            'code': code,
            'email': email,
            'password': password,
          }),
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ));
      apiResponse = LoginResponseEntity.fromJson(res);
      return apiResponse;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
