// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incident_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IncidentFormStore on _IncidentFormStore, Store {
  Computed<bool>? _$isStep1IsOkComputed;

  @override
  bool get isStep1IsOk =>
      (_$isStep1IsOkComputed ??= Computed<bool>(() => super.isStep1IsOk,
              name: '_IncidentFormStore.isStep1IsOk'))
          .value;
  Computed<bool>? _$canSubmitComputed;

  @override
  bool get canSubmit =>
      (_$canSubmitComputed ??= Computed<bool>(() => super.canSubmit,
              name: '_IncidentFormStore.canSubmit'))
          .value;
  Computed<bool>? _$canSubmitTakeActionComputed;

  @override
  bool get canSubmitTakeAction => (_$canSubmitTakeActionComputed ??=
          Computed<bool>(() => super.canSubmitTakeAction,
              name: '_IncidentFormStore.canSubmitTakeAction'))
      .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_IncidentFormStore.isLoading'))
          .value;

  late final _$incidentAtom =
      Atom(name: '_IncidentFormStore.incident', context: context);

  @override
  Incident get incident {
    _$incidentAtom.reportRead();
    return super.incident;
  }

  @override
  set incident(Incident value) {
    _$incidentAtom.reportWrite(value, super.incident, () {
      super.incident = value;
    });
  }

  late final _$savedAtom =
      Atom(name: '_IncidentFormStore.saved', context: context);

  @override
  bool get saved {
    _$savedAtom.reportRead();
    return super.saved;
  }

  @override
  set saved(bool value) {
    _$savedAtom.reportWrite(value, super.saved, () {
      super.saved = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_IncidentFormStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$saveFutureAtom =
      Atom(name: '_IncidentFormStore.saveFuture', context: context);

  @override
  ObservableFuture<bool?> get saveFuture {
    _$saveFutureAtom.reportRead();
    return super.saveFuture;
  }

  @override
  set saveFuture(ObservableFuture<bool?> value) {
    _$saveFutureAtom.reportWrite(value, super.saveFuture, () {
      super.saveFuture = value;
    });
  }

  late final _$saveAsyncAction =
      AsyncAction('_IncidentFormStore.save', context: context);

  @override
  Future<dynamic> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$workFlowStepSaveAsyncAction =
      AsyncAction('_IncidentFormStore.workFlowStepSave', context: context);

  @override
  Future<dynamic> workFlowStepSave(IncidentStatusEnum incidentStatusEnum) {
    return _$workFlowStepSaveAsyncAction
        .run(() => super.workFlowStepSave(incidentStatusEnum));
  }

  late final _$_IncidentFormStoreActionController =
      ActionController(name: '_IncidentFormStore', context: context);

  @override
  void setIncidentValue(Incident value) {
    final _$actionInfo = _$_IncidentFormStoreActionController.startAction(
        name: '_IncidentFormStore.setIncidentValue');
    try {
      return super.setIncidentValue(value);
    } finally {
      _$_IncidentFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTakeActionIncidentValue(Incident value) {
    final _$actionInfo = _$_IncidentFormStoreActionController.startAction(
        name: '_IncidentFormStore.setTakeActionIncidentValue');
    try {
      return super.setTakeActionIncidentValue(value);
    } finally {
      _$_IncidentFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateIncident(Incident value) {
    final _$actionInfo = _$_IncidentFormStoreActionController.startAction(
        name: '_IncidentFormStore.validateIncident');
    try {
      return super.validateIncident(value);
    } finally {
      _$_IncidentFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateIncidentTakeAction(Incident value) {
    final _$actionInfo = _$_IncidentFormStoreActionController.startAction(
        name: '_IncidentFormStore.validateIncidentTakeAction');
    try {
      return super.validateIncidentTakeAction(value);
    } finally {
      _$_IncidentFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
incident: ${incident},
saved: ${saved},
loading: ${loading},
saveFuture: ${saveFuture},
isStep1IsOk: ${isStep1IsOk},
canSubmit: ${canSubmit},
canSubmitTakeAction: ${canSubmitTakeAction},
isLoading: ${isLoading}
    ''';
  }
}

mixin _$IncidentFormErrorStore on _IncidentFormErrorStore, Store {
  Computed<bool>? _$hasErrorsInSubmitComputed;

  @override
  bool get hasErrorsInSubmit => (_$hasErrorsInSubmitComputed ??= Computed<bool>(
          () => super.hasErrorsInSubmit,
          name: '_IncidentFormErrorStore.hasErrorsInSubmit'))
      .value;
  Computed<bool>? _$hasErrorsInSubmitActionComputed;

  @override
  bool get hasErrorsInSubmitAction => (_$hasErrorsInSubmitActionComputed ??=
          Computed<bool>(() => super.hasErrorsInSubmitAction,
              name: '_IncidentFormErrorStore.hasErrorsInSubmitAction'))
      .value;

  late final _$incidentErrorMessageAtom = Atom(
      name: '_IncidentFormErrorStore.incidentErrorMessage', context: context);

  @override
  String? get incidentErrorMessage {
    _$incidentErrorMessageAtom.reportRead();
    return super.incidentErrorMessage;
  }

  @override
  set incidentErrorMessage(String? value) {
    _$incidentErrorMessageAtom.reportWrite(value, super.incidentErrorMessage,
        () {
      super.incidentErrorMessage = value;
    });
  }

  late final _$incidentTakeActionErrorMessageAtom = Atom(
      name: '_IncidentFormErrorStore.incidentTakeActionErrorMessage',
      context: context);

  @override
  String? get incidentTakeActionErrorMessage {
    _$incidentTakeActionErrorMessageAtom.reportRead();
    return super.incidentTakeActionErrorMessage;
  }

  @override
  set incidentTakeActionErrorMessage(String? value) {
    _$incidentTakeActionErrorMessageAtom
        .reportWrite(value, super.incidentTakeActionErrorMessage, () {
      super.incidentTakeActionErrorMessage = value;
    });
  }

  @override
  String toString() {
    return '''
incidentErrorMessage: ${incidentErrorMessage},
incidentTakeActionErrorMessage: ${incidentTakeActionErrorMessage},
hasErrorsInSubmit: ${hasErrorsInSubmit},
hasErrorsInSubmitAction: ${hasErrorsInSubmitAction}
    ''';
  }
}
