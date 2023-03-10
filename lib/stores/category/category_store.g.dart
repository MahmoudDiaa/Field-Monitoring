// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoryStore on _CategoryStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_CategoryStore.loading'))
      .value;

  late final _$fetchCategoriesFutureAtom =
      Atom(name: '_CategoryStore.fetchCategoriesFuture', context: context);

  @override
  ObservableFuture<CategoryList?> get fetchCategoriesFuture {
    _$fetchCategoriesFutureAtom.reportRead();
    return super.fetchCategoriesFuture;
  }

  @override
  set fetchCategoriesFuture(ObservableFuture<CategoryList?> value) {
    _$fetchCategoriesFutureAtom.reportWrite(value, super.fetchCategoriesFuture,
        () {
      super.fetchCategoriesFuture = value;
    });
  }

  late final _$categoryListAtom =
      Atom(name: '_CategoryStore.categoryList', context: context);

  @override
  CategoryList? get categoryList {
    _$categoryListAtom.reportRead();
    return super.categoryList;
  }

  @override
  set categoryList(CategoryList? value) {
    _$categoryListAtom.reportWrite(value, super.categoryList, () {
      super.categoryList = value;
    });
  }

  late final _$successAtom =
      Atom(name: '_CategoryStore.success', context: context);

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

  late final _$getCategoriesAsyncAction =
      AsyncAction('_CategoryStore.getCategories', context: context);

  @override
  Future<dynamic> getCategories({bool refreshDataBeforeGetting = false}) {
    return _$getCategoriesAsyncAction.run(() => super
        .getCategories(refreshDataBeforeGetting: refreshDataBeforeGetting));
  }

  @override
  String toString() {
    return '''
fetchCategoriesFuture: ${fetchCategoriesFuture},
categoryList: ${categoryList},
success: ${success},
loading: ${loading}
    ''';
  }
}
