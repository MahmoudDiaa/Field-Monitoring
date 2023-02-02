// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CategoryDao? _categoryDaoInstance;

  IncidentDao? _incidentDaoInstance;

  PriorityDao? _priorityDaoInstance;

  SubCategoryDao? _subCategoryDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `CategoryEntity` (`id` INTEGER, `incidentsCount` INTEGER, `subCategoryCount` INTEGER, `arabicName` TEXT, `englishName` TEXT, `icon` TEXT, `order` INTEGER, `color` TEXT, `subCategories` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `IncidentTransactionEntity` (`id` TEXT, `userFullName` TEXT, `createdDate` TEXT, `statusArabicName` TEXT, `statusEnglishName` TEXT, `incidentStatusArabicName` TEXT, `incidentStatusEnglishName` TEXT, `statusColor` TEXT, `notes` TEXT, `lat` TEXT, `long` TEXT, `attachmentsCount` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `IncidentEntity` (`categoryId` INTEGER, `images` TEXT, `xFiles` TEXT, `transactions` TEXT, `amountValue` REAL, `subCategoryId` INTEGER, `amountUnitId` INTEGER, `amountUnitName` TEXT, `id` TEXT, `lat` TEXT, `long` TEXT, `notes` TEXT, `createDate` TEXT, `createHijriDate` TEXT, `createTime` TEXT, `incidentStatusArabicName` TEXT, `incidentStatusEnglishName` TEXT, `incidentStatusColor` TEXT, `incidentUnitArabicName` TEXT, `incidentUnitEnglishName` TEXT, `unitValue` REAL, `districtName` TEXT, `streetName` TEXT, `address` TEXT, `incidentCategoryArabicName` TEXT, `incidentCategoryEnglishName` TEXT, `incidentSubCategoryArabicName` TEXT, `incidentSubCategoryEnglishName` TEXT, `isNew` INTEGER, `userFullName` TEXT, `imagesCount` INTEGER, `transactonCount` INTEGER, `priority` INTEGER, `priorityTextArabic` TEXT, `priorityTextEnglish` TEXT, `incidentStatusId` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `IncidentImageEntity` (`id` INTEGER, `imageUrl` TEXT, `type` INTEGER, `isPrimary` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PriorityEntity` (`id` INTEGER, `arabicName` TEXT, `englishName` TEXT, `colorCode` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `SubCategoryEntity` (`id` INTEGER, `incidentsCount` INTEGER, `categoryId` INTEGER, `icon` TEXT, `amountUnitId` INTEGER, `amountUnitArabicName` TEXT, `amountUnitEnglishName` TEXT, `categoryArabicName` TEXT, `categoryEnglishName` TEXT, `arabicName` TEXT, `englishName` TEXT, `mainCategoryId` INTEGER, `order` INTEGER, `color` TEXT, `file` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `SubCategoryEntity` (`id` INTEGER, `incidentsCount` INTEGER, `categoryId` INTEGER, `icon` TEXT, `amountUnitId` INTEGER, `amountUnitArabicName` TEXT, `amountUnitEnglishName` TEXT, `categoryArabicName` TEXT, `categoryEnglishName` TEXT, `arabicName` TEXT, `englishName` TEXT, `mainCategoryId` INTEGER, `order` INTEGER, `color` TEXT, `file` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `SubCategoryQueryParamsEntity` (`id` INTEGER, `categoryId` INTEGER, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CategoryDao get categoryDao {
    return _categoryDaoInstance ??= _$CategoryDao(database, changeListener);
  }

  @override
  IncidentDao get incidentDao {
    return _incidentDaoInstance ??= _$IncidentDao(database, changeListener);
  }

  @override
  PriorityDao get priorityDao {
    return _priorityDaoInstance ??= _$PriorityDao(database, changeListener);
  }

  @override
  SubCategoryDao get subCategoryDao {
    return _subCategoryDaoInstance ??=
        _$SubCategoryDao(database, changeListener);
  }
}

class _$CategoryDao extends CategoryDao {
  _$CategoryDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _categoryEntityInsertionAdapter = InsertionAdapter(
            database,
            'CategoryEntity',
            (CategoryEntity item) => <String, Object?>{
                  'id': item.id,
                  'incidentsCount': item.incidentsCount,
                  'subCategoryCount': item.subCategoryCount,
                  'arabicName': item.arabicName,
                  'englishName': item.englishName,
                  'icon': item.icon,
                  'order': item.order,
                  'color': item.color,
                  'subCategories': item.subCategories
                },
            changeListener),
        _categoryEntityUpdateAdapter = UpdateAdapter(
            database,
            'CategoryEntity',
            ['id'],
            (CategoryEntity item) => <String, Object?>{
                  'id': item.id,
                  'incidentsCount': item.incidentsCount,
                  'subCategoryCount': item.subCategoryCount,
                  'arabicName': item.arabicName,
                  'englishName': item.englishName,
                  'icon': item.icon,
                  'order': item.order,
                  'color': item.color,
                  'subCategories': item.subCategories
                },
            changeListener),
        _categoryEntityDeletionAdapter = DeletionAdapter(
            database,
            'CategoryEntity',
            ['id'],
            (CategoryEntity item) => <String, Object?>{
                  'id': item.id,
                  'incidentsCount': item.incidentsCount,
                  'subCategoryCount': item.subCategoryCount,
                  'arabicName': item.arabicName,
                  'englishName': item.englishName,
                  'icon': item.icon,
                  'order': item.order,
                  'color': item.color,
                  'subCategories': item.subCategories
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CategoryEntity> _categoryEntityInsertionAdapter;

  final UpdateAdapter<CategoryEntity> _categoryEntityUpdateAdapter;

  final DeletionAdapter<CategoryEntity> _categoryEntityDeletionAdapter;

  @override
  Future<List<CategoryEntity>> findAllCategories() async {
    return _queryAdapter.queryList('SELECT * FROM category',
        mapper: (Map<String, Object?> row) => CategoryEntity(
            id: row['id'] as int?,
            incidentsCount: row['incidentsCount'] as int?,
            subCategoryCount: row['subCategoryCount'] as int?,
            arabicName: row['arabicName'] as String?,
            englishName: row['englishName'] as String?,
            icon: row['icon'] as String?,
            order: row['order'] as int?,
            color: row['color'] as String?,
            subCategories: row['subCategories'] as String?));
  }

  @override
  Future<List<CategoryEntity>> findAllCategoriesSortedById() async {
    return _queryAdapter.queryList('SELECT * FROM category ORDER BY id',
        mapper: (Map<String, Object?> row) => CategoryEntity(
            id: row['id'] as int?,
            incidentsCount: row['incidentsCount'] as int?,
            subCategoryCount: row['subCategoryCount'] as int?,
            arabicName: row['arabicName'] as String?,
            englishName: row['englishName'] as String?,
            icon: row['icon'] as String?,
            order: row['order'] as int?,
            color: row['color'] as String?,
            subCategories: row['subCategories'] as String?));
  }

  @override
  Stream<CategoryEntity?> findCategoryById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM category WHERE id = ?1',
        mapper: (Map<String, Object?> row) => CategoryEntity(
            id: row['id'] as int?,
            incidentsCount: row['incidentsCount'] as int?,
            subCategoryCount: row['subCategoryCount'] as int?,
            arabicName: row['arabicName'] as String?,
            englishName: row['englishName'] as String?,
            icon: row['icon'] as String?,
            order: row['order'] as int?,
            color: row['color'] as String?,
            subCategories: row['subCategories'] as String?),
        arguments: [id],
        queryableName: 'category',
        isView: false);
  }

  @override
  Future<int> insertCategory(CategoryEntity Category) {
    return _categoryEntityInsertionAdapter.insertAndReturnId(
        Category, OnConflictStrategy.replace);
  }

  @override
  Future<int> updateCategory(CategoryEntity category) {
    return _categoryEntityUpdateAdapter.updateAndReturnChangedRows(
        category, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteCategory(CategoryEntity category) {
    return _categoryEntityDeletionAdapter.deleteAndReturnChangedRows(category);
  }
}

class _$IncidentDao extends IncidentDao {
  _$IncidentDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _incidentEntityInsertionAdapter = InsertionAdapter(
            database,
            'IncidentEntity',
            (IncidentEntity item) => <String, Object?>{
                  'categoryId': item.categoryId,
                  'images': item.images,
                  'xFiles': item.xFiles,
                  'transactions': item.transactions,
                  'amountValue': item.amountValue,
                  'subCategoryId': item.subCategoryId,
                  'amountUnitId': item.amountUnitId,
                  'amountUnitName': item.amountUnitName,
                  'id': item.id,
                  'lat': item.lat,
                  'long': item.long,
                  'notes': item.notes,
                  'createDate': item.createDate,
                  'createHijriDate': item.createHijriDate,
                  'createTime': item.createTime,
                  'incidentStatusArabicName': item.incidentStatusArabicName,
                  'incidentStatusEnglishName': item.incidentStatusEnglishName,
                  'incidentStatusColor': item.incidentStatusColor,
                  'incidentUnitArabicName': item.incidentUnitArabicName,
                  'incidentUnitEnglishName': item.incidentUnitEnglishName,
                  'unitValue': item.unitValue,
                  'districtName': item.districtName,
                  'streetName': item.streetName,
                  'address': item.address,
                  'incidentCategoryArabicName': item.incidentCategoryArabicName,
                  'incidentCategoryEnglishName':
                      item.incidentCategoryEnglishName,
                  'incidentSubCategoryArabicName':
                      item.incidentSubCategoryArabicName,
                  'incidentSubCategoryEnglishName':
                      item.incidentSubCategoryEnglishName,
                  'isNew': item.isNew == null ? null : (item.isNew! ? 1 : 0),
                  'userFullName': item.userFullName,
                  'imagesCount': item.imagesCount,
                  'transactonCount': item.transactonCount,
                  'priority': item.priority,
                  'priorityTextArabic': item.priorityTextArabic,
                  'priorityTextEnglish': item.priorityTextEnglish,
                  'incidentStatusId': item.incidentStatusId
                },
            changeListener),
        _incidentEntityUpdateAdapter = UpdateAdapter(
            database,
            'IncidentEntity',
            ['id'],
            (IncidentEntity item) => <String, Object?>{
                  'categoryId': item.categoryId,
                  'images': item.images,
                  'xFiles': item.xFiles,
                  'transactions': item.transactions,
                  'amountValue': item.amountValue,
                  'subCategoryId': item.subCategoryId,
                  'amountUnitId': item.amountUnitId,
                  'amountUnitName': item.amountUnitName,
                  'id': item.id,
                  'lat': item.lat,
                  'long': item.long,
                  'notes': item.notes,
                  'createDate': item.createDate,
                  'createHijriDate': item.createHijriDate,
                  'createTime': item.createTime,
                  'incidentStatusArabicName': item.incidentStatusArabicName,
                  'incidentStatusEnglishName': item.incidentStatusEnglishName,
                  'incidentStatusColor': item.incidentStatusColor,
                  'incidentUnitArabicName': item.incidentUnitArabicName,
                  'incidentUnitEnglishName': item.incidentUnitEnglishName,
                  'unitValue': item.unitValue,
                  'districtName': item.districtName,
                  'streetName': item.streetName,
                  'address': item.address,
                  'incidentCategoryArabicName': item.incidentCategoryArabicName,
                  'incidentCategoryEnglishName':
                      item.incidentCategoryEnglishName,
                  'incidentSubCategoryArabicName':
                      item.incidentSubCategoryArabicName,
                  'incidentSubCategoryEnglishName':
                      item.incidentSubCategoryEnglishName,
                  'isNew': item.isNew == null ? null : (item.isNew! ? 1 : 0),
                  'userFullName': item.userFullName,
                  'imagesCount': item.imagesCount,
                  'transactonCount': item.transactonCount,
                  'priority': item.priority,
                  'priorityTextArabic': item.priorityTextArabic,
                  'priorityTextEnglish': item.priorityTextEnglish,
                  'incidentStatusId': item.incidentStatusId
                },
            changeListener),
        _incidentEntityDeletionAdapter = DeletionAdapter(
            database,
            'IncidentEntity',
            ['id'],
            (IncidentEntity item) => <String, Object?>{
                  'categoryId': item.categoryId,
                  'images': item.images,
                  'xFiles': item.xFiles,
                  'transactions': item.transactions,
                  'amountValue': item.amountValue,
                  'subCategoryId': item.subCategoryId,
                  'amountUnitId': item.amountUnitId,
                  'amountUnitName': item.amountUnitName,
                  'id': item.id,
                  'lat': item.lat,
                  'long': item.long,
                  'notes': item.notes,
                  'createDate': item.createDate,
                  'createHijriDate': item.createHijriDate,
                  'createTime': item.createTime,
                  'incidentStatusArabicName': item.incidentStatusArabicName,
                  'incidentStatusEnglishName': item.incidentStatusEnglishName,
                  'incidentStatusColor': item.incidentStatusColor,
                  'incidentUnitArabicName': item.incidentUnitArabicName,
                  'incidentUnitEnglishName': item.incidentUnitEnglishName,
                  'unitValue': item.unitValue,
                  'districtName': item.districtName,
                  'streetName': item.streetName,
                  'address': item.address,
                  'incidentCategoryArabicName': item.incidentCategoryArabicName,
                  'incidentCategoryEnglishName':
                      item.incidentCategoryEnglishName,
                  'incidentSubCategoryArabicName':
                      item.incidentSubCategoryArabicName,
                  'incidentSubCategoryEnglishName':
                      item.incidentSubCategoryEnglishName,
                  'isNew': item.isNew == null ? null : (item.isNew! ? 1 : 0),
                  'userFullName': item.userFullName,
                  'imagesCount': item.imagesCount,
                  'transactonCount': item.transactonCount,
                  'priority': item.priority,
                  'priorityTextArabic': item.priorityTextArabic,
                  'priorityTextEnglish': item.priorityTextEnglish,
                  'incidentStatusId': item.incidentStatusId
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<IncidentEntity> _incidentEntityInsertionAdapter;

  final UpdateAdapter<IncidentEntity> _incidentEntityUpdateAdapter;

  final DeletionAdapter<IncidentEntity> _incidentEntityDeletionAdapter;

  @override
  Future<List<IncidentEntity>> findAllCategories() async {
    return _queryAdapter.queryList('SELECT * FROM incident',
        mapper: (Map<String, Object?> row) => IncidentEntity(
            id: row['id'] as String?,
            lat: row['lat'] as String?,
            long: row['long'] as String?,
            notes: row['notes'] as String?,
            createDate: row['createDate'] as String?,
            createHijriDate: row['createHijriDate'] as String?,
            createTime: row['createTime'] as String?,
            incidentStatusArabicName:
                row['incidentStatusArabicName'] as String?,
            incidentStatusEnglishName:
                row['incidentStatusEnglishName'] as String?,
            incidentStatusColor: row['incidentStatusColor'] as String?,
            incidentUnitArabicName: row['incidentUnitArabicName'] as String?,
            incidentUnitEnglishName: row['incidentUnitEnglishName'] as String?,
            unitValue: row['unitValue'] as double?,
            districtName: row['districtName'] as String?,
            streetName: row['streetName'] as String?,
            address: row['address'] as String?,
            incidentCategoryArabicName:
                row['incidentCategoryArabicName'] as String?,
            incidentCategoryEnglishName:
                row['incidentCategoryEnglishName'] as String?,
            incidentSubCategoryArabicName:
                row['incidentSubCategoryArabicName'] as String?,
            incidentSubCategoryEnglishName:
                row['incidentSubCategoryEnglishName'] as String?,
            isNew: row['isNew'] == null ? null : (row['isNew'] as int) != 0,
            userFullName: row['userFullName'] as String?,
            imagesCount: row['imagesCount'] as int?,
            transactonCount: row['transactonCount'] as int?,
            priority: row['priority'] as int?,
            incidentStatusId: row['incidentStatusId'] as int?));
  }

  @override
  Future<List<IncidentEntity>> findAllCategoriesSortedById() async {
    return _queryAdapter.queryList('SELECT * FROM incident ORDER BY id',
        mapper: (Map<String, Object?> row) => IncidentEntity(
            id: row['id'] as String?,
            lat: row['lat'] as String?,
            long: row['long'] as String?,
            notes: row['notes'] as String?,
            createDate: row['createDate'] as String?,
            createHijriDate: row['createHijriDate'] as String?,
            createTime: row['createTime'] as String?,
            incidentStatusArabicName:
                row['incidentStatusArabicName'] as String?,
            incidentStatusEnglishName:
                row['incidentStatusEnglishName'] as String?,
            incidentStatusColor: row['incidentStatusColor'] as String?,
            incidentUnitArabicName: row['incidentUnitArabicName'] as String?,
            incidentUnitEnglishName: row['incidentUnitEnglishName'] as String?,
            unitValue: row['unitValue'] as double?,
            districtName: row['districtName'] as String?,
            streetName: row['streetName'] as String?,
            address: row['address'] as String?,
            incidentCategoryArabicName:
                row['incidentCategoryArabicName'] as String?,
            incidentCategoryEnglishName:
                row['incidentCategoryEnglishName'] as String?,
            incidentSubCategoryArabicName:
                row['incidentSubCategoryArabicName'] as String?,
            incidentSubCategoryEnglishName:
                row['incidentSubCategoryEnglishName'] as String?,
            isNew: row['isNew'] == null ? null : (row['isNew'] as int) != 0,
            userFullName: row['userFullName'] as String?,
            imagesCount: row['imagesCount'] as int?,
            transactonCount: row['transactonCount'] as int?,
            priority: row['priority'] as int?,
            incidentStatusId: row['incidentStatusId'] as int?));
  }

  @override
  Stream<IncidentEntity?> findIncidentById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM incident WHERE id = ?1',
        mapper: (Map<String, Object?> row) => IncidentEntity(
            id: row['id'] as String?,
            lat: row['lat'] as String?,
            long: row['long'] as String?,
            notes: row['notes'] as String?,
            createDate: row['createDate'] as String?,
            createHijriDate: row['createHijriDate'] as String?,
            createTime: row['createTime'] as String?,
            incidentStatusArabicName:
                row['incidentStatusArabicName'] as String?,
            incidentStatusEnglishName:
                row['incidentStatusEnglishName'] as String?,
            incidentStatusColor: row['incidentStatusColor'] as String?,
            incidentUnitArabicName: row['incidentUnitArabicName'] as String?,
            incidentUnitEnglishName: row['incidentUnitEnglishName'] as String?,
            unitValue: row['unitValue'] as double?,
            districtName: row['districtName'] as String?,
            streetName: row['streetName'] as String?,
            address: row['address'] as String?,
            incidentCategoryArabicName:
                row['incidentCategoryArabicName'] as String?,
            incidentCategoryEnglishName:
                row['incidentCategoryEnglishName'] as String?,
            incidentSubCategoryArabicName:
                row['incidentSubCategoryArabicName'] as String?,
            incidentSubCategoryEnglishName:
                row['incidentSubCategoryEnglishName'] as String?,
            isNew: row['isNew'] == null ? null : (row['isNew'] as int) != 0,
            userFullName: row['userFullName'] as String?,
            imagesCount: row['imagesCount'] as int?,
            transactonCount: row['transactonCount'] as int?,
            priority: row['priority'] as int?,
            incidentStatusId: row['incidentStatusId'] as int?),
        arguments: [id],
        queryableName: 'incident',
        isView: false);
  }

  @override
  Future<int> insertIncident(IncidentEntity Incident) {
    return _incidentEntityInsertionAdapter.insertAndReturnId(
        Incident, OnConflictStrategy.replace);
  }

  @override
  Future<int> updateIncident(IncidentEntity Incident) {
    return _incidentEntityUpdateAdapter.updateAndReturnChangedRows(
        Incident, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteIncident(IncidentEntity Incident) {
    return _incidentEntityDeletionAdapter.deleteAndReturnChangedRows(Incident);
  }
}

class _$PriorityDao extends PriorityDao {
  _$PriorityDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _priorityEntityInsertionAdapter = InsertionAdapter(
            database,
            'PriorityEntity',
            (PriorityEntity item) => <String, Object?>{
                  'id': item.id,
                  'arabicName': item.arabicName,
                  'englishName': item.englishName,
                  'colorCode': item.colorCode
                },
            changeListener),
        _priorityEntityUpdateAdapter = UpdateAdapter(
            database,
            'PriorityEntity',
            ['id'],
            (PriorityEntity item) => <String, Object?>{
                  'id': item.id,
                  'arabicName': item.arabicName,
                  'englishName': item.englishName,
                  'colorCode': item.colorCode
                },
            changeListener),
        _priorityEntityDeletionAdapter = DeletionAdapter(
            database,
            'PriorityEntity',
            ['id'],
            (PriorityEntity item) => <String, Object?>{
                  'id': item.id,
                  'arabicName': item.arabicName,
                  'englishName': item.englishName,
                  'colorCode': item.colorCode
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PriorityEntity> _priorityEntityInsertionAdapter;

  final UpdateAdapter<PriorityEntity> _priorityEntityUpdateAdapter;

  final DeletionAdapter<PriorityEntity> _priorityEntityDeletionAdapter;

  @override
  Future<List<PriorityEntity>> findAllCategories() async {
    return _queryAdapter.queryList('SELECT * FROM priority',
        mapper: (Map<String, Object?> row) => PriorityEntity(
            id: row['id'] as int?,
            arabicName: row['arabicName'] as String?,
            englishName: row['englishName'] as String?,
            colorCode: row['colorCode'] as String?));
  }

  @override
  Future<List<PriorityEntity>> findAllCategoriesSortedById() async {
    return _queryAdapter.queryList('SELECT * FROM priority ORDER BY id',
        mapper: (Map<String, Object?> row) => PriorityEntity(
            id: row['id'] as int?,
            arabicName: row['arabicName'] as String?,
            englishName: row['englishName'] as String?,
            colorCode: row['colorCode'] as String?));
  }

  @override
  Stream<PriorityEntity?> findPriorityById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM priority WHERE id = ?1',
        mapper: (Map<String, Object?> row) => PriorityEntity(
            id: row['id'] as int?,
            arabicName: row['arabicName'] as String?,
            englishName: row['englishName'] as String?,
            colorCode: row['colorCode'] as String?),
        arguments: [id],
        queryableName: 'priority',
        isView: false);
  }

  @override
  Future<int> insertPriority(PriorityEntity Priority) {
    return _priorityEntityInsertionAdapter.insertAndReturnId(
        Priority, OnConflictStrategy.replace);
  }

  @override
  Future<int> updatePriority(PriorityEntity Priority) {
    return _priorityEntityUpdateAdapter.updateAndReturnChangedRows(
        Priority, OnConflictStrategy.abort);
  }

  @override
  Future<int> deletePriority(PriorityEntity Priority) {
    return _priorityEntityDeletionAdapter.deleteAndReturnChangedRows(Priority);
  }
}

class _$SubCategoryDao extends SubCategoryDao {
  _$SubCategoryDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _subCategoryEntityInsertionAdapter = InsertionAdapter(
            database,
            'SubCategoryEntity',
            (SubCategoryEntity item) => <String, Object?>{
                  'id': item.id,
                  'incidentsCount': item.incidentsCount,
                  'categoryId': item.categoryId,
                  'icon': item.icon,
                  'amountUnitId': item.amountUnitId,
                  'amountUnitArabicName': item.amountUnitArabicName,
                  'amountUnitEnglishName': item.amountUnitEnglishName,
                  'categoryArabicName': item.categoryArabicName,
                  'categoryEnglishName': item.categoryEnglishName,
                  'arabicName': item.arabicName,
                  'englishName': item.englishName,
                  'mainCategoryId': item.mainCategoryId,
                  'order': item.order,
                  'color': item.color,
                  'file': item.file
                },
            changeListener),
        _subCategoryEntityUpdateAdapter = UpdateAdapter(
            database,
            'SubCategoryEntity',
            ['id'],
            (SubCategoryEntity item) => <String, Object?>{
                  'id': item.id,
                  'incidentsCount': item.incidentsCount,
                  'categoryId': item.categoryId,
                  'icon': item.icon,
                  'amountUnitId': item.amountUnitId,
                  'amountUnitArabicName': item.amountUnitArabicName,
                  'amountUnitEnglishName': item.amountUnitEnglishName,
                  'categoryArabicName': item.categoryArabicName,
                  'categoryEnglishName': item.categoryEnglishName,
                  'arabicName': item.arabicName,
                  'englishName': item.englishName,
                  'mainCategoryId': item.mainCategoryId,
                  'order': item.order,
                  'color': item.color,
                  'file': item.file
                },
            changeListener),
        _subCategoryEntityDeletionAdapter = DeletionAdapter(
            database,
            'SubCategoryEntity',
            ['id'],
            (SubCategoryEntity item) => <String, Object?>{
                  'id': item.id,
                  'incidentsCount': item.incidentsCount,
                  'categoryId': item.categoryId,
                  'icon': item.icon,
                  'amountUnitId': item.amountUnitId,
                  'amountUnitArabicName': item.amountUnitArabicName,
                  'amountUnitEnglishName': item.amountUnitEnglishName,
                  'categoryArabicName': item.categoryArabicName,
                  'categoryEnglishName': item.categoryEnglishName,
                  'arabicName': item.arabicName,
                  'englishName': item.englishName,
                  'mainCategoryId': item.mainCategoryId,
                  'order': item.order,
                  'color': item.color,
                  'file': item.file
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<SubCategoryEntity> _subCategoryEntityInsertionAdapter;

  final UpdateAdapter<SubCategoryEntity> _subCategoryEntityUpdateAdapter;

  final DeletionAdapter<SubCategoryEntity> _subCategoryEntityDeletionAdapter;

  @override
  Future<List<SubCategoryEntity>> findAllCategories() async {
    return _queryAdapter.queryList('SELECT * FROM subcategory',
        mapper: (Map<String, Object?> row) => SubCategoryEntity(
            id: row['id'] as int?,
            incidentsCount: row['incidentsCount'] as int?,
            categoryId: row['categoryId'] as int?,
            icon: row['icon'] as String?,
            amountUnitId: row['amountUnitId'] as int?,
            amountUnitArabicName: row['amountUnitArabicName'] as String?,
            amountUnitEnglishName: row['amountUnitEnglishName'] as String?,
            categoryArabicName: row['categoryArabicName'] as String?,
            categoryEnglishName: row['categoryEnglishName'] as String?,
            arabicName: row['arabicName'] as String?,
            englishName: row['englishName'] as String?,
            mainCategoryId: row['mainCategoryId'] as int?,
            order: row['order'] as int?,
            color: row['color'] as String?,
            file: row['file'] as String?));
  }

  @override
  Future<List<SubCategoryEntity>> findAllCategoriesSortedById() async {
    return _queryAdapter.queryList('SELECT * FROM subcategory ORDER BY id',
        mapper: (Map<String, Object?> row) => SubCategoryEntity(
            id: row['id'] as int?,
            incidentsCount: row['incidentsCount'] as int?,
            categoryId: row['categoryId'] as int?,
            icon: row['icon'] as String?,
            amountUnitId: row['amountUnitId'] as int?,
            amountUnitArabicName: row['amountUnitArabicName'] as String?,
            amountUnitEnglishName: row['amountUnitEnglishName'] as String?,
            categoryArabicName: row['categoryArabicName'] as String?,
            categoryEnglishName: row['categoryEnglishName'] as String?,
            arabicName: row['arabicName'] as String?,
            englishName: row['englishName'] as String?,
            mainCategoryId: row['mainCategoryId'] as int?,
            order: row['order'] as int?,
            color: row['color'] as String?,
            file: row['file'] as String?));
  }

  @override
  Stream<SubCategoryEntity?> findSubCategoryById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM subcategory WHERE id = ?1',
        mapper: (Map<String, Object?> row) => SubCategoryEntity(
            id: row['id'] as int?,
            incidentsCount: row['incidentsCount'] as int?,
            categoryId: row['categoryId'] as int?,
            icon: row['icon'] as String?,
            amountUnitId: row['amountUnitId'] as int?,
            amountUnitArabicName: row['amountUnitArabicName'] as String?,
            amountUnitEnglishName: row['amountUnitEnglishName'] as String?,
            categoryArabicName: row['categoryArabicName'] as String?,
            categoryEnglishName: row['categoryEnglishName'] as String?,
            arabicName: row['arabicName'] as String?,
            englishName: row['englishName'] as String?,
            mainCategoryId: row['mainCategoryId'] as int?,
            order: row['order'] as int?,
            color: row['color'] as String?,
            file: row['file'] as String?),
        arguments: [id],
        queryableName: 'subcategory',
        isView: false);
  }

  @override
  Future<int> insertSubCategory(SubCategoryEntity SubCategory) {
    return _subCategoryEntityInsertionAdapter.insertAndReturnId(
        SubCategory, OnConflictStrategy.replace);
  }

  @override
  Future<int> updateSubCategory(SubCategoryEntity SubCategory) {
    return _subCategoryEntityUpdateAdapter.updateAndReturnChangedRows(
        SubCategory, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteSubCategory(SubCategoryEntity SubCategory) {
    return _subCategoryEntityDeletionAdapter
        .deleteAndReturnChangedRows(SubCategory);
  }
}
