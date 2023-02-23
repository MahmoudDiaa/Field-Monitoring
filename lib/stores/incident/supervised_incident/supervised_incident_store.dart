import 'package:Field_Monitoring/data/respository/incident_repository.dart';
import 'package:Field_Monitoring/stores/error/error_store.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../models/incident/incident.dart';
import '../../../models/incident/incident_filter.dart';
import '../../../models/incident/incident_list.dart';
import '../../../utils/dio/dio_error_util.dart';

part 'supervised_incident_store.g.dart';

class SupervisedIncidentStore = _SupervisedIncidentStore
    with _$SupervisedIncidentStore;

@Singleton()
abstract class _SupervisedIncidentStore with Store {
  // repository instance
  final IncidentRepository _incidentRepository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _SupervisedIncidentStore(this._incidentRepository);

  static ObservableFuture<IncidentList?> emptyIncidentResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<IncidentList?> fetchIncidentsFuture =
      ObservableFuture<IncidentList?>(emptyIncidentResponse);

  @observable
  ObservableFuture<IncidentList?> fetchMoreIncidentsFuture =
      ObservableFuture<IncidentList?>(emptyIncidentResponse);

  @observable
  ObservableFuture<Incident?> fetchIncidentFuture =
      ObservableFuture<Incident?>(ObservableFuture.value(null));

  @observable
  IncidentList? incidentList;

  @observable
  Incident? incident;

  @observable
  bool success = false;

  @computed
  bool get loading => fetchIncidentsFuture.status == FutureStatus.pending;

  @computed
  bool get loadingMore =>
      fetchMoreIncidentsFuture.status == FutureStatus.pending;

  @computed
  bool get gettingIncident =>
      fetchIncidentFuture.status == FutureStatus.pending;

  int _pageNumber = 1;

  @action
  Future getIncidents({IncidentFilter? incidentFilter}) async {
    this._pageNumber = 1;
    final future = _incidentRepository.getIncidents(
        pageNumber: _pageNumber, incidentFilter: incidentFilter);
    fetchIncidentsFuture = ObservableFuture(future);
    future.then((incidentList) {
      if (incidentList.incidents!.length > 0) _pageNumber++;
      this.incidentList = incidentList;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }

  @action
  Future getMore({IncidentFilter? incidentFilter}) async {
    final future = _incidentRepository.getIncidents(
        pageNumber: _pageNumber, incidentFilter: incidentFilter);
    fetchMoreIncidentsFuture = ObservableFuture(future);
    future.then((incidentList) {
      if (incidentList.incidents!.length > 0) _pageNumber++;
      if (this.incidentList == null)
        this.incidentList = incidentList;
      else {
        this.incidentList!.appendItems(incidentList.incidents ?? <Incident>[]);
        this.incidentList = this.incidentList;
      }
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }

  @action
  Future getIncident(String id) async {
    final future = _incidentRepository.getIncidentById(id);
    fetchIncidentFuture = ObservableFuture(future);
    future.then((incident) {
      this.incident = incident;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }
}
