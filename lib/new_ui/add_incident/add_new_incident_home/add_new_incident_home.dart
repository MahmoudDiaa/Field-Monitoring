import 'package:Field_Monitoring/models/incident/incident.dart';
import 'package:Field_Monitoring/ui/constants/colors.dart';
import 'package:Field_Monitoring/widets_new/add_incident/add_images/add_images.dart';
import 'package:Field_Monitoring/widets_new/add_incident/choose_category/choose_category.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:dio/dio.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import '../../../models/category/category.dart' as cat;

import '../../../components/default_button.dart';
import '../../../constants/images.dart';
import '../../../models/PriorityLevels/priorrity_level.dart';
import '../../../stores/category/category_store.dart';
import '../../../stores/incident_form/incident_form_store.dart';
import '../../../stores/language/language_store.dart';
import '../../../utils/routes/routes.dart';
import '../../../widets_new/add_incident/add_details/add_details_screen.dart';
import '../../../widets_new/add_incident/incident_details/incident_details.dart';

class AddNewIncidentHome extends StatefulWidget {
  const AddNewIncidentHome({Key? key}) : super(key: key);

  @override
  State<AddNewIncidentHome> createState() => _AddNewIncidentHomeState();
}

class _AddNewIncidentHomeState extends State<AddNewIncidentHome> {
  late LanguageStore _languageStore;
  late CategoryStore _categoryStore;
  late IncidentFormStore _incidentFormStore;
  int currentStepperIndex = 0;
  Category? selectedCategory;
  bool subCategoryDone = false;
  bool imageDone = false;
  bool noteDone = false;

  final ScrollController _controller = ScrollController();

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _languageStore = Provider.of(context);
    _categoryStore = Provider.of<CategoryStore>(context);
    _incidentFormStore = Provider.of(context);

