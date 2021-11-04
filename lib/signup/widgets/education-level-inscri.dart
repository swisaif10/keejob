import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:keejob_mobile/injector.dart';
import 'package:keejob_mobile/jobs/search/bloc/education_level_bloc/search_education_level_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/education_level_bloc/search_education_level_event.dart';
import 'package:keejob_mobile/jobs/search/bloc/education_level_bloc/search_education_level_state.dart';
import 'package:keejob_mobile/shared/form_validators.dart';

class EducationLevelWidget extends StatelessWidget {
 final  Map<String, dynamic> _backendErrors = {};
  EducationLevelWidget(_backendErrors);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchEducationLevelBloc>(
        create: (_) => Injector.resolve<SearchEducationLevelBloc>()
          ..add(GetEducationLevelList()),
        child: BlocBuilder<SearchEducationLevelBloc,
            SearchEducationLevelListState>(builder: (context, state) {
          return state.when(initial: () {
            return Center();
          }, success: (search) {
            if (search!.isEmpty) {
              return Center(
                child: Text('no search'),
              );
            }
            return FormBuilderDropdown(
              decoration: InputDecoration(labelText: 'Niveau d\'études'),
              validator: FormBuilderValidators.compose([
                CustomerFormValidator.backendValidation(
                  context,
                  backendErrors: _backendErrors,
                  fieldName: 'degree_level',
                ),
              ]),
              items: search.entries.map((entry) {
                return DropdownMenuItem(
                    value: entry.key,
                    child: Text(entry.value),
                    onTap: () => {});
              }).toList(),
              name: 'degree_level',
            );
          });
        }));
  }
}
