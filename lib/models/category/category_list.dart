import 'package:floor/floor.dart';

import 'category.dart';
@entity
class CategoryList {
   List<Category>? categories;

  CategoryList({
    this.categories,
  });

  bool get isThereData {
    return this.categories != null && this.categories!.length > 0;
  }

  factory CategoryList.fromJson(List<dynamic> json) {
    List<Category> categories = <Category>[];
    categories = json.map((post) => Category.fromMap(post)).toList();

    return CategoryList(
      categories: categories,
    );
  }
}
