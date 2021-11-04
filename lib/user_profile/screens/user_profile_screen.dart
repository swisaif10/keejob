import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keejob_mobile/authentication/blocs/blocs.dart';
import 'package:keejob_mobile/injector.dart';
import 'package:keejob_mobile/applications/screens/application_list_screen.dart';
import 'package:keejob_mobile/favorites/screens/favorite_list_screen.dart';
import 'package:keejob_mobile/routes/navigator.dart';
import 'package:keejob_mobile/shared/services/message_service.dart';
import 'package:keejob_mobile/shared/widgets/app_bar_logo.dart';
import 'package:keejob_mobile/user_profile/bloc/userprofile_bloc.dart';
import 'package:keejob_mobile/user_profile/bloc/userprofile_event.dart';
import 'package:keejob_mobile/user_profile/bloc/userprofile_state.dart';
import 'package:keejob_mobile/user_profile/models/userprofile.dart';
import 'package:keejob_mobile/widgets/home_widget.dart';

class UserProfileScreen extends StatelessWidget {
  static const routeName = '/user-profile';
  final Widget navigationBar;

  UserProfileScreen(this.navigationBar);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => Injector.resolve<UserProfileBloc>()..add(GetUserProfile()),
      child: BlocBuilder<UserProfileBloc, UserProfileState>(
          builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: AppBarLogo(),
          ),
          body: state.when(
            userProfileInitial: () =>
                Center(child: CircularProgressIndicator()),
            userProfileLoading: () =>
                Center(child: CircularProgressIndicator()),
            userProfileFailed: () {
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                Injector.resolve<CustomNavigator>()
                    .pushLoginWithNext(nextRoute: routeName);
              });
              return Center(child: CircularProgressIndicator());
            },
            userProfileLoaded: (userProfile) =>
                _buildBody(context, userProfile),
          ),
          bottomNavigationBar: navigationBar,
        );
      }),
    );
  }

  Widget _buildBody(BuildContext context, UserProfile userProfile) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          SizedBox(
            height: 80,
            width: 115,
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              children: [
                _buildUserAvatar(context, userProfile),
                /*   Positioned(
                  right: -12,
                  bottom: 0,
                  child: SizedBox(
                    height: 46,
                    width: 46,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.white),
                      ),
                      color: Color(0xFFF5F6F9),
                      onPressed: () {},
                      child: Icon(Icons.camera_alt),
                    ),
                  ),
                )*/
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[50]),
                  padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)))),
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.account_circle, color: Colors.black),
                  SizedBox(width: 20),
                  Expanded(
                      child: Text(
                          userProfile.firstName! + ' ' + userProfile.lastName!,
                          style: TextStyle(color: Colors.black))),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[50]),
                  padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)))),
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.mail, color: Colors.black),
                  SizedBox(width: 20),
                  Expanded(
                      child: Text(userProfile.email,
                          style: TextStyle(color: Colors.black))),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[50]),
                  padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)))),
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.phone, color: Colors.black),
                  SizedBox(width: 20),
                  Expanded(
                      child: Text(userProfile.phoneNumbers.first,
                          style: TextStyle(color: Colors.black))),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[50]),
                  padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)))),
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.school, color: Colors.black),
                  SizedBox(width: 20),
                  Expanded(
                      child: Text(userProfile.degreeLevel!,
                          style: TextStyle(color: Colors.black))),
                ],
              ),
            ),
          ),
          userProfile.totalExperiences != null
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue[50]),
                        padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)))),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.mail, color: Colors.black),
                        SizedBox(width: 20),
                        Expanded(
                            child: Text(userProfile.experiences.first,
                                style: TextStyle(color: Colors.black))),
                      ],
                    ),
                  ),
                )
              : Container(height: 0, width: 0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[50]),
                  padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)))),
              onPressed: () {
                Injector.resolve<CustomNavigator>().pushNamed(
                  ApplicationsListScreen.routeName,
                  type: RouteType.fade,
                );
              },
              child: Row(
                children: [
                  Icon(Icons.description, color: Colors.black),
                  SizedBox(width: 20),
                  Expanded(
                      child: Text('Mes candidatures',
                          style: TextStyle(color: Colors.black))),
                  Icon(Icons.arrow_forward_ios, color: Colors.black),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[50]),
                  padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)))),
              onPressed: () {
                Injector.resolve<CustomNavigator>().pushNamed(
                  FavoriteListScreen.routeName,
                  type: RouteType.fade,
                );
              },
              child: Row(
                children: [
                  Icon(Icons.bookmark, color: Colors.black),
                  SizedBox(width: 20),
                  Expanded(
                      child: Text('Offres favorites',
                          style: TextStyle(color: Colors.black))),
                  Icon(Icons.arrow_forward_ios, color: Colors.black),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[50]),
                  padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)))),
              onPressed: () {
                Injector.resolve<AuthenticationBloc>().add(UserLoggedOut());
                Injector.resolve<GlobalMessageService>()
                    .show('Vous êtes maintenant déconnecté');
                Injector.resolve<CustomNavigator>().pushReplacementNamed(
                  Home.routeName,
                  type: RouteType.fade,
                );
              },
              child: Row(
                children: [
                  Icon(Icons.logout, color: Colors.black),
                  SizedBox(width: 20),
                  Expanded(
                      child: Text('Se déconnecter',
                          style: TextStyle(color: Colors.black))),
                  Icon(Icons.arrow_forward_ios, color: Colors.black),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserAvatar(BuildContext context, UserProfile userProfile) {
    return userProfile.userPhoto != ''
        ? CircleAvatar(
            backgroundImage: NetworkImage(userProfile.userPhoto),
          )
        : CircleAvatar(
            backgroundColor: Color(0xFFF5F6F9),
            child: Icon(
              Icons.account_circle,
              size: 55,
              color: Colors.blue[700],
            ),
          );
  }
}
