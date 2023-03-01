import 'package:Field_Monitoring/ui/constants/colors.dart';
import 'package:Field_Monitoring/widets_new/add_incident/add_images/add_images.dart';
import 'package:Field_Monitoring/widets_new/add_incident/choose_category/choose_category.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../components/default_button.dart';
import '../../../constants/images.dart';
import '../../../stores/category/category_store.dart';
import '../../../stores/incident_form/incident_form_store.dart';
import '../../../stores/language/language_store.dart';
import '../../../widets_new/add_incident/add_details/add_details_screen.dart';

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
                                imageQuality:100 ,
                                languageStore: _languageStore,
                                onImageListChanged: (List<XFile> value) {},
                              )
                            : currentStepperIndex==2?AddDetailsScreen( _languageStore,_incidentFormStore ):Center(
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
              label: _languageStore.language.next,
              startIcon: addIncidentLeftArrow,
              textStyle: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white),
              color: CustomColor.lightGreenColor,
              onPressed: () {
                setState(() {
                  if ((subCategoryDone || imageDone)&&currentStepperIndex<=2) currentStepperIndex++;
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
              label: _languageStore.language.previous,
              textStyle: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: CustomColor.lightGreenColor),
              color: Colors.white,
              onPressed: () {
                if(currentStepperIndex>0)
                setState(() {
                  currentStepperIndex--;
                });
              }),
        ),
      );
}
