import 'package:Field_Monitoring/stores/incident_form/incident_form_store.dart';
import 'package:Field_Monitoring/stores/language/language_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../components/default_note_text_form_field.dart';
import '../../../models/PriorityLevels/priorrity_level.dart';
import '../../../stores/priority/priority_store.dart';
import '../../../ui/constants/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddDetailsScreen extends StatefulWidget {
  final LanguageStore languageStore;

  final ValueChanged<PriorityLevel> onChangePriority;
  final ValueChanged<String> onChangeNote;
  final ValueChanged<String> onChangeUnitValue;
  final ValueChanged<Position> onChangeLocation;

  final IncidentFormStore incidentFormStore;

  AddDetailsScreen(this.languageStore, this.incidentFormStore,
      {Key? key,
      required this.onChangePriority,
      required this.onChangeNote,
      required this.onChangeUnitValue,
      required this.onChangeLocation})
      : super(key: key);

  @override
  State<AddDetailsScreen> createState() => _AddDetailsScreenState();
}

class _AddDetailsScreenState extends State<AddDetailsScreen> {
  final TextEditingController unitValueController = TextEditingController();

  final TextEditingController notes = TextEditingController();
  late PriorityStore _priorityStore;
  PriorityLevel? _selectedPriority;
  @observable
  Position? currentLocation;
  GoogleMapController? mapController; //contrller for Google map

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _priorityStore = Provider.of(context);
    if (!_priorityStore.loading) {
      await _priorityStore.getPriorities();
      Geolocator.getLastKnownPosition().then((value) {
        setState(() {
          currentLocation = value;
        });
        print("current position$currentLocation");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        defaultNoteTextFormField(
            textHint: widget.incidentFormStore.incident.amountUnitName ?? '',
            controller: unitValueController,
            onChanged: (value) {

              widget.onChangeUnitValue(value);
            },
            textInputType: TextInputType.phone,

            suffixWidget: Text(widget.incidentFormStore.incident.amountUnitName!
                    .substring(0, 5) ??
                ''),
            validate: (value) {
              if (value == null ||
                  value.isEmpty ||
                  value.contains(RegExp(r'^[a-zA-Z\-]'))) {
                return 'Use only numbers!';
              }
              return null;
            }),
        defaultNoteTextFormField(
            textHint: widget.languageStore.language.notes,
            controller: notes,
            textInputType: TextInputType.text,
            textInputAction: TextInputAction.done,
            onChanged: (value) {
              widget.onChangeNote(value);
            },
            height: 200),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Text(widget.languageStore.language.choosePriority),
        ),
        Observer(
            builder: (context) => _priorityStore.priorityList != null
                ? SizedBox(
                    height:
                        60.0 * _priorityStore.priorityList!.priorities!.length,
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:
                            _priorityStore.priorityList!.priorities?.length,
                        itemBuilder: (BuildContext context, int index) =>
                            RadioListTile<PriorityLevel>(
                              title: Text(
                                widget.languageStore.locale == "ar"
                                    ? _priorityStore.priorityList!
                                        .priorities![index].arabicName!
                                    : _priorityStore.priorityList!
                                        .priorities![index].arabicName!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: Colors.black),
                              ),
                              value: _priorityStore
                                  .priorityList!.priorities![index],
                              activeColor: CustomColor.lightGreenColor,
                              selectedTileColor: CustomColor.lightGreenColor,
                              groupValue: _selectedPriority,
                              onChanged: (priority) {
                                setState(() {
                                  widget.onChangePriority(priority!);
                                  _selectedPriority = priority;
                                });
                              },
                            )),
                  )
                : Center(child: CircularProgressIndicator())),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Text(widget.languageStore.language.theLocation),
        ),
        Observer(
          builder: (context) => currentLocation != null
              ? SizedBox(
                  height: 100,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: currentLocation != null
                          ? LatLng(currentLocation!.latitude,
                              currentLocation!.longitude)
                          : LatLng(0.0, 0),
                      zoom: 5,
                    ),
                    mapType: MapType.normal,
                    markers: [
                      Marker(
                        markerId: MarkerId(currentLocation.toString()),
                        icon: BitmapDescriptor.defaultMarker,
                        position: currentLocation != null
                            ? LatLng(currentLocation!.latitude,
                                currentLocation!.longitude)
                            : LatLng(0, 0),
                      )
                    ].toSet(),
                    onMapCreated: (GoogleMapController controller) {
                      setState(() {
                        mapController = controller;
                      });
                    },
                  ))
              : Container(
                  child: Center(
                    child: Text(widget
                        .languageStore.language.noLocationPermissionAllowed),
                  ),
                ),
        )
      ],
    );
  }
}
