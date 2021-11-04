import 'package:flutter/material.dart';

typedef OnSearchChanged = Future<List<String>> Function(String);
typedef OnRemoveSearchItem = Future<void> Function(String);

class SearchWithSuggestionDelegate extends SearchDelegate<String> {
  ///[onSearchChanged] gets the [query] as an argument. Then this callback
  ///should process [query] then return an [List<String>] as suggestions.
  ///Since its returns a [Future] you get suggestions from server too.
  final OnSearchChanged? onSearchChanged;
  final OnRemoveSearchItem? onRemoveSearchItem;

  ///This [_oldFilters] used to store the previous suggestions. While waiting
  ///for [onSearchChanged] to completed, [_oldFilters] are displayed.
  List<String>? _oldFilters = const [];

  SearchWithSuggestionDelegate(
      {String? searchFieldLabel, this.onSearchChanged, this.onRemoveSearchItem})
      : super(searchFieldLabel: searchFieldLabel);

  ///
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  ///OnSubmit in the keyboard, returns the [query]
  @override
  void showResults(BuildContext context) {
    close(context, query);
  }

  ///Since [showResults] is overridden we can don't have to build the results.
  @override
  Widget buildResults(BuildContext context) => Container(width: 0, height: 0);

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: onSearchChanged != null ? onSearchChanged!(query) : null,
      builder: (context, snapshot) {
        if (snapshot.hasData) _oldFilters = snapshot.data;
        return ListView.builder(
          itemCount: _oldFilters!.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.restore),
              title: Text(_oldFilters![index]),
              trailing: IconButton(
                tooltip: 'Supprimer',
                onPressed: () {
                  onRemoveSearchItem!(_oldFilters![index]);
                  // Hacky way to trigger updating suggestion
                  String oldQuery = query;
                  query = '';
                  query = oldQuery;
                },
                icon: Icon(Icons.clear),
              ),
              onTap: () => close(context, _oldFilters![index]),
            );
          },
        );
      },
    );
  }
}
