import 'package:flutter/material.dart';
import 'package:keejob_mobile/shared/widgets/app_bar_logo.dart';

import 'recruiter_grid.dart';

class RecruiterScreen extends StatefulWidget {
  static const routeName = '/recruiter';
  final Widget navigationBar;

  RecruiterScreen(this.navigationBar);

  @override
  _RecruiterScreenState createState() => _RecruiterScreenState();
}

enum FilterOptions {
  Favorites,
  All,
}

class _RecruiterScreenState extends State<RecruiterScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Container(width: 390, child: Drawer()),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: AppBarLogo(),
        actions: <Widget>[
          /*IconButton(
            icon: Icon(Icons.search, color: Colors.grey[700], size: 25),
            onPressed: () {
              _scaffoldKey.currentState!.openEndDrawer();
            },
          ),*/
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                } else {}
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),
        ],
      ),
      body: RecruiterGrid(),
      bottomNavigationBar: widget.navigationBar,
    );
  }
}
