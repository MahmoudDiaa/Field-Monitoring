import 'package:Field_Monitoring/models/incident/incident.dart';
import 'package:Field_Monitoring/models/incident_details/incident_details_response_entity.dart';
import 'package:Field_Monitoring/stores/language/language_store.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:provider/provider.dart';

import '../../ui/constants/colors.dart';

class IncidentUpdate extends StatefulWidget {
  final IncidentDetailsResponseData incident;

  const IncidentUpdate({Key? key, required this.incident}) : super(key: key);

  @override
  State<IncidentUpdate> createState() => _IncidentUpdateState();
}

class _IncidentUpdateState extends State<IncidentUpdate> {
  late LanguageStore _languageStore;
ExpandableController expandableController=ExpandableController();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _languageStore = Provider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      controller: expandableController,
      theme: ExpandableThemeData(
        hasIcon: false,
        useInkWell: true,tapHeaderToExpand: false
      ),
      collapsed: Container(),
      expanded: Row(
        children: [
          Expanded(
            flex: 1,
            child: Dash(
                direction: Axis.vertical,
                length: 250,
                dashLength: 12,
                dashColor: Colors.grey),
          ),
          Expanded(
            flex: 14,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _languageStore.language.statusNote,
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  widget.incident.notes!,
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.black),
                ),
                Text(
                  _languageStore.language.notes,
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  widget.incident.notes!,
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.black),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Colors.blue),
                  height: MediaQuery.of(context).size.height / 8,
                  child: CarouselSlider(
                    items: widget.incident.images
                        !.map((e) => Image.network(e.path!))
                        .toList(),
                    options: CarouselOptions(
                        autoPlay: true,
                        scrollPhysics: NeverScrollableScrollPhysics()),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      header: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Dash(
                  direction: Axis.vertical,
                  length: 75,
                  dashLength: 12,
                  dashColor: Colors.grey),
              Container(
                width: 25,
                child: Center(
                    child: Text(
                  "1",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
                height: 25,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 25,
                  decoration: BoxDecoration(color: Colors.red),
                  child: Center(
                    child: Text(
                      "تم التسديد",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Text("form 2 days")
              ],
            ),
          ),
          Spacer(),
          expandableController.expanded
              ? InkWell(
                  onTap: () => setState(() => expandableController.toggle()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _languageStore.language.hideIncidentDetailsData,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: CustomColor.lightGreenColor,
                            decoration: TextDecoration.underline,
                            decorationColor: CustomColor.lightGreenColor,
                            decorationThickness: 1),
                      ),
                      Icon(
                        Icons.arrow_circle_up_rounded,
                        color: CustomColor.lightGreenColor,
                      )
                    ],
                  ),
                )
              : InkWell(
            onTap: () => setState(() => expandableController.toggle()),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _languageStore.language.showIncidentDetailsData,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: CustomColor.lightGreenColor,
                            decoration: TextDecoration.underline,
                            decorationColor: CustomColor.lightGreenColor,
                            decorationThickness: 1),
                      ),
                      Icon(
                        Icons.expand_circle_down_outlined,
                        color: CustomColor.lightGreenColor,
                      )
                    ],
                  ),
              )
        ],
      ),
    );
  }
}
