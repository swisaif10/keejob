import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:keejob_mobile/authentication/blocs/blocs.dart';
import 'package:keejob_mobile/authentication/blocs/login/login.dart';
import 'package:keejob_mobile/authentication/pages/login_page.dart';
import 'package:keejob_mobile/config/app_config.dart';
import 'package:keejob_mobile/injector.dart';
import 'package:keejob_mobile/jobs/search/bloc/education_level_bloc/search_education_level_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/education_level_bloc/search_education_level_event.dart';
import 'package:keejob_mobile/jobs/search/bloc/education_level_bloc/search_education_level_state.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_experience_level_bloc/search_experience_level_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_experience_level_bloc/search_experience_level_event.dart';
import 'package:keejob_mobile/jobs/search/bloc/search_experience_level_bloc/search_experience_level_state.dart';
import 'package:keejob_mobile/routes/navigator.dart';
import 'package:keejob_mobile/shared/form_validators.dart';
import 'package:keejob_mobile/shared/widgets/app_bar_logo.dart';
import 'package:keejob_mobile/shared/widgets/form_builder_file_picker.dart';
import 'package:keejob_mobile/signup/bloc/country_list_bloc.dart';
import 'package:keejob_mobile/signup/bloc/country_list_event.dart';
import 'package:keejob_mobile/signup/bloc/country_list_state.dart';
import 'package:keejob_mobile/signup/service/sign-up-service.dart';
import 'package:keejob_mobile/signup/service/signup-source-service.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:keejob_mobile/user_profile/bloc/userprofile_bloc.dart';
import 'package:keejob_mobile/user_profile/bloc/userprofile_state.dart';
import 'package:keejob_mobile/user_profile/bloc/userprofile_event.dart';
import 'package:keejob_mobile/widgets/home_widget.dart';

class SignUpGrid extends StatefulWidget {
  static const routeName = 'signup/';

  final bool finishSocialSignUp;

  SignUpGrid({this.finishSocialSignUp = false});

  @override
  _SignUpGridState createState() => _SignUpGridState();
}

class _SignUpGridState extends State<SignUpGrid> {
  late final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  bool _obscureText = true;
  bool showLoader = false;
  Map<String, dynamic> _backendErrors = {};
  late final TextEditingController controller = TextEditingController();
  String initialCountry = 'TN';
  PhoneNumber number = PhoneNumber(isoCode: 'TN');
  String? phone;
  File? file;

  buildShowDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Widget _buildUserProfileBlocBuilder(BuildContext context) {
    return BlocProvider(
      create: (_) => Injector.resolve<UserProfileBloc>()..add(GetUserProfile()),
      child: BlocBuilder<UserProfileBloc, UserProfileState>(
        builder: (context, state) {
          return state.when(
            userProfileInitial: () =>
                Center(child: CircularProgressIndicator()),
            userProfileLoading: () =>
                Center(child: CircularProgressIndicator()),
            userProfileFailed: () {
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                Injector.resolve<CustomNavigator>()
                    .pushReplacementNamed(LoginPage.routeName);
              });
              return Center(child: CircularProgressIndicator());
            },
            userProfileLoaded: (userProfile) =>
                _buildBody(context, initialValue: {
              'last_name': userProfile.lastName,
              'first_name': userProfile.firstName,
              'email': userProfile.email,
            }),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_backendErrors.isNotEmpty) {
      SchedulerBinding.instance!.addPostFrameCallback((_) {
        _fbKey.currentState!.saveAndValidate();
      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: AppBarLogo(),
        actions: [
          if (!widget.finishSocialSignUp)
            TextButton(
              onPressed: () {
                Injector.resolve<CustomNavigator>().pushReplacementNamed(
                    LoginPage.routeName,
                    type: RouteType.fade);
              },
              child: Text('Se connecter'),
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
      body: widget.finishSocialSignUp
          ? _buildUserProfileBlocBuilder(context)
          : _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context,
      {Map<String, dynamic>? initialValue}) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FormBuilder(
              key: _fbKey,
              initialValue: initialValue ?? {},
              child: Container(
                margin: const EdgeInsets.only(top: 20, right: 30, left: 30),
                child: Column(
                  children: <Widget>[
                    _buildEmail(context),
                    _buildPassword1(context),
                    _buildPassword2(context),
                    _buildFirstName(context),
                    _buildLastName(context),
                    SizedBox(height: 7),
                    _buildPhoneNumber(context),
                    _buildDateTimeField(context),
                    SizedBox(height: 5),
                    _buildSignupSource(context),
                    SizedBox(height: 7),
                    _buildExperienceLevel(context),
                    SizedBox(height: 7),
                    _buildEducationLevel(context),
                    SizedBox(height: 7),
                    _buildCountry(context),
                    SizedBox(height: 12),
                    _buildCv(),
                  ],
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 10, right: 30, left: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.lightBlue[800]!)),
                      child: Text('Créer un compte'),
                      onPressed: () async {
                        buildShowDialog(context);
                        _fbKey.currentState!.saveAndValidate();
                        print(_fbKey.currentState!.value);
                        final backendResponse =
                            await Injector.resolve<SignUpServiceInterface>()
                                .signUp(_fbKey.currentState!.value, phone,
                                    widget.finishSocialSignUp);

                        Navigator.pop(context);

                        if (backendResponse is bool) {
                          if (!widget.finishSocialSignUp) {
                            // Auto login user when normal signup
                            // For social signup the user is already logged in
                            BlocProvider(
                              create: (_) => Injector.resolve<LoginBloc>()
                                ..add(
                                  LoginInWithEmailButtonPressed(
                                    email: _fbKey.currentState!.value['email'],
                                    password:
                                        _fbKey.currentState!.value['password1'],
                                  ),
                                ),
                            );
                          }
                          Injector.resolve<CustomNavigator>()
                              .pushReplacementNamed(Home.routeName);
                        } else {
                          setState(() {
                            _backendErrors =
                                Map<String, dynamic>.from(backendResponse);
                            print('_backendErrors $_backendErrors');
                          });
                        }
                      },
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildCountry(BuildContext context) {
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
                        onTap: () => {}),
                  )
                  .toList(),
              name: 'country',
            );
          });
        }));
  }

  Widget _buildEducationLevel(BuildContext context) {
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

  Widget _buildFirstName(BuildContext context) {
    return FormBuilderTextField(
      textCapitalization: TextCapitalization.words,
      validator: FormBuilderValidators.compose([
        CustomerFormValidator.backendValidation(
          context,
          backendErrors: _backendErrors,
          fieldName: 'first_name',
        ),
      ]),
      decoration: InputDecoration(labelText: 'Prénom'),
      name: 'first_name',
    );
  }

  Widget _buildLastName(BuildContext context) {
    return FormBuilderTextField(
      textCapitalization: TextCapitalization.words,
      validator: FormBuilderValidators.compose([
        CustomerFormValidator.backendValidation(
          context,
          backendErrors: _backendErrors,
          fieldName: 'last_name',
        ),
      ]),
      decoration: InputDecoration(labelText: 'Nom'),
      name: 'last_name',
    );
  }

  Widget _buildEmail(BuildContext context) {
    return FormBuilderTextField(
      validator: FormBuilderValidators.compose([
        CustomerFormValidator.backendValidation(
          context,
          backendErrors: _backendErrors,
          fieldName: 'email',
        ),
      ]),
      enabled: !widget.finishSocialSignUp,
      decoration: InputDecoration(labelText: 'Email'),
      keyboardType: TextInputType.emailAddress,
      name: 'email',
    );
  }

  Widget _buildPassword1(BuildContext context) {
    return FormBuilderTextField(
      autocorrect: false,
      enableSuggestions: false,
      validator: FormBuilderValidators.compose([
        CustomerFormValidator.backendValidation(
          context,
          backendErrors: _backendErrors,
          fieldName: 'password1',
        ),
      ]),
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
            _obscureText == true ? Icons.lock : Icons.lock_open,
          ),
        ),
      ),
      name: 'password1',
      obscureText: _obscureText,
    );
  }

  Widget _buildPassword2(BuildContext context) {
    return FormBuilderTextField(
      autocorrect: false,
      enableSuggestions: false,
      validator: FormBuilderValidators.compose([
        CustomerFormValidator.backendValidation(
          context,
          backendErrors: _backendErrors,
          fieldName: 'password2',
        ),
      ]),
      decoration: InputDecoration(
        labelText: 'Confirm le mot de passe',
        suffixIcon: IconButton(
          padding: EdgeInsets.only(top: 15.0),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          icon: Icon(
            _obscureText == true ? Icons.lock : Icons.lock_open,
          ),
        ),
      ),
      name: 'password2',
      obscureText: _obscureText,
    );
  }

  Widget _buildPhoneNumber(BuildContext context) {
    return InternationalPhoneNumberInput(
      hintText: 'Numéro de téléphone',
      onInputChanged: (PhoneNumber number) {},
      onInputValidated: (bool value) {},
      selectorConfig: SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
      ),
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.disabled,
      selectorTextStyle: TextStyle(color: Colors.black),
      initialValue: number,
      textFieldController: controller,
      formatInput: false,
      errorMessage: 'Numéro de téléphone invalide.',
      keyboardType:
          TextInputType.numberWithOptions(signed: true, decimal: false),
      onSaved: (PhoneNumber number) {
        final code = number.dialCode;
        final String value = code.toString().substring(1);
        if (controller.text != '') {
          phone = '$value::${controller.text}';
        }
      },
    );
  }

  Widget _buildDateTimeField(BuildContext context) {
    return FormBuilderDateTimePicker(
      name: 'birth_date',
      inputType: InputType.date,
      initialDatePickerMode: DatePickerMode.year,
      lastDate: DateTime.now(),
      format: AppConfig.DISPLAY_DATE_FORMAT,
      validator: FormBuilderValidators.compose([
        CustomerFormValidator.backendValidation(
          context,
          backendErrors: _backendErrors,
          fieldName: 'birth_date',
        ),
      ]),
      decoration: InputDecoration(
        labelText: 'Date de naissance',
        suffixIcon: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            _fbKey.currentState!.fields['date']?.didChange(null);
          },
        ),
      ),
      locale: Locale.fromSubtags(languageCode: 'fr'),
    );
  }

  Widget _buildCv() {
    return FormBuilderFilePicker(
      name: 'cv',
      allowMultiple: false,
      decoration: InputDecoration(labelText: 'CV'),
      maxFiles: 1,
      type: FileType.custom,
      allowedExtensions: [
        'docx',
        'doc',
        'pdf',
      ],
      previewImages: true,
      onChanged: (val) => print(val),
      selector: Row(
        children: <Widget>[
          Icon(Icons.file_upload),
          Text('Importer'),
        ],
      ),
    );
  }

  Widget _buildExperienceLevel(BuildContext context) {
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

  Widget _buildSignupSource(BuildContext context) {
    return FutureBuilder<List>(
      future:
          Injector.resolve<SignUpSourceServiceInterface>().fetchSignUpSource(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.data == null) {
          return Center(
            child: SizedBox(
              height: 10,
              width: 10,
              child: CircularProgressIndicator(),
            ),
          );
        }
        return FormBuilderDropdown(
          decoration: InputDecoration(
              labelText: 'Comment avez-vous entendu parler de notre site'),
          validator: FormBuilderValidators.compose([
            CustomerFormValidator.backendValidation(
              context,
              backendErrors: _backendErrors,
              fieldName: 'signup_source',
            ),
          ]),
          items: snapshot.data!.map((item) {
            return DropdownMenuItem(
                child: (item['display_name'] =='Comment avez-vous entendu parler de notre site?') ? Container(height: 0, width: 0) :
            Text(item['display_name']),
                value: item['value'].toString(),
                onTap: () => {});
          }).toList(),
          // hint: Text('Comment avez-vous entendu parler de notre site'),
          name: 'signup_source',
        );
      },
    );
  }
}
