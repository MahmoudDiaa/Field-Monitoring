import 'package:Field_Monitoring/data/repository.dart';
import 'package:Field_Monitoring/models/language/Language.dart';
import 'package:Field_Monitoring/stores/error/error_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:mobx/mobx.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';


part 'language_store.g.dart';

class LanguageStore = _LanguageStore with _$LanguageStore;

abstract class _LanguageStore with Store {
  static const String TAG = "LanguageStore";

  // repository instance
  final Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // supported languages
  List<Language> supportedLanguages = AppLocalizations.supportedLocales
      .map((e) => Language(code: e.countryCode,language: e.languageCode,locale: e.toString()))
      .toList();

  // constructor:---------------------------------------------------------------
  _LanguageStore(Repository repository) : this._repository = repository {
    // init();
  }

  // store variables:-----------------------------------------------------------
  @observable
  String _locale = "en";

  @computed
  String get locale => _locale;

   late AppLocalizations language;

  // actions:-------------------------------------------------------------------
  @action
  void changeLanguage(String value,BuildContext context) {
    _locale = value;
    _repository.changeLanguage(value).then((_) {
      // write additional logic here
    });
  }

  @action
  String getCode() {
    var code;
    if (_locale == 'ar') {
      code = "EG";
    } else if (_locale == 'en') {
      code = "US";
    }
    // else if (_locale == 'da') {
    //   code = "DK";
    // }

    // else if (_locale == 'es') {
    //   code = "ES";
    // }

    return code;
  }
  // general:-------------------------------------------------------------------
  void init(BuildContext ctx)  {
    language = AppLocalizations.of(ctx)!;
    // getting current language from shared preference
    if (_repository.currentLanguage != null) {
      _locale = _repository.currentLanguage!;

    }
  }

  // dispose:-------------------------------------------------------------------
  @override
  dispose() {}
}
