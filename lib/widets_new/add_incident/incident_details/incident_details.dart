import 'dart:io';

import 'package:Field_Monitoring/models/incident/incident.dart';
import 'package:Field_Monitoring/stores/language/language_store.dart';
import 'package:Field_Monitoring/ui/constants/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../../../constants/images.dart';

class IncidentDetailsWidget extends StatefulWidget {
  final LanguageStore languageStore;
  final Incident incident;

  const IncidentDetailsWidget(
      {Key? key, required this.languageStore, required this.incident})
      : super(key: key);

  @override
  State<IncidentDetailsWidget> createState() => _IncidentDetailsWidgetState();
}

class _IncidentDetailsWidgetState extends State<IncidentDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              widget.languageStore.language.incidentSendDone,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: CustomColor.lightGreenColor),
            ),
          ),
          SvgPicture.asset(addIncidentDone),
          SizedBox(
            height: 20,
          ),
          Divider(thickness: 2),
          Text(widget.languageStore.language.reviewIncident),
          SizedBox(
            height: 12,
          ),
          detailsItems(
              firstTitle: widget.languageStore.language.mainCategory,
              firstSubTitle: widget.incident.incidentCategoryArabicName ??
                  widget.languageStore.language.home_tv_no_post_found,
              secondTitle: widget.languageStore.language.subCategory,
              secondSubTitle: widget.incident.incidentSubCategoryArabicName ??
                  widget.languageStore.language.home_tv_no_post_found,
              context: context),
          detailsItems(
              firstTitle: widget.incident.amountUnitName ??
                  widget.languageStore.language.home_tv_no_post_found,
              firstSubTitle: widget.incident.amountValue.toString(),
              secondTitle: widget.languageStore.language.priority,
              secondSubTitle: widget.incident.priorityTextArabic ??
                  widget.incident.priority.toString(),
              context: context),
          SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 12,
          ),
          itemSpaced(data: widget.languageStore.language.notes),
          itemSpaced(
            data: widget.incident.notes!,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.black),
          ),
          SizedBox(
            height: 12,
          ),
          itemSpaced(data: widget.languageStore.language.images),
          widget.incident.imagesFiles.isNotEmpty
              ? CarouselSlider(
                  items: widget.incident.imagesFiles.map((e) {
                    Widget image = Container();

                    // /data/user/0/com.iotecksolutions.flutter_Field_Monitoring_orbits/cache/scaled_IMG_20230302_165739.jpg

                    image = Image.file(File(
                        "/data/user/0/com.iotecksolutions.flutter_Field_Monitoring_orbits/cache/${e.filename!}"));

                    return image;
                  }).toList(),
                  options: CarouselOptions(
                      autoPlay: true,
                      scrollPhysics: NeverScrollableScrollPhysics()),
                )
              : Text(widget.languageStore.language.cannotGetImage),
          itemSpaced(data: widget.languageStore.language.theLocation),
          SizedBox(
            height: 12,
          ),
          SizedBox(
              height: 100,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: widget.incident.lat != null
                      ? LatLng(double.parse(widget.incident.lat!),
                          double.parse(widget.incident.long!))
                      : LatLng(0, 0),
                  zoom: 5,
                ),
                mapType: MapType.normal,
                markers: [
                  Marker(
                    markerId: MarkerId(widget.incident.notes!),
                    icon: BitmapDescriptor.defaultMarker,
                    position: widget.incident.lat != null
                        ? LatLng(double.parse(widget.incident.lat!),
                            double.parse(widget.incident.long!))
                        : LatLng(0, 0),
                  )
                ].toSet(),
              ))
        ],
      ),
    );
  }

  detailsItems(
          {required String firstTitle,
          required String firstSubTitle,
          required String secondTitle,
          required String secondSubTitle,
          context}) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(firstTitle),
                Text(
                  firstSubTitle,
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
            width: MediaQuery.of(context).size.width / 2.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(secondTitle),
                Text(
                  secondSubTitle,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.black,
                      ),
                )
              ],
            ),
          )
        ],
      );

  itemSpaced({required String data, TextStyle? style}) => Row(
        children: [
          Text(
            data,
            style: style,
          ),
          Spacer(),
        ],
      );
}
