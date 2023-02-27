import 'package:Field_Monitoring/components/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/images.dart';
import '../../../models/category/category.dart';
import '../../../stores/language/language_store.dart';
import '../../../ui/constants/colors.dart';

class ChooseCategory extends StatefulWidget {
  final List<Category> categories;
  final LanguageStore languageStore;

  ChooseCategory(
      {Key? key, required this.categories, required this.languageStore})
      : super(key: key);

  @override
  State<ChooseCategory> createState() => _ChooseCategoryState();
}

class _ChooseCategoryState extends State<ChooseCategory> {
  Category? _selectedCategory;
  int? _selectedSubCat;

  @override
  void initState() {
    _selectedCategory = widget.categories.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(

      alignment: Alignment.bottomCenter,
      children: [
        Container(
          constraints: BoxConstraints(maxHeight: 500),
          padding: EdgeInsets.only(left:20,right: 20,top: 8, bottom: 8),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[200]),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
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
                                      _selectedSubCat = null;
                                      _selectedCategory = category;
                                    });
                                  },
                                ),
                              ),
                              Observer(
                                  builder: (context) => _selectedCategory!.id ==
                                          category.id
                                      ? Container(
                                          height: 200,
                                          color: Colors.grey[300],
                                          child: ListView.builder(
                                            itemCount:
                                                category.subCategories!.length,
                                            physics: NeverScrollableScrollPhysics(),
                                            itemBuilder:
                                                (BuildContext context, int index) =>
                                                    Expanded(
                                              child: Container(
                                                color: _selectedSubCat != null &&
                                                        _selectedSubCat == index
                                                    ? CustomColor
                                                        .moreLightGreenColor
                                                    : Colors.grey[300],
                                                height: 40,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 40, vertical: 8),
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() =>
                                                        _selectedSubCat = index);
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Text(category
                                                          .subCategories![index]
                                                          .arabicName!),
                                                      Spacer(),
                                                      _selectedSubCat != null &&
                                                              _selectedSubCat ==
                                                                  index
                                                          ? SvgPicture.asset(
                                                              addIncidentCheck)
                                                          : Container()
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(
                                          height: 0,
                                          width: 0,
                                        )),
                              _selectedSubCat != widget.categories.length - 1
                                  ? Divider(
                                      thickness: 1,
                                      color: Colors.grey,
                                    )
                                  : Container()
                            ],
                          ))
                      .toList(),
                ),

              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 20,bottom: 10),
          child: defaultButton(
              label: widget.languageStore.language.next,
              textStyle: Theme.of(context).textTheme.bodyMedium,
              color: CustomColor.lightGreenColor,
              onPressed: () {}),
        ),
      ],
    );
  }
}
