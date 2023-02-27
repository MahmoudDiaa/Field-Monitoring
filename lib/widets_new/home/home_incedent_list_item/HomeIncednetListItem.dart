import 'package:Field_Monitoring/stores/language/language_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/images.dart';

class HomeIncidentListItem extends StatelessWidget {
  final LanguageStore languageStore;
  final String image, section, date, notes;

  const HomeIncidentListItem(
      {Key? key,
      required this.image,
      required this.languageStore,
      required this.section,
      required this.date,
      required this.notes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 10,
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(image),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row(
                //   children: [
                //
                //   ],
                // ),

                sections(
                    image: homeFolder,
                    title: languageStore.language.section,
                    subTitle: section),
                // SizedBox(
                //   width: 20,
                // ),
                sections(
                    image: homeCalendar,
                    title: languageStore.language.incidentDate,
                    subTitle: date),
                sections(
                    image: homeNotes,
                    title: languageStore.language.notes,
                    subTitle: notes),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget sections({
    required String image,
    required String title,
    required String subTitle,
  }) =>
      Row(
        children: [
          SvgPicture.asset(image),
          SizedBox(
            width: 4,
          ),
          Text(
            "${title}: ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(subTitle)
        ],
      );
}
