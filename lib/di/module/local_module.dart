import 'dart:async';

import 'package:Field_Monitoring/data/local/constants/db_constants.dart';
import 'package:Field_Monitoring/data/local/database.dart';
import 'package:Field_Monitoring/utils/encryption/xxtea.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
@Injectable()
abstract class LocalModule {



  /// A singleton preference provider.
  ///
  /// Calling it multiple times will return the same instance.
  @Singleton()
  static Future<SharedPreferences> provideSharedPreferences() {
    return SharedPreferences.getInstance();
  }

  /// A singleton database provider.
  ///
  /// Calling it multiple times will return the same instance.
  ///
  @Singleton()
  static Future<AppDatabase> provideDatabase()   {


    // Key for encryption
    var encryptionKey = "";
    // Get a platform-specific directory where persistent app data can be stored
    // final appDocumentDir = await getApplicationDocumentsDirectory();

    // Path with the form: /platform-specific-directory/demo.db
    // final dbPath = join(appDocumentDir.path, DBConstants.DB_NAME);

    // Check to see if encryption is set, then provide codec
    // else init normal db with path
    var database;
    if (encryptionKey.isNotEmpty) {
      // Initialize the encryption codec with a user password
      var codec = getXXTeaCodec(password: encryptionKey);
      database =  $FloorAppDatabase.databaseBuilder(DBConstants.DB_NAME).build();
    } else {
      database =  $FloorAppDatabase.databaseBuilder(DBConstants.DB_NAME).build();
    }
    // Return database instance
    return database;
  }

  @Singleton()
  static AppLocalizations provideLang(BuildContext context)=>AppLocalizations.of(context)!;


}
