import 'dart:async';

import 'package:boilerplate/data/local/constants/db_constants.dart';
import 'package:boilerplate/data/local/database.dart';
import 'package:boilerplate/utils/encryption/xxtea.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalModule {


  /// A singleton preference provider.
  ///
  /// Calling it multiple times will return the same instance.
  static Future<SharedPreferences> provideSharedPreferences() {
    return SharedPreferences.getInstance();
  }

  /// A singleton database provider.
  ///
  /// Calling it multiple times will return the same instance.
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
}
