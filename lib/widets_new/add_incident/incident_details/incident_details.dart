import 'dart:io';

import 'package:Field_Monitoring/models/incident/incident.dart';
import 'package:Field_Monitoring/stores/language/language_store.dart';
import 'package:Field_Monitoring/ui/constants/colors.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../constants/images.dart';

class IncidentDetailsScreen extends StatelessWidget {
  final LanguageStore languageStore;
  final Incident incident;

  const IncidentDetailsScreen(
      {Key? key, required this.languageStore, required this.incident})
      : super(key: key);

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
              languageStore.language.incidentSendDone,
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
          Text(languageStore.language.reviewIncident),
          SizedBox(
            height: 12,
          ),
          detailsItems(
              firstTitle: languageStore.language.mainCategory,
              firstSubTitle: incident.incidentCategoryArabicName ??
                  languageStore.language.home_tv_no_post_found,
              secondTitle: languageStore.language.subCategory,
              secondSubTitle: incident.incidentSubCategoryArabicName ??
                  languageStore.language.home_tv_no_post_found,
              context: context),
          detailsItems(
              firstTitle: incident.amountUnitName ??
                  languageStore.language.home_tv_no_post_found,
              firstSubTitle: incident.amountValue.toString(),
              secondTitle: languageStore.language.priority,
              secondSubTitle:
                  incident.priorityTextArabic ?? incident.priority.toString(),
              context: context),
          SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 12,
          ),
          itemSpaced(data: languageStore.language.notes),
          itemSpaced(
            data: incident.notes!,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.black),
          ),
          SizedBox(
            height: 12,
          ),
          itemSpaced(data: languageStore.language.images),
          incident.imagesFiles.isNotEmpty
              ? CarouselSlider(
                  items: incident.imagesFiles
                      .map((e) => Image.file(File(e.finalize())))
                      .toList(),
                  options: CarouselOptions(
                      autoPlay: true,
                      scrollPhysics: NeverScrollableScrollPhysics()),
                )
              : Text(languageStore.language.cannotGetImage),
          itemSpaced(data: languageStore.language.theLocation),
          SizedBox(
            height: 12,
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
                        ? LatLng(double.parse(incident.lat!),
                            double.parse(incident.long!))
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
