
import 'package:floor/floor.dart';

import '../../constants/db_constants.dart';
import '../../entities/subcategory/subcategory_entity.dart';

@dao
abstract class SubCategoryDao {
  @Query('SELECT * FROM ${DBConstants.SubCategory_STORE_NAME}')
  Future<List<SubCategoryEntity>> findAllCategories();

  @Query('SELECT * FROM ${DBConstants.SubCategory_STORE_NAME} ORDER BY ${DBConstants.FIELD_ID} ')
  Future<List<SubCategoryEntity>> findAllCategoriesSortedById();

  @Query('SELECT * FROM ${DBConstants.SubCategory_STORE_NAME} WHERE id = :id')
  Stream<SubCategoryEntity?> findSubCategoryById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertSubCategory(SubCategoryEntity SubCategory);

  @update
  Future<int> updateSubCategory(SubCategoryEntity SubCategory);

  @delete
  Future<int> deleteSubCategory(SubCategoryEntity SubCategory);
}