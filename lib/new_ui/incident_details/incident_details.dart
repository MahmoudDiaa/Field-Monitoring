import 'package:Field_Monitoring/models/incident_details/incident_details_response_entity.dart';
import 'package:Field_Monitoring/stores/language/language_store.dart';
import 'package:Field_Monitoring/ui/constants/colors.dart';
import 'package:Field_Monitoring/widets_new/add_incident/add_images/add_images.dart';
import 'package:Field_Monitoring/widets_new/common/default_appbar.dart';
import 'package:Field_Monitoring/widets_new/incident_details/IncidentUpdate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../components/default_button.dart';
import '../../components/default_note_text_form_field.dart';
import '../../constants/images.dart';
import '../../widets_new/home/home_incedent_list_item/sections.dart';

class IncidentDetailsScreen extends StatefulWidget {
  IncidentDetailsScreen({Key? key}) : super(key: key);

  @override
  State<IncidentDetailsScreen> createState() => _IncidentDetailsScreenState();
}

class _IncidentDetailsScreenState extends State<IncidentDetailsScreen> {
  late IncidentDetailsResponseData incident;
  late LanguageStore _languageStore;
  late ExpandableController expandableController = ExpandableController();
  int index = 0;
  TextEditingController noteController = TextEditingController();

  @override
  void didChangeDependencies() {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    incident = arguments['incident'];
    super.didChangeDependencies();
    _languageStore = Provider.of<LanguageStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(_languageStore.language.incidentDetails),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              index == 0
                  ? Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 150,
                          child: CarouselSlider(
                            items: incident.images!
                                .map((e) => CachedNetworkImage(
                                      imageUrl: e.path!,
                                      errorWidget: (
                                        BuildContext context,
                                        String url,
                                        dynamic error,
                                      ) =>
                                          Icon(Icons.error_outline),
                                    ))
                                .toList(),
                            options: CarouselOptions(
                                autoPlay: true,
                                scrollPhysics: NeverScrollableScrollPhysics()),
                          ),
                        ),
                        ExpandablePanel(
                          controller: expandableController,
                          header: InkWell(
                            onTap: () =>
                                setState(() => expandableController.toggle()),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    sectionsColumn(
                                        image: addIncidentBuilding,
                                        title: _languageStore
                                            .language.mainCategory,
                                        subTitle:
                                            incident.category!.arabicName!),
                                    Spacer(),
                                    sectionsColumn(
                                        image: homeCalendar,
                                        title: _languageStore
                                            .language.incidentDate,
                                        subTitle: incident.createDate
                                            .toString()
                                            .split(' ')[0]),
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                detailsItems(
                                    subCategoryTitle:
                                        _languageStore.language.subCategory,
                                    subCategorySubTitle:
                                        incident.subCategory!.arabicName!,
                                    priorityTitle:
                                        _languageStore.language.priority,
                                    prioritySubTitle:
                                        incident.priorityLevel!.arabicName!,
                                    amountTitle: incident.unitValue.toString(),
                                    amountSubTitle:
                                        incident.unitValue.toString(),
                                    context: context),
                                !expandableController.expanded
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            _languageStore.language
                                                .showIncidentDetailsData,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                    color: CustomColor
                                                        .lightGreenColor,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    decorationColor: CustomColor
                                                        .lightGreenColor,
                                                    decorationThickness: 1),
                                          ),
                                          Icon(
                                            Icons.expand_circle_down_outlined,
                                            color: CustomColor.lightGreenColor,
                                          )
                                        ],
                                      )
                                    : Container()
                              ],
                            ),
                          ),
                          theme: ExpandableThemeData(
                              hasIcon: false, useInkWell: true),
                          expanded: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                _languageStore.language.notes,
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                incident.notes!,
                                maxLines: 2,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(color: Colors.black),
                              ),
                              Text(
                                _languageStore.language.statusNote,
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                incident.notes!,
                                maxLines: 2,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(color: Colors.black),
                              ),
                              Text(
                                _languageStore.language.theLocation,
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                  height: 100,
                                  child: GoogleMap(
                                    initialCameraPosition: CameraPosition(
                                      target: incident.lat != null
                                          ? LatLng(double.parse(incident.lat!),
                                              double.parse(incident.long!))
                                          : LatLng(0, 0),
                                      zoom: 5,
                                    ),
                                    mapType: MapType.normal,
                                    markers: [
                                      Marker(
                                        markerId: MarkerId(incident.notes!),
                                        icon: BitmapDescriptor.defaultMarker,
                                        position: incident.lat != null
                                            ? LatLng(
                                                double.parse(incident.lat!),
                                                double.parse(incident.long!))
                                            : LatLng(0, 0),
                                      )
                                    ].toSet(),
                                  )),
                              expandableController.expanded
                                  ? InkWell(
                                      onTap: () => setState(
                                          () => expandableController.toggle()),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            _languageStore.language
                                                .hideIncidentDetailsData,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                    color: CustomColor
                                                        .lightGreenColor,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    decorationColor: CustomColor
                                                        .lightGreenColor,
                                                    decorationThickness: 1),
                                          ),
                                          Icon(
                                            Icons.arrow_circle_up_rounded,
                                            color: CustomColor.lightGreenColor,
                                          )
                                        ],
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                          collapsed: Container(),
                        ),
                        Divider(
                          thickness: 2,
                        ),
                        Text(
                          _languageStore.language.incidentUpdate,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.black),
                        ),
                        IncidentUpdate(incident: incident),
                        IncidentUpdate(incident: incident),
                      ],
                    )
                  : index == 1
                      ? AddImagesScreen(
                          languageStore: _languageStore,
                          onImageListChanged: (image) {})
                      : defaultNoteTextFormField(
                          textHint: _languageStore.language.notes,
                          controller: noteController,
                          textInputType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          onChanged: (value) {},
                          height: 200),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 120, vertical: 12),
                child: defaultButton(
                    label: index == 0
                        ? _languageStore.language.incidentSdsd
                        : index == 1
                            ? _languageStore.language.next
                            : _languageStore.language.incidentSdsd,
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
                    color: CustomColor.lightGreenColor,
                    onPressed: () {
                      setState(() {
                        index++;
                      });
                      if(index==3){


                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  detailsItems(
          {required String subCategoryTitle,
          required String subCategorySubTitle,
          required String priorityTitle,
          required String prioritySubTitle,
          required String amountTitle,
          required String amountSubTitle,
          required context}) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subCategoryTitle,
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  subCategorySubTitle,
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.black),
                )
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  priorityTitle,
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  prioritySubTitle,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.black,
                      ),
                )
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  amountTitle,
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  amountSubTitle,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.black,
                      ),
                )
              ],
            ),
          ),
        ],
      );
}
