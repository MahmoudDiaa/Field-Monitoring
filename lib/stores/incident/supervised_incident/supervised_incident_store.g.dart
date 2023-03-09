// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supervised_incident_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SupervisedIncidentStore on _SupervisedIncidentStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_SupervisedIncidentStore.loading'))
      .value;
  Computed<bool>? _$loadingMoreComputed;

  @override
  bool get loadingMore =>
      (_$loadingMoreComputed ??= Computed<bool>(() => super.loadingMore,
              name: '_SupervisedIncidentStore.loadingMore'))
          .value;
  Computed<bool>? _$gettingIncidentComputed;

  @override
  bool get gettingIncident =>
      (_$gettingIncidentComputed ??= Computed<bool>(() => super.gettingIncident,
              name: '_SupervisedIncidentStore.gettingIncident'))
          .value;

  late final _$fetchIncidentsFutureAtom = Atom(
      name: '_SupervisedIncidentStore.fetchIncidentsFuture', context: context);

  @override
  ObservableFuture<IncidentList?> get fetchIncidentsFuture {
    _$fetchIncidentsFutureAtom.reportRead();
    return super.fetchIncidentsFuture;
  }

  @override
  set fetchIncidentsFuture(ObservableFuture<IncidentList?> value) {
    _$fetchIncidentsFutureAtom.reportWrite(value, super.fetchIncidentsFuture,
        () {
      super.fetchIncidentsFuture = value;
    });
  }

  late final _$fetchMoreIncidentsFutureAtom = Atom(
      name: '_SupervisedIncidentStore.fetchMoreIncidentsFuture',
      context: context);

  @override
  ObservableFuture<IncidentList?> get fetchMoreIncidentsFuture {
    _$fetchMoreIncidentsFutureAtom.reportRead();
    return super.fetchMoreIncidentsFuture;
  }

  @override
  set fetchMoreIncidentsFuture(ObservableFuture<IncidentList?> value) {
    _$fetchMoreIncidentsFutureAtom
        .reportWrite(value, super.fetchMoreIncidentsFuture, () {
      super.fetchMoreIncidentsFuture = value;
    });
  }

  late final _$fetchIncidentFutureAtom = Atom(
      name: '_SupervisedIncidentStore.fetchIncidentFuture', context: context);

  @override
  ObservableFuture<IncidentDetailsResponseData?> get fetchIncidentFuture {
    _$fetchIncidentFutureAtom.reportRead();
    return super.fetchIncidentFuture;
  }

  @override
  set fetchIncidentFuture(
      ObservableFuture<IncidentDetailsResponseData?> value) {
    _$fetchIncidentFutureAtom.reportWrite(value, super.fetchIncidentFuture, () {
      super.fetchIncidentFuture = value;
    });
  }

  late final _$incidentListAtom =
      Atom(name: '_SupervisedIncidentStore.incidentList', context: context);

  @override
  IncidentList? get incidentList {
    _$incidentListAtom.reportRead();
    return super.incidentList;
  }

  @override
  set incidentList(IncidentList? value) {
    _$incidentListAtom.reportWrite(value, super.incidentList, () {
      super.incidentList = value;
    });
  }

  late final _$incidentAtom =
      Atom(name: '_SupervisedIncidentStore.incident', context: context);

  @override
  IncidentDetailsResponseData? get incident {
    _$incidentAtom.reportRead();
    return super.incident;
  }

  @override
  set incident(IncidentDetailsResponseData? value) {
    _$incidentAtom.reportWrite(value, super.incident, () {
      super.incident = value;
    });
  }

  late final _$successAtom =
      Atom(name: '_SupervisedIncidentStore.success', context: context);

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  late final _$getIncidentsAsyncAction =
      AsyncAction('_SupervisedIncidentStore.getIncidents', context: context);

  @override
  Future<dynamic> getIncidents({IncidentFilter? incidentFilter}) {
    return _$getIncidentsAsyncAction
        .run(() => super.getIncidents(incidentFilter: incidentFilter));
  }

  late final _$getMoreAsyncAction =
      AsyncAction('_SupervisedIncidentStore.getMore', context: context);

  @override
  Future<dynamic> getMore({IncidentFilter? incidentFilter}) {
    return _$getMoreAsyncAction
        .run(() => super.getMore(incidentFilter: incidentFilter));
  }

  late final _$getIncidentAsyncAction =
      AsyncAction('_SupervisedIncidentStore.getIncident', context: context);

  @override
  Future<dynamic> getIncident(String id) {
    return _$getIncidentAsyncAction.run(() => super.getIncident(id));
  }

  @override
  String toString() {
    return '''
fetchIncidentsFuture: ${fetchIncidentsFuture},
fetchMoreIncidentsFuture: ${fetchMoreIncidentsFuture},
fetchIncidentFuture: ${fetchIncidentFuture},
incidentList: ${incidentList},
incident: ${incident},
success: ${success},
loading: ${loading},
loadingMore: ${loadingMore},
gettingIncident: ${gettingIncident}
    ''';
  }
}
