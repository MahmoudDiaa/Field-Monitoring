import 'package:boilerplate/data/local/entities/incident/incident_entity.dart';
import 'package:boilerplate/data/local/mappers/mappers.dart';
import 'package:boilerplate/models/incident/incident.dart';
import 'package:sembast/sembast.dart';

import '../../constants/enums.dart';
import '../../models/incident/incident_filter.dart';
import '../../models/incident/incident_list.dart';
import '../local/constants/db_constants.dart';
import '../local/dao/incident/incident_dao.dart';
import '../network/apis/incident/incident_api.dart';

class IncidentRepository {
  // data source object
  final IncidentDao _incidentDao;

  // api objects
  final IncidentApi _incidentApi;

  IncidentRepository(this._incidentDao, this._incidentApi);

  Future<IncidentList> getIncidents(
      {required int pageNumber,
      required IncidentFilter? incidentFilter}) async {
    // check to see if Incidents are present in database, then fetch from database
    // else make a network call to get all Incidents, store them into database for
    // later use
    return await _incidentApi
        .getIncidents(pageNumber, incidentFilter)
        .then((incidentsList) {
      incidentsList.incidents?.forEach((incident) {
        _incidentDao.insertIncident(IncidentEntity.fromRemote(incident));
      });

      return incidentsList;
    }).catchError((error) => throw error);
  }

  Future<Incident> getIncidentById(String id) async {
    return await _incidentApi.getIncident(id).then((incident) {
      return incident;
    }).catchError((error) => throw error);
  }

  Future<List<Incident>> findIncidentById(int id) {
    //creating filter
    List<Filter> filters = [];

    //check to see if dataLogsType is not null
    Filter dataLogTypeFilter = Filter.equals(DBConstants.FIELD_ID, id);
    filters.add(dataLogTypeFilter);

    //making db call
    return _incidentDao
        .findAllCategoriesSortedById()
        .then((incidents) => Mappers().mapListIncidents(incidents))
        .catchError((error) => throw error);
  }

  Future<bool?> save(Incident incident) => _incidentApi
      .save(incident)
      .then((id) => id)
      .catchError((error) => throw error);

  Future<bool?> sdadWorkflowStepSubmit(Incident incident) => _incidentApi
      .saveWorkFlowStep(incident, IncidentStatusEnum.SolvedInitially)
      .then((id) => id)
      .catchError((error) => throw error);

  Future<bool?> FinalSdadWorkflowStepSubmit(Incident incident) => _incidentApi
      .saveWorkFlowStep(incident, IncidentStatusEnum.Solved)
      .then((id) => id)
      .catchError((error) => throw error);

  Future<bool?> UppingSdadWorkflowStepSubmit(Incident incident) => _incidentApi
      .saveWorkFlowStep(incident, IncidentStatusEnum.Upped)
      .then((id) => id)
      .catchError((error) => throw error);

  Future<int> insert(Incident incident) => _incidentDao
      .insertIncident(IncidentEntity.fromRemote(incident))
      .then((id) => id)
      .catchError((error) => throw error);

  Future<int> update(Incident incident) => _incidentDao
      .updateIncident(IncidentEntity.fromRemote(incident))
      .then((id) => id)
      .catchError((error) => throw error);

  Future<int> delete(Incident incident) => _incidentDao
      .updateIncident(IncidentEntity.fromRemote(incident))
      .then((id) => id)
      .catchError((error) => throw error);
}
