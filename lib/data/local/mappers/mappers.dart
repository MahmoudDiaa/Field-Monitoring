import 'package:Field_Monitoring/data/local/entities/incident/incident_entity.dart';
import 'package:Field_Monitoring/data/local/entities/priorities/priority_entity.dart';
import 'package:Field_Monitoring/data/local/entities/subcategory/subcategory_entity.dart';
import 'package:Field_Monitoring/data/local/entities/user_roles/user_roles.dart';
import 'package:Field_Monitoring/models/PriorityLevels/priorrity_level.dart';
import 'package:Field_Monitoring/models/incident/incident.dart';
import 'package:Field_Monitoring/models/subcategory/subcategory.dart';

import '../../../models/category/category.dart';
import '../../network/api_response_new_entity.dart';
import '../entities/category/category_entity.dart';



//this  class made to map list of data base to the remote once created by Diaa
class Mappers {
  List<Category> mapListCategories(List<CategoryEntity> categoriesEntity) {
    List<Category> categories = [];

    categoriesEntity.forEach((element) {
      categories.add(element.mapToRemote());
    });

    return categories;
  }

  List<Incident> mapListIncidents(List<IncidentEntity> incidentsEntity) {
    List<Incident> incidents = [];
    incidentsEntity.forEach((element) {
      incidents.add(element.toRemote());
    });

    return incidents;
  }

  List<PriorityLevel> mapListPriorities(List<PriorityEntity> prioritiesEntity) {
    List<PriorityLevel> priorities = [];

    prioritiesEntity.forEach((element) {
      priorities.add(element.toRemote());
    });

    return priorities;
  }

  List<SubCategory> mapListSubCategories(
      List<SubCategoryEntity> subCategoriesEntity) {
    List<SubCategory> categories = [];
    subCategoriesEntity.forEach((element) {
      categories.add(element.toSubCategory());
    });

    return categories;
  }

  List<ApiResponseNewUserUserRoles> mapListApiUserRoles(
      List<UserRolesEntity> userRoles) {
    List<ApiResponseNewUserUserRoles> apiUserRoles = [];
    userRoles.forEach((element) {
      apiUserRoles.add(element.toRemote());
    });

    return apiUserRoles;
  }
}
