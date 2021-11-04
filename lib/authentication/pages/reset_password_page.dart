import 'package:flutter/material.dart';
import 'package:keejob_mobile/authentication/services/reset_password_service.dart';
import 'package:keejob_mobile/injector.dart';
import 'package:keejob_mobile/shared/widgets/app_bar_logo.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _emailController = TextEditingController();

  buildShowMessage() {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text('Confirmation'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text(
                        'Nous avons envoyé par courrier électronique des instructions sur la configuration de votre mot de passe à l\'adresse e-mail que vous avez soumis. Vous devriez le recevoir sous peu.'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ]);
        });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: AppBarLogo(),
        actions: [
          IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 0, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                          child: Icon(
                        Icons.info,
                        size: 17.0,
                      )),
                      WidgetSpan(
                        child: SizedBox(
                          width: 2.0,
                        ),
                      ),
                      TextSpan(
                        text:
                            'Saisissez l\'email associé à votre compte et nous vous enverrons les instructions pour réinitialiser votre mot de passe.',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                ),
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
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.lightBlue[800]!)),
                  child: Text('Envoyer'),
                  onPressed: () async {
                    final backendResponse =
                        await Injector.resolve<ResetPasswordServiceInterface>()
                            .resetPassword(_emailController.text);
                    if (backendResponse is bool) {
                      buildShowMessage();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
