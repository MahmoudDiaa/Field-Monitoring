import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_stepper/easy_stepper.dart';

import '../../models/incident/incident.dart';

class IncidentDetailsScreen extends StatefulWidget {
  final Incident incident;

  IncidentDetailsScreen({Key? key, required this.incident}) : super(key: key);

  @override
  State<IncidentDetailsScreen> createState() => _IncidentDetailsScreenState();
}

class _IncidentDetailsScreenState extends State<IncidentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height/4,
            child: CarouselSlider(
              items: widget.incident.imagesFiles
                  .map((e) => Image.network(''))
                  .toList(),
              options: CarouselOptions(
                  autoPlay: true, scrollPhysics: NeverScrollableScrollPhysics()),
            ),
          )
        ],
      ),
    );
  }
}
