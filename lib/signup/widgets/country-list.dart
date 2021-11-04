import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:keejob_mobile/injector.dart';
import 'package:keejob_mobile/signup/bloc/country_list_bloc.dart';
import 'package:keejob_mobile/signup/bloc/country_list_event.dart';
import 'package:keejob_mobile/signup/bloc/country_list_state.dart';
import 'package:keejob_mobile/shared/form_validators.dart';

class CountryListWidget extends StatelessWidget {
  final Map<String, dynamic> _backendErrors = {};

  CountryListWidget(_backendErrors);

  var selected =216 ;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CountryListBloc>(
        create: (_) =>
            Injector.resolve<CountryListBloc>()..add(GetCountryList()),
        child: BlocBuilder<CountryListBloc, CountryListState>(
            builder: (context, state) {
          return state.when(initial: () {
            return Center();
          }, success: (list) {
            if (list.isEmpty) {
              return Center(
                child: Text('Aucun pays'),
              );
            }
            return FormBuilderDropdown(
              decoration: InputDecoration(labelText: 'Pays'),
              validator: FormBuilderValidators.compose([
                CustomerFormValidator.backendValidation(
                  context,
                  backendErrors: _backendErrors,
                  fieldName: 'country',
                ),
              ]),
              hint: Text('Choisir votre pays'),
              initialValue: 788,
              items: list
                  .map(
                    (item) => DropdownMenuItem(
                        value: item['code'],
                        child: Text(item['name']),
                        onTap: () => {selected = item['calling_code']}),
                  )
                  .toList(),
              name: 'country',
            );
          });
        }));
  }
}
