import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:keejob_mobile/injector.dart';
import 'package:keejob_mobile/jobs/models/job.dart';
import 'package:keejob_mobile/applications/services/application_service.dart';
import 'package:keejob_mobile/jobs/search/bloc/education_level_bloc/search_education_level_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/education_level_bloc/search_education_level_event.dart';
import 'package:keejob_mobile/jobs/search/bloc/education_level_bloc/search_education_level_state.dart';
import 'package:keejob_mobile/jobs/services/documents_service.dart';
import 'package:keejob_mobile/shared/form_validators.dart';
import 'package:keejob_mobile/shared/services/message_service.dart';
import 'package:keejob_mobile/signup/widgets/country-list.dart';
import 'package:keejob_mobile/theme/theme.dart';
import 'package:keejob_mobile/user_profile/bloc/userprofile_bloc.dart';
import 'package:keejob_mobile/user_profile/bloc/userprofile_event.dart';
import 'package:keejob_mobile/user_profile/bloc/userprofile_state.dart';
import 'package:keejob_mobile/jobs/search/bloc/locality_bloc/search_locality_bloc.dart';
import 'package:keejob_mobile/jobs/search/bloc/locality_bloc/search_locality_event.dart';
import 'package:keejob_mobile/jobs/search/bloc/locality_bloc/search_locality_state.dart';

class ApplyToJobScreen extends StatefulWidget {
  static const routeName = '/job-application';

  final int? jobId;
  final Job? job;

  ApplyToJobScreen({this.jobId, this.job});

  @override
  _ApplyToJobScreenState createState() => _ApplyToJobScreenState();
}

