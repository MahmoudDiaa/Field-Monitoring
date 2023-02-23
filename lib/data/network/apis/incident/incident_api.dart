import 'dart:convert';

import 'package:Field_Monitoring/data/network/dio_client.dart';
import 'package:Field_Monitoring/models/incident/incident_list.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../constants/enums.dart';
import '../../../../models/incident/incident.dart';
import '../../../../models/incident/incident_filter.dart';
import '../../../sharedpref/shared_preference_helper.dart';
import '../../api_response_new_entity.dart';
import '../../constants/endpoints.dart';
import 'dart:developer';
@Singleton()
class IncidentApi {
  final DioClient _dioClient;
  SharedPreferenceHelper sharedPreferenceHelper;
  LoginResponseEntity? apiResponse;

  IncidentApi(
      this._dioClient, SharedPreferenceHelper this.sharedPreferenceHelper);

  /// Returns list of Incident in response
  Future<IncidentList> getIncidents(
      int pageNumber, IncidentFilter? incidentFilter) async {
    try {
      final res = await _dioClient.post(
          '${Endpoints.getIncidents}?currentPage=${pageNumber}',
          data:
          {
            "pageSize": 10,
            "categoryId": incidentFilter?.categoryId,
            "subCategoryId": incidentFilter?.subCategoryId,
            "distance": incidentFilter?.latlng == null
                ? null
                : {
                    "lat": incidentFilter?.latlng?.latitude,
                    "long": incidentFilter?.latlng?.longitude,
                    "distanceInMeter": incidentFilter?.distance
                  },
          },
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization':
                  'Bearer ${sharedPreferenceHelper.authUser?.accessToken ?? ''}',
            },
          ));
      return IncidentList.fromJson(res['data']);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<bool?> save(Incident incident) async {
    try {
      log("incident form log=> ${incident.toMap()}");
      final res = await _dioClient.postDataForm(Endpoints.saveIncident,
          data: jsonEncode(incident.toMap()),
          options: Options(
            headers: {
              'Content-Type': 'multipart/form-data',
              'Accept': 'multipart/form-data',
              'Authorization':
                  'Bearer ${sharedPreferenceHelper.authUser?.accessToken ?? ''}',
            },
          ));
      apiResponse = LoginResponseEntity.fromJson(res);
      return apiResponse?.success;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<bool?> saveWorkFlowStep(
      Incident incident, IncidentStatusEnum incidentStatusEnum) async {
    try {
      final res = await _dioClient.postDataForm(
          incidentStatusEnum.workflowSubmitEndpointName ?? '',
          data: jsonEncode(incident.toWorkflowMap(incidentStatusEnum)),
          options: Options(
            headers: {
              'Content-Type': 'multipart/form-data',
              'Accept': 'multipart/form-data',
              'Authorization':
                  'Bearer ${sharedPreferenceHelper.authUser?.accessToken ?? ''}',
            },
          ));
      apiResponse = LoginResponseEntity.fromJson(res);
      return apiResponse?.success;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<Incident> getIncident(String id) async {
    try {
      final res = await _dioClient.get('${Endpoints.getIncident}${id}',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization':
                  'Bearer ${sharedPreferenceHelper.authUser?.accessToken ?? ''}',
            },
          ));
      return Incident.fromMap(res['data']);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