    // check to see if already called api
    if (!_categoryStore.loading) {
      await _categoryStore.getCategories();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.close),
            )
          ],
          title: Text(_languageStore.language.addNewIncident),
          toolbarHeight: 100,
          backgroundColor: CustomColor.primaryColor),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        controller: _controller,
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: EasyStepper(
                      lineDotRadius: 1,
                      stepRadius: 20,
                      enableStepTapping: false,
                      lineType: LineType.normal,
                      lineColor: Colors.grey,
                      activeStepBorderColor: CustomColor.lightGreenColor,
                      activeStepTextColor: CustomColor.lightGreenColor,
                      borderThickness: 2,
                      showStepBorder: false,
                      lineLength: 100,
                      defaultStepBorderType: BorderType.normal,
                      padding: 10,
                      activeStepBackgroundColor: CustomColor.lightGreenColor,
                      activeStep: currentStepperIndex,
                      finishedStepBackgroundColor: CustomColor.lightGreenColor,
                      finishedStepIconColor: CustomColor.lightGreenColor,
                      steps: [
                        EasyStep(
                            icon: Icon(Icons.circle_outlined,
                                color: Colors.black),
                            title: _languageStore.language.chooseCategory),
                        EasyStep(
                            icon: Icon(Icons.circle_outlined,
                                color: Colors.black),
                            title: _languageStore.language.images),
                        EasyStep(
                            icon: Icon(
                              Icons.circle_outlined,
                              color: Colors.black,
                            ),
                            title: _languageStore.language.details)
                      ]),
                ),

                Expanded(
                  flex: 7,
                  child: Observer(
                    builder: (context) => _categoryStore.categoryList != null &&
                            _categoryStore.categoryList?.categories != null &&
                            currentStepperIndex == 0
                        ? ChooseCategory(
                            categories:
                                _categoryStore.categoryList!.categories!,
                            languageStore: _languageStore,
                            callback: (categoryMap) {
                              //
                              _incidentFormStore
                                      .incident.incidentCategoryArabicName =
                                  categoryMap.entries.first.key.arabicName;
                              _incidentFormStore
                                      .incident.incidentSubCategoryArabicName =
                                  categoryMap.entries.first.value.arabicName;

                              _incidentFormStore.incident.categoryId =
                                  categoryMap.entries.first.key.id!;

                              _incidentFormStore.incident.subCategoryId =
                                  categoryMap.entries.first.value.id;
                              _incidentFormStore.incident.amountUnitId =
                                  categoryMap.entries.first.value.amountUnitId;
                              _incidentFormStore.incident.amountUnitName =
                                  categoryMap.entries.first.value
                                      .localizedUnitName(_languageStore.locale);
                              subCategoryDone =
                                  _incidentFormStore.incident.subCategoryId !=
                                      null;
                            })
                        : currentStepperIndex == 1
                            ? AddImagesScreen(
                                imageMaxHeight: 500,
                                imageMaxWidth: 500,
                                imageQuality: 100,
                                languageStore: _languageStore,
                                onImageListChanged:
                                    (List<MultipartFile> value) {
                                  _incidentFormStore.incident.imagesFiles =
                                      value;
                                  imageDone = _incidentFormStore
                                          .incident.imagesFiles.length >
                                      0;
                                },
                              )
                            : currentStepperIndex == 2
                                ? AddDetailsScreen(
                                    _languageStore,
                                    _incidentFormStore,
                                    onChangePriority: (PriorityLevel value) {
                                      _incidentFormStore.incident.priority =
                                          value.id;
                                      _incidentFormStore
                                              .incident.priorityTextArabic =
                                          value.arabicName;
                                    },
                                    onChangeNote: (String value) {
                                      _incidentFormStore.incident.notes = value;
                                    },
                                    onChangeUnitValue: (String value) {
                                      print("onChangeUnitValue $value");
                                      _incidentFormStore.incident.amountValue =
                                          int.parse(value);
                                      noteDone = true;
                                    },
                                    onChangeLocation: (Position value) {
                                      _incidentFormStore.incident.lat =
                                          value.latitude.toString();
                                      _incidentFormStore.incident.long =
                                          value.longitude.toString();
                                      noteDone = true;
                                    },
                                  )
                                : currentStepperIndex == 3
                                    ? IncidentDetailsWidget(
                                        languageStore: _languageStore,
                                        incident: _incidentFormStore.incident,
                                      )
                                    : Center(
                                        child: Container(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator()),
                                      ),
                  ),
                ),
                // Spacer(),
                Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentStepperIndex != 0 ? prevButton() : Container(),
                        SizedBox(
                          width: 10,
                        ),
                        nextButton(),
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget nextButton() => Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 10),
        child: Container(
          width: 140,
          child: defaultButton(
              label: currentStepperIndex == 2
                  ? _languageStore.language.send
                  : currentStepperIndex == 3
                      ? _languageStore.language.addNewIncident
                      : _languageStore.language.next,
              startIcon: currentStepperIndex == 2
                  ? addIncidentSend
                  : currentStepperIndex == 3
                      ? null
                      : addIncidentLeftArrow,
              textStyle: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white),
              color: CustomColor.lightGreenColor,
              onPressed: () {
                setState(() {
                  if ((subCategoryDone || imageDone) &&
                      currentStepperIndex <= 1) {
                    currentStepperIndex++;
                    _controller.animateTo(
                      _controller.position.minScrollExtent,
                      duration: Duration(seconds: 1),
                      curve: Curves.fastOutSlowIn,
                    );
                  } else if (!subCategoryDone && currentStepperIndex == 0) {
                    _showErrorMessage(
                        _languageStore.language.categoryIsMandatory);
                  } else if (subCategoryDone &&
                      currentStepperIndex == 1 &&
                      !imageDone) {
                    _showErrorMessage(_languageStore.language.pickUpImage);
                  } else if (subCategoryDone &&
                      imageDone &&
                      _isNoteDone() &&
                      currentStepperIndex == 2) {
                    _incidentFormStore.save().then((value) {
                      // _showDoneMessage("تمت اضافة البلاغ بنجاح");
                      setState(() {
                        currentStepperIndex++;
                      });
                    });
                  }else if(currentStepperIndex==2){

                    _showErrorMessage(_languageStore.language.login_error_fill_fields);
                  }
                  else if(currentStepperIndex==3){
                    _incidentFormStore.incident=Incident();
                    setState(() {
                      currentStepperIndex==0;
                    });


                  }
                });
              }),
        ),
      );

  Widget prevButton() => Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 10),
        child: Container(
          width: 140,
          child: defaultButton(
              borderColor: CustomColor.lightGreenColor,
              label: currentStepperIndex == 3
                  ? _languageStore.language.returnHome
                  : _languageStore.language.previous,
              textStyle: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: CustomColor.lightGreenColor),
              color: Colors.white,
              onPressed: () {
                if (currentStepperIndex > 0)
                  setState(() {
                    currentStepperIndex--;
                  });
                if(currentStepperIndex==3){
                  Navigator.of(context).pushReplacementNamed(Routes.home);

                }
              }),
        ),
      );

  _showDoneMessage(String message) {
    if (message.isNotEmpty) {
      Future.delayed(Duration(milliseconds: 0), () {
        if (message.isNotEmpty) {
          FlushbarHelper.createSuccess(
            message: message,
            title: _languageStore.language.incidentFinish,
            duration: Duration(seconds: 3),
          )..show(context);
        }
      });
    }
    Future.delayed(Duration(seconds: 1),
        () => Navigator.of(context).pushReplacementNamed(Routes.home));
  }

  bool _isNoteDone() {
    Incident incident = _incidentFormStore.incident;
    return incident.lat != null &&
        incident.long != null &&
        incident.lat!.isNotEmpty &&
        incident.long!.isNotEmpty &&
        incident.notes != null &&
        incident.notes!.isNotEmpty &&
        incident.amountValue != null &&
        incident.priority != null;
  }

  _showErrorMessage(String message) {
    if (message.isNotEmpty) {
      Future.delayed(Duration(milliseconds: 0), () {
        if (message.isNotEmpty) {
          FlushbarHelper.createSuccess(
            message: message,
            title: _languageStore.language.incidentFinish,
            duration: Duration(seconds: 3),
          )..show(context);
        }
      });
    }
    Future.delayed(Duration(seconds: 1),
        () => Navigator.of(context).pushReplacementNamed(Routes.home));
  }
}
