import 'package:floor/floor.dart';

@entity
class SubCategoryQueryParamsEntity {
  @primaryKey
  int? id ;
  int? categoryId;

  SubCategoryQueryParamsEntity({this.categoryId});
}
