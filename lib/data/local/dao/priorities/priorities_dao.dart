
import 'package:floor/floor.dart';

import '../../constants/db_constants.dart';
import '../../entities/priorities/priority_entity.dart';

@dao
abstract class PriorityDao {
  @Query('SELECT * FROM ${DBConstants.Priority_STORE_NAME}')
  Future<List<PriorityEntity>> findAllCategories();

  @Query('SELECT * FROM ${DBConstants.Priority_STORE_NAME} ORDER BY ${DBConstants.FIELD_ID} ')
  Future<List<PriorityEntity>> findAllCategoriesSortedById();

  @Query('SELECT * FROM ${DBConstants.Priority_STORE_NAME} WHERE id = :id')
  Stream<PriorityEntity?> findPriorityById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertPriority(PriorityEntity Priority);

  @update
  Future<int> updatePriority(PriorityEntity Priority);

  @delete
  Future<int> deletePriority(PriorityEntity Priority);
}