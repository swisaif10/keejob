import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:keejob_mobile/authentication/pages/reset_password_page.dart';
import 'package:keejob_mobile/injector.dart';
import 'package:keejob_mobile/jobs/models/job.dart';
import 'package:keejob_mobile/jobs/screens/job_detail_screen.dart';
import 'package:keejob_mobile/routes/navigator.dart';
import 'package:keejob_mobile/shared/services/message_service.dart';
import 'package:keejob_mobile/shared/widgets/app_bar_logo.dart';
import 'package:keejob_mobile/signup/widgets/sign-up-grid.dart';
import 'package:keejob_mobile/widgets/home_widget.dart';
import '../blocs/blocs.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';
  final String nextRoute;
  final dynamic nextRouteArgs;
  final Job? job;

  LoginPage({this.job, this.nextRoute = '', this.nextRouteArgs = null});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: AppBarLogo(),
        actions: [
          TextButton(
            onPressed: () {
              Injector.resolve<CustomNavigator>().pushReplacementNamed(
                  SignUpGrid.routeName,
                  type: RouteType.fade);
            },
            child: Text('Créer un compte'),
          ),
          IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.black,
              ),
              onPressed: () {
                // If user want to skip, make to sure to log him out
                Injector.resolve<AuthenticationBloc>().add(UserLoggedOut());
                Injector.resolve<CustomNavigator>().pushReplacementNamed(
                  Home.routeName,
                  type: RouteType.fade,
                );
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  return state.when(
                      initial: () => _AuthForm(job, nextRoute, nextRouteArgs),
                      loading: () => Center(
                          child: CircularProgressIndicator(strokeWidth: 2)),
                      notAuthenticated: () =>
                          _AuthForm(job, nextRoute, nextRouteArgs),
                      authenticated: (user) {
                        return Container(width: 0, height: 0);
                      },
                      failure: (_) => _AuthForm(job, nextRoute, nextRouteArgs));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _AuthForm extends StatelessWidget {
  final String nextRoute;
  final dynamic nextRouteArgs;
  final Job? job;

  _AuthForm(this.job, this.nextRoute, this.nextRouteArgs);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: BlocProvider<LoginBloc>(
        create: (context) => Injector.resolve<LoginBloc>(),
        child: _SignInForm(job, nextRoute, nextRouteArgs),
      ),
    );
  }
}

class UserObject {
  UserObject(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.profileImageUrl});

  String firstName, lastName, email, profileImageUrl;
}

class _SignInForm extends StatefulWidget {
  final String nextRoute;
  final dynamic nextRouteArgs;
  final Job? job;

  _SignInForm(this.job, this.nextRoute, this.nextRouteArgs);

  @override
  __SignInFormState createState() => __SignInFormState();
}

class __SignInFormState extends State<_SignInForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  bool _autoValidate = false;
  final String redirectUrl = 'https://www.keejob.com';
  final String clientId = '53lpuv4650ao';
  final String clientSecret = 'izU2TAY376etfhHH';
  bool logoutUser = false;
  bool _obscureText = true;

 /* Future<void> _facebookLogin() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final _accessToken = result.accessToken;
      BlocProvider.of<LoginBloc>(context).add(LoginInWithSocial(
        socialBackend: 'facebook',
        accessToken: _accessToken!.token,
      ));
      // FacebookAuth.instance.logOut();
    } else {
      print(result.status);
      print(result.message);
    }
  }*/
/*
  Future<void> _linkedinLogin() async {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => LinkedInUserWidget(
            redirectUrl: redirectUrl,
            clientId: clientId,
            clientSecret: clientSecret,
            projection: [
              ProjectionParameters.id,
              ProjectionParameters.localizedFirstName,
              ProjectionParameters.localizedLastName,
              ProjectionParameters.firstName,
              ProjectionParameters.lastName,
              ProjectionParameters.profilePicture,
            ],
            onError: (UserFailedAction e) {
              print('Error: ${e.toString()}');
              print('Error: ${e.stackTrace.toString()}');
            },
            onGetUserProfile: (UserSucceededAction linkedInUser) {
              print('Access token ${linkedInUser.user.token.accessToken}');

              print('User id: ${linkedInUser.user.userId}');

              setState(() {
                logoutUser = false;
              });

              Navigator.pop(context);
            },
          ),
          fullscreenDialog: true,
        ));
  }
*/
  Future<void> _googleLogin() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn(scopes: [
      'https://www.googleapis.com/auth/userinfo.email',
    ]).signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    BlocProvider.of<LoginBloc>(context).add(LoginInWithSocial(
      socialBackend: 'google-oauth2',
      accessToken: googleAuth.accessToken!,
    ));
  }

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      if (_key.currentState!.validate()) {
        BlocProvider.of<LoginBloc>(context).add(LoginInWithEmailButtonPressed(
          email: _emailController.text,
          password: _passwordController.text,
        ));
      } else {
        setState(() {
          _autoValidate = true;
        });
      }
    }

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationAuthenticated) {
          if (state.user.needSignupCompletion) {
            Injector.resolve<CustomNavigator>().pushReplacementNamed(
              SignUpGrid.routeName,
              type: RouteType.fade,
              arguments: {'finishSocialSignUp': true},
            );
          } else if (widget.nextRouteArgs != null) {
            Navigator.of(context).popAndPushNamed(widget.nextRoute,
                arguments: widget.nextRouteArgs.toString());
          } else {
            if (widget.nextRoute != '') {
              if (widget.nextRoute == JobDetailScreen.routeName) {
                Injector.resolve<CustomNavigator>().pushReplacementNamed(
                    JobDetailScreen.routeName,
                    arguments: {'jobId': widget.job!.id, 'job': widget.job!});
              } else
                Injector.resolve<CustomNavigator>()
                    .pushNamed(widget.nextRoute, type: RouteType.fade);
            } else {
              Injector.resolve<CustomNavigator>().pushReplacementNamed(
                Home.routeName,
                type: RouteType.fade,
              );
            }
          }
        }
      },
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            _showError(state.error!);
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Form(
              key: _key,
              autovalidateMode: _autoValidate
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.only(top: 0, right: 10, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                          ),
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Email invalide!';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Mot de passe',
                            suffixIcon: IconButton(
                              padding: EdgeInsets.only(top: 15.0),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              icon: Icon(
                                _obscureText == true
                                    ? Icons.lock
                                    : Icons.lock_open,
                              ),
                            ),
                          ),
                          obscureText: _obscureText,
                          controller: _passwordController,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SignInButtonBuilder(
                          text: 'Se connecter',
                          icon: Icons.email,
                          onPressed: state is LoginLoading
                              ? () {}
                              : _onLoginButtonPressed,
                          backgroundColor: Colors.lightBlue[800]!,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Center(
                            child: RichText(
                                text: TextSpan(children: [
                          TextSpan(
                              text: 'Mot de passe oublié?',
                              style: TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ResetPasswordPage()),
                                  );
                                })
                        ]))),
                        _buildSocialButtons(context),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSocialButtons(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Divider(),
        SignInButton(
          Buttons.Google,
          text: 'Continuer avec Google',
          onPressed: _googleLogin,
        ),
       /* SignInButton(
          Buttons.FacebookNew,
          text: 'Continuer avec Facebook',
          onPressed: _facebookLogin,
        ),*/
        // SignInButton(
        //   Buttons.LinkedIn,
        //   text: 'LinkedIn login',
        //   onPressed: _linkedinLogin,
        // ),
      ],
    );
  }

  void _showError(String error) {
    Injector.resolve<GlobalMessageService>().show(error);
  }
}
