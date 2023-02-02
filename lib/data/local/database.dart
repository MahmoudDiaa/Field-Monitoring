// database.dart

// required package imports
import 'dart:async';
import 'package:boilerplate/data/local/dao/category/category_dao.dart';
import 'package:boilerplate/data/local/dao/incident/incident_dao.dart';
import 'package:boilerplate/data/local/dao/subcategory/subcategory_dao.dart';
import 'package:boilerplate/data/local/entities/category/category_entity.dart';
import 'package:boilerplate/data/local/entities/incident/incident_entity.dart';
import 'package:boilerplate/data/local/entities/incident/incident_image_entity.dart';
import 'package:boilerplate/data/local/entities/incident/transaction/incident_transaction_entity.dart';
import 'package:boilerplate/data/local/entities/priorities/priority_entity.dart';
import 'package:boilerplate/data/local/entities/subcategory/subcategory_entity.dart';
import 'package:boilerplate/data/local/entities/subcategory/subcategory_query_params_entity.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/priorities/priorities_dao.dart';



part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [CategoryEntity,IncidentTransactionEntity,IncidentEntity,IncidentImageEntity,
  PriorityEntity,SubCategoryEntity,SubCategoryEntity,SubCategoryQueryParamsEntity])
abstract class AppDatabase extends FloorDatabase {

  CategoryDao get  categoryDao;
  IncidentDao get  incidentDao;
  PriorityDao get  priorityDao;
  SubCategoryDao get  subCategoryDao;

}