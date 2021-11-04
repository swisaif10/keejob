import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:keejob_mobile/injector.dart';
import 'package:keejob_mobile/jobs/search/bloc/locality_bloc/search_locality_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/locality_bloc/search_locality_event.dart';
import 'package:keejob_mobile/jobs/search/bloc/locality_bloc/search_locality_state.dart';

class LocalityWidget extends StatefulWidget {
  @override
  _LocalityWidgetState createState() => _LocalityWidgetState();
}

class _LocalityWidgetState extends State<LocalityWidget> {
  int? selectedLocality = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchLocalityBloc>(
        lazy: false,
        create: (_) =>
            Injector.resolve<SearchLocalityBloc>()..add(GetLocalityList()),
        child: BlocBuilder<SearchLocalityBloc, SearchLocalityListState>(
            builder: (context, state) {
          return state.when(initial: () {
            return Center();
          }, success: (list) {
            if (list!.isEmpty) {
              return Center(
                child: Text('no search'),
              );
            }
            return FormBuilderDropdown(
              decoration: InputDecoration(labelText: 'Région'),
              hint: Text('Choisir votre région'),
              items: list
                  .map(
                    (item) => DropdownMenuItem(
                    value: item['id'],
                    child: Text(item['name']),
                    onTap: () => {

                    }),
              )
                  .toList(),
              name: 'region',
            );
          });
        }));
  }
}
