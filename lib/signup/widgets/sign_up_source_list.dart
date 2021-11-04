import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:keejob_mobile/injector.dart';
import 'package:keejob_mobile/signup/service/signup-source-service.dart';
import 'package:keejob_mobile/shared/form_validators.dart';

class SignUpSourceWidget extends StatelessWidget {
  late SignUpSourceServiceInterface? _signUpSourceService;
  final Map<String, dynamic> _backendErrors = {};
  SignUpSourceWidget(_backendErrors);

  @override
  Widget build(BuildContext context) {
    _signUpSourceService = Injector.resolve<SignUpSourceServiceInterface>();
    return FutureBuilder<List>(
      future: _signUpSourceService?.fetchSignUpSource(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
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
                child: Text(item['display_name']),
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
