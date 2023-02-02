// dao/person_dao.dart

import 'package:boilerplate/data/local/entities/category/category_entity.dart';
import 'package:floor/floor.dart';

import '../../constants/db_constants.dart';

@dao
abstract class CategoryDao {
  @Query('SELECT * FROM ${DBConstants.Categories_STORE_NAME}')
  Future<List<CategoryEntity>> findAllCategories();

  @Query('SELECT * FROM ${DBConstants.Categories_STORE_NAME} ORDER BY ${DBConstants.FIELD_ID} ')
  Future<List<CategoryEntity>> findAllCategoriesSortedById();

  @Query('SELECT * FROM ${DBConstants.Categories_STORE_NAME} WHERE id = :id')
  Stream<CategoryEntity?> findCategoryById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertCategory(CategoryEntity Category);

  @update
  Future<int> updateCategory(CategoryEntity category);

  @delete
  Future<int> deleteCategory(CategoryEntity category);
}