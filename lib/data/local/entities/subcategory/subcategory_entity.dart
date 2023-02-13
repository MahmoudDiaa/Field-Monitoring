import 'package:Field_Monitoring/models/subcategory/subcategory.dart';
import 'package:floor/floor.dart';


@entity
class SubCategoryEntity {
  @PrimaryKey(autoGenerate: false)
  int? id;
  int? incidentsCount;
  int? categoryId;
  String? icon;
  int? amountUnitId;
  String? amountUnitArabicName;
  String? amountUnitEnglishName;
  String? categoryArabicName;
  String? categoryEnglishName;
  String? arabicName;
  String? englishName;
  int? mainCategoryId;
  int? order;
  String? color;
  String? file;



  SubCategoryEntity(
      {this.id,
      this.incidentsCount,
      this.categoryId,
      this.icon,
      this.amountUnitId,
      this.amountUnitArabicName,
      this.amountUnitEnglishName,
      this.categoryArabicName,
      this.categoryEnglishName,
      this.arabicName,
      this.englishName,
      this.mainCategoryId,
      this.order,
      this.color,
      this.file});

  factory SubCategoryEntity.fromMap(Map<String, dynamic> json) =>
      SubCategoryEntity(
        id: json['id'],
        incidentsCount: json['incidentsCount'],
        categoryId: json['categoryId'],
        icon: json['icon'],
        amountUnitId: json['amountUnitId'],
        amountUnitArabicName: json['amountUnitArabicName'],
        amountUnitEnglishName: json['amountUnitEnglishName'],
        categoryArabicName: json['categoryArabicName'],
        categoryEnglishName: json['categoryEnglishName'],
        arabicName: json['arabicName'],
        englishName: json['englishName'],
        mainCategoryId: json['mainCategoryId'],
        order: json['order'],
        color: json['color'],
        file: json['file'],
      );

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['incidentsCount'] = this.incidentsCount;
    data['categoryId'] = this.categoryId;
    data['icon'] = this.icon;
    data['amountUnitId'] = this.amountUnitId;
    data['amountUnitArabicName'] = this.amountUnitArabicName;
    data['amountUnitEnglishName'] = this.amountUnitEnglishName;
    data['categoryArabicName'] = this.categoryArabicName;
    data['categoryEnglishName'] = this.categoryEnglishName;
    data['arabicName'] = this.arabicName;
    data['englishName'] = this.englishName;
    data['mainCategoryId'] = this.mainCategoryId;
    data['order'] = this.order;
    data['color'] = this.color;
    data['file'] = this.file;
    return data;
  }
  factory SubCategoryEntity.fromRemote(SubCategory subCategory) => SubCategoryEntity(
    id: subCategory.id,
    incidentsCount: subCategory.incidentsCount,
    categoryId: subCategory.categoryId,
    icon: subCategory.icon,
    amountUnitId: subCategory.amountUnitId,
    amountUnitArabicName: subCategory.amountUnitArabicName,
    amountUnitEnglishName: subCategory.amountUnitEnglishName,
    categoryArabicName: subCategory.categoryArabicName,
    categoryEnglishName: subCategory.categoryEnglishName,
    arabicName: subCategory.arabicName,
    englishName: subCategory.englishName,
    mainCategoryId: subCategory.mainCategoryId,
    order: subCategory.order,
    color: subCategory.color,
    file: subCategory.file,
  );
  SubCategory toSubCategory() => SubCategory(
        id: id,
        incidentsCount: incidentsCount,
        icon: icon,
        amountUnitId: amountUnitId,
        amountUnitArabicName: amountUnitArabicName,
        amountUnitEnglishName: amountUnitEnglishName,
        categoryArabicName: categoryArabicName,
        categoryEnglishName: categoryEnglishName,
        arabicName: arabicName,
        englishName: englishName,
        mainCategoryId: mainCategoryId,
        order: order,
        color: color,
        file: file);

}
