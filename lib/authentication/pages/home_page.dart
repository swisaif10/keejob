import 'package:flutter/material.dart';
import 'package:keejob_mobile/injector.dart';
import '../blocs/authentication/authentication.dart';
import '../models/models.dart';

class HomePage extends StatelessWidget {
  final User user;

  const HomePage({required Key key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authBloc = Injector.resolve<AuthenticationBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Welcome, ${user.id}',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 12,
              ),
              TextButton(
                style : TextButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                ),
                child: Text('Logout'),
                onPressed: () {
                  authBloc.add(UserLoggedOut());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
