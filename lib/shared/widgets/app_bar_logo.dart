import 'package:flutter/material.dart';

class AppBarLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo-keejob.png',
      fit: BoxFit.cover,
      height: 45,
    );
  }
}
