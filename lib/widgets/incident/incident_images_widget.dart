import 'package:Field_Monitoring/stores/language/language_store.dart';
import 'package:Field_Monitoring/utils/locale/app_localization.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/incident/incident.dart';
import 'full-screen-slider.dart';

class IncidentImagesWidget extends StatefulWidget {
  final Incident incident;

  IncidentImagesWidget({Key? key, required this.incident}) : super(key: key);

  @override
  _IncidentImagesWidgetState createState() => _IncidentImagesWidgetState();
}

class _IncidentImagesWidgetState extends State<IncidentImagesWidget> {
  late LanguageStore _languageStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _languageStore= Provider.of<LanguageStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    final double carouselHeight = MediaQuery.of(context).size.height * 0.6;
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.width,
      child: (widget.incident.images != null &&
              widget.incident.images.length > 0)
          ? Padding(
              padding: const EdgeInsets.all(
                20.0),
              child: CarouselSlider(
                options: CarouselOptions(
                    //height: 100,
                    height: carouselHeight,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    scrollDirection: Axis.vertical,
                    enableInfiniteScroll: false
                    // autoPlay: false,
                    ),
                items: widget.incident.images
                    .map((item) => Container(
                          child: InkWell(
                            child: CachedNetworkImage(
                                imageUrl: item.imageUrl ?? '',
                                fit: BoxFit.cover,
                                height: carouselHeight*0.5,
                                placeholder: (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, err) => Center(
                                    child: Text(_languageStore.language.tryLoadAgain)))

                            // Center(
                            //     child: Image.network(
                            //   item.imageUrl ?? '',
                            //   fit: BoxFit.fitWidth,
                            //   //height: 20,
                            // ))
                            ,
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => FullscreenSliderDemo(
                                        widget.incident.images,
                                        title: _languageStore.language.incidentImages,
                                      )));
                            },
                          ),
                        ))
                    .toList(),
              ),
            )
          : Center(
              child: Text(
                  _languageStore.language.noIncidentImages)),
    );
  }
}
