import 'package:boilerplate/data/local/entities/subcategory/subcategory_entity.dart';
import 'package:boilerplate/data/local/type_converter/converter.dart';
import 'package:boilerplate/models/subcategory/subcategory.dart';
import 'package:floor/floor.dart';
import 'package:boilerplate/models/category/category.dart';

@entity
class CategoryEntity {
  @primaryKey
  int? id;
  int? incidentsCount;
  int? subCategoryCount;
  String? arabicName;
  String? englishName;
  String? icon;
  int? order;
  String? color;
 String? subCategories ;

  CategoryEntity(
      {this.id,
      this.incidentsCount,
      this.subCategoryCount,
      this.arabicName,
      this.englishName,
      this.icon,
      this.order,
      this.color,
      this.subCategories});

  factory CategoryEntity.fromMap(Map<String, dynamic> json) => CategoryEntity(
      id: json['id'],
      incidentsCount: json['incidentsCount'],
      subCategoryCount: json['subCategoryCount'],
      arabicName: json['arabicName'],
      englishName: json['englishName'],
      icon: json['icon'],
      order: json['order'],
      color: json['color'],
      subCategories: Converters().convertToString((json['subCategoryList'] as List<dynamic>)
          .map((e) => SubCategoryEntity.fromMap(e))
          .toList()));
  factory CategoryEntity.fromRemote(Category category) => CategoryEntity(
      id: category.id,
      incidentsCount: category.incidentsCount,
      subCategoryCount:category.subCategoryCount,
      arabicName: category.arabicName,
      englishName:category.englishName,
      icon: category.icon,
      order: category.order,
      color: category.color,
      subCategories: Converters().convertToString(category.subCategories as List<dynamic>));

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['incidentsCount'] = this.incidentsCount;
    data['subCategoryCount'] = this.subCategoryCount;
    data['arabicName'] = this.arabicName;
    data['englishName'] = this.englishName;
    data['icon'] = this.icon;
    data['order'] = this.order;
    data['color'] = this.color;
    return data;
  }

  Category mapToRemote() => Category(
      id: id,
      incidentsCount: incidentsCount,
      arabicName: arabicName,
      englishName: englishName,
      icon: icon,
      order: order,
      color: color,
      subCategories: _changeSubCategories());

  List<SubCategory> _changeSubCategories() {
    var subCats =Converters().convertToList(subCategories!);
    List<SubCategory> data = [];
    subCats.forEach((element) {
      data.add(element.toSubCategory());
    });
    return data;
  }
}
