import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  Category? _selectedCategory;
  int? _selectedSubCatIndex;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    _selectedCategory = widget.categories.first;
    super.initState();
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
              children: widget.categories
                  .map((category) => Column(
                        children: [
                          ListTile(
                            title: Text(
                              category.arabicName!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.black),
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
                          ),
                          Observer(
                              builder: (context) => _selectedCategory!.id ==
                                      category.id
                                  ? Container(
                                      height:
                                          40.0 * category.subCategories!.length,
                                      color:
                                          CustomColor.listBackgroundGreyColor,
                                      child: ListView.builder(
                                        itemCount:
                                            category.subCategories!.length,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder:
                                            (BuildContext context, int index) =>
                                                Container(
                                          color: _selectedSubCatIndex != null &&
                                                  _selectedSubCatIndex == index
                                              ? CustomColor.moreLightGreenColor
                                              : CustomColor
                                                  .listBackgroundGreyColor,
                                          height: 40,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 40, vertical: 8),
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                _selectedSubCatIndex = index;
                                                widget.callback(
                                                    {category: category.subCategories![index]});
                                              });
                                            },
                                            child: Row(
                                              children: [
                                                Text(category
                                                    .subCategories![index]
                                                    .arabicName!),
                                                Spacer(),
                                                _selectedSubCatIndex != null &&
                                                        _selectedSubCatIndex ==
                                                            index
                                                    ? SvgPicture.asset(
                                                        addIncidentCheck)
                                                    : Container()
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      height: 0,
                                      width: 0,
                                    )),
                          category.id !=
                                  widget
                                      .categories[widget.categories.length - 1]
                                      .id
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
