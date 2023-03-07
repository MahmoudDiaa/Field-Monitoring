import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobx/mobx.dart';

import '../../../components/default_search_text_form_filed.dart';
import '../../../constants/images.dart';
import '../../../models/category/category.dart';
import '../../../models/subcategory/subcategory.dart';
import '../../../stores/language/language_store.dart';
import '../../../ui/constants/colors.dart';

class ChooseCategory extends StatefulWidget {
  final List<Category> categories;
  final LanguageStore languageStore;
  final ValueChanged<Map<Category, SubCategory>> callback;

  ChooseCategory(
      {Key? key,
      required this.categories,
      required this.languageStore,
      required this.callback})
      : super(key: key);

  @override
  State<ChooseCategory> createState() => _ChooseCategoryState();
}

class _ChooseCategoryState extends State<ChooseCategory> {
  @observable
  Category? _selectedCategory;
  int? _selectedSubCatIndex;
  TextEditingController searchController = TextEditingController();

  List<Category> categories = <Category>[];
  Map<int, String> categoriesImages = {
    5: addIncidentRoads,
    6: addIncidentBuilding,
    7: addIncidentLighting,
    8: addIncidentSideWalk,
    9: addIncidentCleaning,
    10: addIncidentSigns,
  };

  @override
  void initState() {
    super.initState();
    categories = widget.categories.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: defaultSearchTextFormField(
              textHint: widget.languageStore.language.search,
              suffixIcon: Icons.search,
              controller: searchController,
              onChanged: (String value) {
                if (value.isNotEmpty) {
                  categories
                      .map((e) => e.subCategories!.forEach((element) {
                            element.show = element.arabicName!.contains(value);
                          }))
                      .toList();
                } else {
                  categories
                      .map((e) => e.subCategories!.forEach((element) {
                            element.show = true;
                          }))
                      .toList();
                }
                setState(() => categories);
              },
              textInputType: TextInputType.text),
        ),
        Container(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12),
              color: CustomColor.categoryBackground),
          child: SingleChildScrollView(
            child: Column(
              children: categories
                  .map((category) => Column(
                        children: [
                          //radio button
                          category.isShow()
                              ? ListTile(
                                  title: Row(
                                    children: [
                                      SvgPicture.asset(
                                          categoriesImages[category.id!]!),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        category.arabicName!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  leading: Radio<Category>(
                                    value: category,
                                    focusColor: CustomColor.lightGreenColor,
                                    hoverColor: CustomColor.lightGreenColor,
                                    activeColor: CustomColor.lightGreenColor,
                                    fillColor: MaterialStateProperty.all(
                                        CustomColor.lightGreenColor),
                                    groupValue: _selectedCategory,
                                    onChanged: (category) {
                                      setState(() {
                                        _selectedSubCatIndex = null;
                                        _selectedCategory = category;
                                      });
                                    },
                                  ),
                                )
                              : SizedBox(),
                          //subcategory list
                          Observer(
                              builder: (context) => _selectedCategory != null &&
                                      _selectedCategory!.id == category.id &&
                                      category.subCategories!
                                              .listFilterLength() >
                                          0
                                  ? Container(
                                      height: 45.0 *
                                          category.subCategories!
                                              .listFilterLength(),
                                      color:
                                          CustomColor.listBackgroundGreyColor,
                                      child: ListView.builder(
                                        itemCount:
                                            category.subCategories!.length,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (BuildContext context,
                                                int index) =>
                                            category.subCategories![index].show
                                                ? InkWell(
                                                    onTap: () => setState(() {
                                                      _selectedSubCatIndex =
                                                          index;
                                                      widget.callback({
                                                        category: category
                                                                .subCategories![
                                                            index]
                                                      });
                                                    }),
                                                    child: Container(
                                                      color: _selectedSubCatIndex !=
                                                                  null &&
                                                              _selectedSubCatIndex ==
                                                                  index
                                                          ? CustomColor
                                                              .moreLightGreenColor
                                                          : CustomColor
                                                              .listBackgroundGreyColor,
                                                      height: 45,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 40,
                                                              vertical: 8),
                                                      child: Row(
                                                        children: [
                                                          Text(category
                                                              .subCategories![
                                                                  index]
                                                              .arabicName!),
                                                          Spacer(),
                                                          _selectedSubCatIndex !=
                                                                      null &&
                                                                  _selectedSubCatIndex ==
                                                                      index
                                                              ? SvgPicture.asset(
                                                                  addIncidentCheck)
                                                              : Container()
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : SizedBox(),
                                      ),
                                    )
                                  : Container(
                                      height: 0,
                                      width: 0,
                                    )),
                          category.id != categories[categories.length - 1].id &&
                                  category.isShow()
                              ? Divider(
                                  thickness: 1,
                                  color: Colors.grey[300],
                                )
                              : Container()
                        ],
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
