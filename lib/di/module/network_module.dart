import 'dart:developer';

import 'package:Field_Monitoring/data/network/constants/endpoints.dart';
import 'package:Field_Monitoring/data/sharedpref/shared_preference_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

abstract class NetworkModule {
  /// A singleton dio provider.
  ///
  /// Calling it multiple times will return the same instance.
  @Singleton()
  static Dio provideDio(SharedPreferenceHelper sharedPrefHelper) {
    final dio = Dio();

    dio
      ..options.baseUrl = Endpoints.baseUrl1
      ..options.connectTimeout = Endpoints.connectionTimeout
      ..options.receiveTimeout = Endpoints.receiveTimeout
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
        logPrint: networkLog,
      ))
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options,
              RequestInterceptorHandler handler) async {
            // getting token
            var token = await sharedPrefHelper.authToken;

            if (token != null) {
              options.headers.putIfAbsent('Authorization', () => token);
            } else {
              print('Auth token is null');
            }

            return handler.next(options);
          },
        ),
      );

    return dio;
  }

  static void networkLog(Object? object) {
    if (object.toString().contains("error"))
      log("", error: object.toString());
    else
      log(object.toString());
  }
}
