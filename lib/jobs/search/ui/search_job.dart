import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keejob_mobile/jobs/bloc/jobs_list_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_parameters/search_parameters_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_parameters/search_parameters_event.dart';
import 'education-level.dart';
import 'experience-level.dart';
import 'job-type-filter.dart';
import 'locality-filter.dart';
import 'profession-filter.dart';
import 'package:keejob_mobile/theme/theme.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_parameters/search_parameters_state.dart'
    as SearchParamsState;
import 'package:keejob_mobile/shared/search_history.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchJob extends StatelessWidget {
  TextEditingController textcontroller = TextEditingController();
  String preferencesKey = 'recentJobKeywordsSearches';

  @override
  Widget build(BuildContext context) {
    String? comeFrom = 'job';

    return Drawer(
        child: Scaffold(
            appBar: AppBar(
              title: Container(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () async {
                      textcontroller.clear();
                      BlocProvider.of<SearchParametersBloc>(context)
                          .add(SetKeyword(''));
                      BlocProvider.of<SearchParametersBloc>(context)
                          .add(ResetSearchParameters());
                      BlocProvider.of<JobsListBloc>(context)
                          .add(RefreshJobsList());
                    },
                    child: Text('Reset'),
                  )),
              backgroundColor: Colors.white,
              leading: Row(children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: iconColor),
                  onPressed: () => Navigator.pop(context),
                ),
              ]),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, right: 5, left: 5),
                    child: keyWordFilterWidget(context),
                  ),
                  LocalityFilterWidget(comeFrom),
                  EducationLevelFilterWidget(),
                  ExperienceLevelFilterWidget(),
                  ProfessionFilterWidget(),
                  JobTypeFilterWidget(),
                  SizedBox(height: 60),

                ],
              ),
            ),
            floatingActionButton: GestureDetector(
              onTap: () {
                BlocProvider.of<JobsListBloc>(context).add(RefreshJobsList());
                // _scaffoldKey.currentState!.openEndDrawer();
                Navigator.pop(context);
              },
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.6 / 10,
                  width: MediaQuery.of(context).size.width * 2 / 5,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[800],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text('Rechercher',
                            style: TextStyle(color: Colors.white)),
                      ])),
            )));
  }

  keyWordFilterWidget(BuildContext context) {
    bool tapWorkaround = false;
    SearchParametersBloc searchParametersBloc =
        BlocProvider.of<SearchParametersBloc>(context);
    checkSearchState(searchParametersBloc.state);
    return TextField(
      controller: textcontroller,
      decoration: InputDecoration(
        labelText: 'Mots clés',
        border: OutlineInputBorder(),
        suffixIcon: IconButton(
          onPressed: () {
            tapWorkaround = true;
            searchParametersBloc.add(SetKeyword(''));
            textcontroller.text = '';

//Enable the text field's focus node request after some delay
            Future.delayed(Duration(milliseconds: 100), () {
              tapWorkaround = false;
            });
          },
          icon: Icon(Icons.clear),
        ),
      ),
      textInputAction: TextInputAction.done,
      onTap: () {
        if (tapWorkaround == true) return;
        _showSearch(context);
      },
    );
  }

  void checkSearchState(SearchParamsState.SearchParametersState state) {
    if (state is SearchParamsState.Initial) {
      textcontroller.text = '';
    }
    if (state is SearchParamsState.Saved) {
      final newValue = state.keyword;
      textcontroller.value = TextEditingValue(
          text: newValue ?? '',
          selection: TextSelection.collapsed(
              offset: newValue != null ? newValue.length : 0));
    }
  }

  Future<void> _showSearch(BuildContext context) async {
    final searchText = await showSearch<String>(
      context: context,
      delegate: SearchWithSuggestionDelegate(
        searchFieldLabel: 'Mots clés',
        onSearchChanged: _getRecentSearchesLike,
        onRemoveSearchItem: _onRemoveSearchItem,
      ),
    );

    //Save the searchText to SharedPref so that next time you can use them as recent searches.
    await _saveToRecentSearches(searchText);
    print(searchText);
    BlocProvider.of<SearchParametersBloc>(context)
        .add(SetKeyword(searchText));
    textcontroller.text = searchText! ;
  }

  Future<List<String>> _getRecentSearchesLike(String query) async {

    final pref = await SharedPreferences.getInstance();
    final allSearches = pref.getStringList(preferencesKey)!;
    return allSearches.where((search) => search.startsWith(query)).toList();
  }

  Future<void> _saveToRecentSearches(String? searchText) async {
    if (searchText == null || searchText == '') return; //Should not be null
    final pref = await SharedPreferences.getInstance();

    //Use `Set` to avoid duplication of recentSearches
    Set<String> allSearches = pref.getStringList(preferencesKey)?.toSet() ?? {};

    //Place it at first in the set
    allSearches = {searchText, ...allSearches};
    pref.setStringList(preferencesKey, allSearches.toList());
  }

  Future<void> _onRemoveSearchItem(String searchText) async {
    final pref = await SharedPreferences.getInstance();

    Set<String> allSearches = pref.getStringList(preferencesKey)?.toSet() ?? {};
    pref.setStringList(preferencesKey,
        allSearches.where((search) => search != searchText).toList());
  }
}
