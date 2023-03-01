import 'package:Field_Monitoring/stores/incident_form/incident_form_store.dart';
import 'package:Field_Monitoring/stores/language/language_store.dart';
import 'package:flutter/material.dart';

import '../../../components/default_note_text_form_field.dart';

class AddDetailsScreen extends StatelessWidget {
  final LanguageStore languageStore;

  final IncidentFormStore incidentFormStore;

  AddDetailsScreen(this.languageStore, this.incidentFormStore, {Key? key})
      : super(key: key);
  final TextEditingController unitValue = TextEditingController();
  final TextEditingController notes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        defaultNoteTextFormField(
            textHint: incidentFormStore.incident.unitValue.toString()??'',
            controller: unitValue,
            textInputType: TextInputType.text,
            suffixWidget: Text('km')),
        defaultNoteTextFormField(
            textHint: languageStore.language.notes,
            controller: notes,
            textInputType: TextInputType.text,
            height: 200)
      ],
    );
  }
}
