// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'priority_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PriorityStore on _PriorityStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_PriorityStore.loading'))
      .value;

  late final _$fetchPrioritiesFutureAtom =
      Atom(name: '_PriorityStore.fetchPrioritiesFuture', context: context);

  @override
  ObservableFuture<PriorityLevelList?> get fetchPrioritiesFuture {
    _$fetchPrioritiesFutureAtom.reportRead();
    return super.fetchPrioritiesFuture;
  }

  @override
  set fetchPrioritiesFuture(ObservableFuture<PriorityLevelList?> value) {
    _$fetchPrioritiesFutureAtom.reportWrite(value, super.fetchPrioritiesFuture,
        () {
      super.fetchPrioritiesFuture = value;
    });
  }

  late final _$priorityListAtom =
      Atom(name: '_PriorityStore.priorityList', context: context);

  @override
  PriorityLevelList? get priorityList {
    _$priorityListAtom.reportRead();
    return super.priorityList;
  }

  @override
  set priorityList(PriorityLevelList? value) {
    _$priorityListAtom.reportWrite(value, super.priorityList, () {
      super.priorityList = value;
    });
  }

  late final _$successAtom =
      Atom(name: '_PriorityStore.success', context: context);

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

  late final _$getPrioritiesAsyncAction =
      AsyncAction('_PriorityStore.getPriorities', context: context);

  @override
  Future<dynamic> getPriorities() {
    return _$getPrioritiesAsyncAction.run(() => super.getPriorities());
  }

  @override
  String toString() {
    return '''
fetchPrioritiesFuture: ${fetchPrioritiesFuture},
priorityList: ${priorityList},
success: ${success},
loading: ${loading}
    ''';
  }
}
