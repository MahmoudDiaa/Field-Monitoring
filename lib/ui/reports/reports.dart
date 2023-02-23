import 'package:Field_Monitoring/stores/language/language_store.dart';
import 'package:Field_Monitoring/ui/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ReportScreen extends StatefulWidget {
  ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  late LanguageStore _languageStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _languageStore = Provider.of(context);
//
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(_languageStore.language.report),
          centerTitle: true,
          backgroundColor: CustomColor.primaryColor),
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  _languageStore.language.dailyIncidents,
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SleekCircularSlider(
                          min: 0,
                          max: 100,
                          initialValue: 80,
                        ),
                        Text(
                          "${_languageStore.language.doneDayIncidentsCount} (${80})",
                          maxLines: 2,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  
                  
                  Expanded(
                    child: Column(
                      children: [
                        SleekCircularSlider(
                          min: 0,
                          max: 100,
                          initialValue: 70,
                        ),
                        Text(
                          "${_languageStore.language.refusedDayCount} (${70})",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SleekCircularSlider(
                          min: 0,
                          max: 100,
                          initialValue: 60,
                        ),
                        Text(
                          "${_languageStore.language.allDayIncidentsCount} (${60})",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Divider(thickness: 2),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Center(
                  child: Text(
                    _languageStore.language.monthlyIncidents,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        SleekCircularSlider(
                          min: 0,
                          max: 100,
                          initialValue: 20,
                        ),
                        Text(
                          "${_languageStore.language.doneMonthIncidentsCount} (${20})",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  
                  Expanded(
                    child: Column(
                      children: [
                        SleekCircularSlider(
                          min: 0,
                          max: 100,
                          initialValue: 50,
                        ),
                        Text(
                          "${_languageStore.language.refusedMonthCount} (${50})",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SleekCircularSlider(
                          min: 0,
                          max: 100,
                          initialValue: 90,
                        ),
                        Text(
                          "${_languageStore.language.allMonthIncidentsCount} (${90})",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
