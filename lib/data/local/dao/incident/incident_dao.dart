// dao/person_dao.dart

import 'package:floor/floor.dart';

import '../../constants/db_constants.dart';
import '../../entities/incident/incident_entity.dart';

@dao
abstract class IncidentDao {
  @Query('SELECT * FROM ${DBConstants.Incident_STORE_NAME}')
  Future<List<IncidentEntity>> findAllCategories();

  @Query('SELECT * FROM ${DBConstants.Incident_STORE_NAME} ORDER BY ${DBConstants.FIELD_ID} ')
  Future<List<IncidentEntity>> findAllCategoriesSortedById();

  @Query('SELECT * FROM ${DBConstants.Incident_STORE_NAME} WHERE id = :id')
  Stream<IncidentEntity?> findIncidentById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertIncident(IncidentEntity Incident);

  @update
  Future<int> updateIncident(IncidentEntity Incident);

  @delete
  Future<int> deleteIncident(IncidentEntity Incident);
}