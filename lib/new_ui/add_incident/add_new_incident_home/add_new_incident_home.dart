import 'package:Field_Monitoring/ui/constants/colors.dart';
import 'package:Field_Monitoring/widets_new/add_incident/choose_category/choose_category.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../components/default_search_text_form_filed.dart';
import '../../../stores/category/category_store.dart';
import '../../../stores/language/language_store.dart';

class AddNewIncidentHome extends StatefulWidget {
  const AddNewIncidentHome({Key? key}) : super(key: key);

  @override
  State<AddNewIncidentHome> createState() => _AddNewIncidentHomeState();
}

class _AddNewIncidentHomeState extends State<AddNewIncidentHome> {
  late LanguageStore _languageStore;
  TextEditingController searchController = TextEditingController();
  late CategoryStore _categoryStore;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _languageStore = Provider.of(context);
    _categoryStore = Provider.of<CategoryStore>(context);

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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          EasyStepper(
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
              activeStep: 0,
              finishedStepBackgroundColor: CustomColor.lightGreenColor,
              finishedStepIconColor: CustomColor.lightGreenColor,
              steps: [
                EasyStep(
                    icon: Icon(Icons.circle_outlined, color: Colors.black),
                    title: _languageStore.language.chooseCategory),
                EasyStep(
                    icon: Icon(Icons.circle_outlined, color: Colors.black),
                    title: _languageStore.language.images),
                EasyStep(
                    icon: Icon(
                      Icons.circle_outlined,
                      color: Colors.black,
                    ),
                    title: _languageStore.language.details)
              ]),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: defaultSearchTextFormField(
                textHint: _languageStore.language.search,
                suffixIcon: Icons.search,
                controller: searchController,
                textInputType: TextInputType.text),
          ),
          Observer(
            builder: (context) => _categoryStore.categoryList != null &&
                    _categoryStore.categoryList?.categories != null
                ? ChooseCategory(
                    categories: _categoryStore.categoryList!.categories!,languageStore: _languageStore,)
                : CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
