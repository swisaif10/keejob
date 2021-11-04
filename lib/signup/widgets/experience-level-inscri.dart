import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:keejob_mobile/injector.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_experience_level_bloc/search_experience_level_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_experience_level_bloc/search_experience_level_event.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_experience_level_bloc/search_experience_level_state.dart';
import 'package:keejob_mobile/shared/form_validators.dart';

class ExperienceLevelWidget extends StatelessWidget {
  final Map<String, dynamic> _backendErrors = {};
  ExperienceLevelWidget(_backendErrors);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchExperienceLevelBloc>(
        create: (_) => Injector.resolve<SearchExperienceLevelBloc>()
          ..add(GetExperienceLevelList()),
        child: BlocBuilder<SearchExperienceLevelBloc,
            SearchExperienceLevelListState>(builder: (context, state) {
          return state.when(initial: () {
            return Center();
          }, success: (search) {
            if (search!.isEmpty) {
              return Center(
                child: Text('no search'),
              );
            }
            return FormBuilderDropdown(
              decoration: InputDecoration(labelText: 'Niveau d\'expérience'),
              validator: FormBuilderValidators.compose([
                CustomerFormValidator.backendValidation(
                  context,
                  backendErrors: _backendErrors,
                  fieldName: 'experience_level',
                ),
              ]),
              items: search.entries.map((entry) {
                return DropdownMenuItem(
                    value: entry.key,
                    child: Text(entry.value),
                    onTap: () => {});
              }).toList(),
              name: 'experience_level',
            );
          });
        }));
  }
}