class _ApplyToJobScreenState extends State<ApplyToJobScreen> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late final TextEditingController controller = TextEditingController();
  Map<String, dynamic> _backendErrors = {};
  PhoneNumber number = PhoneNumber(isoCode: 'TN');

  String? phone;
  String? degree;
  String? region;
  int? cv;

  late String? nb;
  late Widget navigationBar;
  var count = 0;
  int? selectedLocality = 0;

  buildCircularProgress(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    if (_backendErrors.isNotEmpty) {
      SchedulerBinding.instance!.addPostFrameCallback((_) {
        _fbKey.currentState!.saveAndValidate();
      });
    }
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Text(
            widget.job!.title!,
            style: appBarTitleStyle,
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: iconColor),
            onPressed: () => Navigator.of(context).pop(),
          )),
      body: _buildUserProfileBlocBuilder(context),
    );
  }

  Widget _buildUserProfileBlocBuilder(BuildContext context) {
    return BlocProvider(
        create: (_) =>
            Injector.resolve<UserProfileBloc>()..add(GetUserProfile()),
        child: BlocBuilder<UserProfileBloc, UserProfileState>(
            builder: (context, state)  {
          return state.when(
            userProfileInitial: () =>
                Center(child: CircularProgressIndicator()),
            userProfileLoading: () =>
                Center(child: CircularProgressIndicator()),
            userProfileFailed: () {
              return Center(child: CircularProgressIndicator());
            },
            userProfileLoaded: (userProfile)  {
              userProfile.getFirstPhoneNumber().then((value) {
                if (value != null && number != value) {
                  SchedulerBinding.instance!.addPostFrameCallback((_) {
                    setState(() {
                      number = value;
                    });
                  });
                }
              });
              return _buildBody(
                context,
                initialValue: {
                  'degree_level': userProfile.degreeLevel,
                  'country': userProfile.country,
                  'phone_numbers': number
                },
              );
            },
          );
        }));
  }

  Widget _buildBody(BuildContext context,
      {required Map<String, dynamic> initialValue}) {

    return Padding(
        padding: EdgeInsets.only(left: 10, top: 60, right: 10),
        child: Container(
            child: SingleChildScrollView(
                child: Column(children: [
          FormBuilder(
              key: _fbKey,
              child: Container(
                  margin: const EdgeInsets.only(top: 20, right: 30, left: 30),
                  child: Column(children: [
                    CountryListWidget(context),
                    SizedBox(height: 20),
                    _LocalityWidget(context),
                    SizedBox(height: 20),
                    _buildPhoneNumber(context, number),
                    SizedBox(height: 20),
                    EducationLevelWidget(context, initialValue.values.first),
                    SizedBox(height: 20),
                    _buildCvSelect(context),
                    //_buildOtherDocument(),
                    // _buildCoverLetterSelect(context),
                    SizedBox(height: 20),
                    // SizedBox(height: 20),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all(Colors.lightBlue[800]!)),
                            child: Text('Postuler'),
                            onPressed: () {
                              showDialog<void>(
                                  context: context,
                                  barrierDismissible: false,
                                  // user must tap button!
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                        title: const Text('Confirmation'),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: const <Widget>[
                                              Text(
                                                  'Voulez vous vraiment postuler pour cette offre ?'),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('Non Merci'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                              child: const Text('Oui'),
                                              onPressed: () async {

                                                buildCircularProgress(context);
                                                _fbKey.currentState!
                                                    .saveAndValidate();
                                                final backendResponse =
                                                    await Injector.resolve<
                                                            ApplicationServiceInterface>()
                                                        .addApplication(
                                                            _fbKey.currentState!
                                                                .value,
                                                            degree,
                                                            phone,
                                                            cv,
                                                            widget.job!.id);

                                                Navigator.pop(context);

                                                if (backendResponse == true) {
                                                  Injector.resolve<
                                                          GlobalMessageService>()
                                                      .show(
                                                          'Votre Candidature est crée avec succée');

                                                  Navigator.popUntil(context,
                                                      (route) {
                                                    return count++ == 3;
                                                  });
                                                } else {
                                                  Navigator.pop(context);
                                                  setState(() {
                                                    _backendErrors = Map<String,
                                                            dynamic>.from(
                                                        backendResponse);
                                                    print(
                                                        '_backendErrors $_backendErrors');
                                                  });
                                                }
                                              })
                                        ]);
                                  });
                            }))
                  ])))
        ]))));
  }

  Widget _buildPhoneNumber(BuildContext context, number) {

    return InternationalPhoneNumberInput(
      textStyle: TextStyle(color: Colors.black),
      onInputChanged: (PhoneNumber number) {},
      onInputValidated: (bool value) {},
      selectorConfig: SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
      ),
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.disabled,
      selectorTextStyle: TextStyle(color: Colors.black),
      textFieldController: controller,
      formatInput: false,
      initialValue: number,
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

  buildShowDialog(BuildContext context) {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text('Confirmation'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text('Voulez vous vraiment postuler pour cette offre ?'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Non Merci'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                    child: const Text('Oui'),
                    onPressed: () async {
                      _fbKey.currentState!.saveAndValidate();
                      buildCircularProgress(context);
                      final backendResponse =
                          await Injector.resolve<ApplicationServiceInterface>()
                              .addApplication(_fbKey.currentState!.value,
                                  degree, phone, cv, widget.job!.id);

                      if (backendResponse == true) {
                        Injector.resolve<GlobalMessageService>()
                            .show('Votre Candidature est crée avec succée');

                        Navigator.popUntil(context, (route) {
                          return count++ == 3;
                        });
                      } else {
                        Navigator.popUntil(context, (route) {
                          return count++ == 2;
                        });
                        setState(() {
                          _backendErrors =
                              Map<String, dynamic>.from(backendResponse);
                          print('_backendErrors $_backendErrors');
                        });
                      }
                    })
              ]);
        });
  }

  Widget _LocalityWidget(BuildContext context) {
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
                child: Text('no country'),
              );
            }
            return FormBuilderDropdown(
              decoration: InputDecoration(labelText: 'Région'),
              validator: FormBuilderValidators.compose([
                CustomerFormValidator.backendValidation(
                  context,
                  backendErrors: _backendErrors,
                  fieldName: 'region',
                ),
              ]),
              hint: Text('Choisir votre région'),
              items: list
                  .map(
                    (item) => DropdownMenuItem(
                        value: item['id'],
                        child: Text(item['name']),
                        onTap: () => {
                              region = item['name'],
                            }),
                  )
                  .toList(),
              name: 'region',
            );
          });
        }));
  }

  Widget EducationLevelWidget(BuildContext context, initialValue) {
    return BlocProvider<SearchEducationLevelBloc>(
        create: (_) => Injector.resolve<SearchEducationLevelBloc>()
          ..add(GetEducationLevelList()),
        child: BlocBuilder<SearchEducationLevelBloc,
            SearchEducationLevelListState>(builder: (context, state) {
          return state.when(initial: () {
            return Center();
          }, success: (list) {
            if (list!.isEmpty) {
              return Center(
                child: Text('no search'),
              );
            }
            return FormBuilderDropdown(
              hint: Text(initialValue, style: TextStyle(color: Colors.black)),
              decoration: InputDecoration(labelText: 'Niveau d\'études'),
              validator: FormBuilderValidators.compose([
                CustomerFormValidator.backendValidation(
                  context,
                  backendErrors: _backendErrors,
                  fieldName: 'degree_level',
                ),
              ]),
              items: list.entries.map((entry) {
                if (entry.value.toString() == initialValue) {
                  degree = entry.key;
                }
                return DropdownMenuItem(
                    value: entry.key,
                    child: Text(entry.value),
                    onTap: () => {degree = entry.key});
              }).toList(),
              name: 'degree_level',
            );
          });
        }));
  }
/*
  Widget _buildCoverLetterSelect(BuildContext context) {
    return FormBuilderTextField(
      maxLines: 5,
      textCapitalization: TextCapitalization.sentences,
      validator: FormBuilderValidators.compose([
        CustomerFormValidator.backendValidation(
          context,
          backendErrors: _backendErrors,
          fieldName: 'attached_cover_letter',
        ),
      ]),
      decoration: InputDecoration(labelText: 'Lettre de motivation'),
      name: 'attached_cover_letter',
    );
  }*/
/*
  Widget _buildOtherDocument() {
    return FormBuilderFilePicker(
      name: 'attached_docs',
      allowMultiple: false,
      decoration: InputDecoration(labelText: 'Autre Document'),
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
          Text('Importer Autre Document'),
        ],
      ),
    );
  }
*/
  Widget _buildCvSelect(BuildContext context) {
    return FutureBuilder<List>(
        future: Injector.resolve<DocumentServiceInterface>().addDocument(),
        builder: (BuildContext context, snapshot) {
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
            decoration: InputDecoration(labelText: 'Sélectionner votre cv'),
            validator: FormBuilderValidators.compose([
              CustomerFormValidator.backendValidation(
                context,
                backendErrors: _backendErrors,
                fieldName: 'attached_docs',
              ),
            ]),
            items: snapshot.data!.map((item) {
              return DropdownMenuItem(
                  child: Text(item['title']),
                  value: item['id'].toString(),
                  onTap: () => {cv = item['id']});
            }).toList(),
            name: 'attached_docs',
          );
        });
  }
}
