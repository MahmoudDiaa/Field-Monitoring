
import 'package:Field_Monitoring/data/local/entities/user_roles/user_roles.dart';
import 'package:floor/floor.dart';

import '../../constants/db_constants.dart';

@dao
abstract class UserRolesDao {
  @Query('SELECT * FROM ${DBConstants.UserRoles_STORE_NAME}')
  Future<List<UserRolesEntity>> findAllUserRoles();

  @Query('SELECT * FROM ${DBConstants.UserRoles_STORE_NAME} ORDER BY ${DBConstants.FIELD_ID} ')
  Future<List<UserRolesEntity>> findAllUserRolesSortedById();

  @Query('SELECT * FROM ${DBConstants.UserRoles_STORE_NAME} WHERE id = :id')
  Stream<UserRolesEntity?> findUserRolesById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertUserRoles(UserRolesEntity userRolesEntity);

  @update
  Future<int> updateUserRoles(UserRolesEntity userRolesEntity);

  @delete
  Future<int> deleteUserRoles(UserRolesEntity userRolesEntity);
}