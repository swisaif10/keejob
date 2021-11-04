import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:keejob_mobile/authentication/pages/pages.dart';
import 'package:keejob_mobile/injector.dart';
import 'package:keejob_mobile/routes/navigator.dart';
import 'package:keejob_mobile/shared/form_validators.dart';
import 'package:keejob_mobile/shared/services/message_service.dart';
import 'package:keejob_mobile/theme/theme.dart';
import 'package:keejob_mobile/trainings/models/training.dart';
import 'package:keejob_mobile/user_profile/bloc/userprofile_bloc.dart';
import 'package:keejob_mobile/user_profile/bloc/userprofile_event.dart';
import 'package:keejob_mobile/user_profile/bloc/userprofile_state.dart';
import './services/center_contact_service.dart';

class ContactTrainingCenterScreen extends StatefulWidget {
  static const routeName = '/contact-center';

  final int? trainingId;
  final Training? training;

  ContactTrainingCenterScreen({this.trainingId, this.training});

  @override
  _ContactTrainingCenterScreenState createState() =>
      _ContactTrainingCenterScreenState();
}

class _ContactTrainingCenterScreenState
    extends State<ContactTrainingCenterScreen> {
  late final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  Map<String, dynamic> _backendErrors = {};
  late final TextEditingController controller = TextEditingController();
  PhoneNumber number = PhoneNumber(isoCode: 'TN');
  String? phone;
  var count = 0;

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

  Widget _buildMessage(BuildContext context) {
    return FormBuilderTextField(
      maxLines: 4,
      textCapitalization: TextCapitalization.sentences,
      validator: FormBuilderValidators.compose([
        CustomerFormValidator.backendValidation(
          context,
          backendErrors: _backendErrors,
          fieldName: 'message',
        ),
      ]),
      decoration: InputDecoration(labelText: 'Message'),
      name: 'message',
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
      decoration: InputDecoration(labelText: 'Email'),
      keyboardType: TextInputType.emailAddress,
      name: 'email',
    );
  }

  Widget _buildPhoneNumber(BuildContext context) {
    return InternationalPhoneNumberInput(
      hintText: 'Numéro de téléphone',
      onInputChanged: (PhoneNumber number) {},
      onInputValidated: (bool value) {},
      errorMessage: 'Numéro de téléphone invalide.',
      selectorConfig: SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
      ),
      ignoreBlank: false,
      autoValidateMode: AutovalidateMode.disabled,
      selectorTextStyle: TextStyle(color: Colors.black),
      initialValue: number,
      textFieldController: controller,
      formatInput: false,
      keyboardType:
          TextInputType.numberWithOptions(signed: true, decimal: false),
      onSaved: (PhoneNumber number) {
        if (controller.text != '') {
          phone = controller.text;
        }
      },
    );
  }

  Widget _buildChoice(BuildContext context) {
    return FutureBuilder<List>(
      future: Injector.resolve<ContactCenterServiceInterface>().fetchChoice(),
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
          decoration: InputDecoration(labelText: 'Vous êtes'),
          validator: FormBuilderValidators.compose([
            CustomerFormValidator.backendValidation(
              context,
              backendErrors: _backendErrors,
              fieldName: 'you_are',
            ),
          ]),
          items: snapshot.data!.map((item) {
            return DropdownMenuItem(
                child: Text(item['display_name']),
                value: item['value'].toString(),
                onTap: () => {});
          }).toList(),
          // hint: Text('Comment avez-vous entendu parler de notre site'),
          name: 'you_are',
        );
      },
    );
  }

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
            userProfileLoaded: (userProfile) {
              userProfile.getFirstPhoneNumber().then((value) {
                if (value != null && number != value) {
                  SchedulerBinding.instance!.addPostFrameCallback((_) {
                    setState(() {
                      number = value;
                    });
                  });
                }
              });
              return _buildBody(context, initialValue: {
                'last_name': userProfile.lastName,
                'first_name': userProfile.firstName,
                'email': userProfile.email,
              });
            },
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context,
      {required Map<String, dynamic> initialValue}) {
    return Padding(
      padding: EdgeInsets.only(left: 10, top: 60, right: 10),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FormBuilder(
              key: _fbKey,
              initialValue: initialValue,
              child: Container(
                margin: const EdgeInsets.only(top: 20, right: 30, left: 30),
                child: Column(
                  children: <Widget>[
                    _buildLastName(context),
                    _buildFirstName(context),
                    _buildEmail(context),
                    _buildPhoneNumber(context),
                    _buildChoice(context),
                    _buildMessage(context),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          ElevatedButton(
                            child: Text('Contacter Centre'),
                            style : ButtonStyle( backgroundColor: MaterialStateProperty.all(Colors.lightBlue[800])),
                            onPressed: () async {
                              _fbKey.currentState!.saveAndValidate();
                              buildShowDialog(context);
                              final backendResponse = await Injector.resolve<
                                      ContactCenterServiceInterface>()
                                  .addForm(_fbKey.currentState!.value, phone,
                                      widget.training!.id);
                              Navigator.pop(context);

                              print(backendResponse);

                              if (backendResponse is bool) {
                                print('success');
                                Injector.resolve<GlobalMessageService>()
                                    .show('Votre message est bien envoyé');

                                Navigator.popUntil(context,
                                        (route) {
                                      return count++ == 3;
                                    });


                              } else {
                                setState(() {
                                  Navigator.pop(context);
                                  _backendErrors = Map<String, dynamic>.from(
                                      backendResponse);
                                  print('_backendErrors $_backendErrors');
                                });
                              }
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
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
        title: Text(
          widget.training!.title,
          style: appBarTitleStyle,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: iconColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: _buildUserProfileBlocBuilder(context),
    );
  }
}
