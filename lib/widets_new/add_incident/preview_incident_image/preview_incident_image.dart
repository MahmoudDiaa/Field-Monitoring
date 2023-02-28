import 'dart:io';

import 'package:Field_Monitoring/ui/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../stores/language/language_store.dart';

class PreviewIncidentImage extends StatelessWidget {
  final XFile image;
  final LanguageStore languageStore;

  PreviewIncidentImage(this.image, {Key? key, required this.languageStore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: CustomColor.listBackgroundGreyColor,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: FileImage(
                    File(
                      image.path,
                    ),
                  )),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            ),
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Spacer(),
                InkWell(
                    child: Row(
                  children: [
                    Icon(
                      Icons.repeat_rounded,
                      color: CustomColor.lightGreenColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(languageStore.language.change,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black))
                  ],
                )),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: VerticalDivider(thickness: 1, color: Colors.grey),
                ),
                Spacer(),
                InkWell(
                    child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      languageStore.language.delete,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    )
                  ],
                )),
                Spacer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
