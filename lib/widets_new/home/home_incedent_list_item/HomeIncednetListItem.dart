import 'package:Field_Monitoring/models/incident/incident.dart';
import 'package:Field_Monitoring/models/incident_details/incident_details_response_entity.dart';
import 'package:Field_Monitoring/stores/incident/incident_store.dart';
import 'package:Field_Monitoring/stores/language/language_store.dart';
import 'package:Field_Monitoring/widets_new/home/home_incedent_list_item/sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../constants/images.dart';
import '../../../utils/routes/routes.dart';

class HomeIncidentListItem extends StatefulWidget {
  final LanguageStore languageStore;
  final String image, section, date, notes;
  final Incident incident;

  const HomeIncidentListItem(
      {Key? key,
      required this.image,
      required this.languageStore,
      required this.section,
      required this.date,
      required this.notes, required this.incident})
      : super(key: key);

  @override
  State<HomeIncidentListItem> createState() => _HomeIncidentListItemState();
}

class _HomeIncidentListItemState extends State<HomeIncidentListItem> {

  late IncidentStore _incidentStore;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _incidentStore = Provider.of(context);
    _incidentStore.getIncident(widget.incident.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 10,
      color: Colors.grey[200],
      child: InkWell(
        onTap: ()=>Navigator.of(context).pushNamed(Routes.incidentDetails,arguments: {"incident":_incidentStore.incident}),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(widget.image),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  sections(
                      image: homeFolder,
                      title: widget.languageStore.language.section,
                      subTitle: widget.section),
                  // SizedBox(
                  //   width: 20,
                  // ),
                  sections(
                      image: homeCalendar,
                      title: widget.languageStore.language.incidentDate,
                      subTitle: widget.date),
                  sections(
                      image: homeNotes,
                      title: widget.languageStore.language.notes,
                      subTitle: widget.notes),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
