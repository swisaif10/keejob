import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const kSpacingUnit = 10;

const kDarkPrimaryColor = Color(0xFF212121);
const kDarkSecondaryColor = Color(0xFF373737);
const kLightPrimaryColor = Color(0xFFFFFFFF);
const kLightSecondaryColor = Color(0xFFF3F7FB);
const kAccentColor = Color(0xFFFFC107);
const bAccentColor = Colors.orange;

final kTitleTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.7),
  fontWeight: FontWeight.w600,
);

final kCaptionTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.3),
  fontWeight: FontWeight.w100,
);

final kButtonTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
  fontWeight: FontWeight.w400,
  color: kDarkPrimaryColor,
);

final kDarkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'SFProText',
  primaryColor: kDarkPrimaryColor,
  canvasColor: kDarkPrimaryColor,
  backgroundColor: kDarkSecondaryColor,
  accentColor: kAccentColor,
  iconTheme: ThemeData.dark().iconTheme.copyWith(
        color: kLightSecondaryColor,
      ),
  textTheme: ThemeData.dark().textTheme.apply(
        fontFamily: 'SFProText',
        bodyColor: kLightSecondaryColor,
        displayColor: kLightSecondaryColor,
      ),
);

final kLightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'SFProText',
  primaryColor: kLightPrimaryColor,
  canvasColor: kLightPrimaryColor,
  backgroundColor: kLightSecondaryColor,
  accentColor: kAccentColor,
  iconTheme: ThemeData.light().iconTheme.copyWith(
        color: kDarkSecondaryColor,
      ),
  textTheme: ThemeData.light().textTheme.apply(
        fontFamily: 'SFProText',
        bodyColor: kDarkSecondaryColor,
        displayColor: kDarkSecondaryColor,
      ),
);

final textTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'SFProText',
  primaryColor: kLightPrimaryColor,
  canvasColor: kLightPrimaryColor,
  backgroundColor: kLightSecondaryColor,
  accentColor: kAccentColor,
  iconTheme: ThemeData.light().iconTheme.copyWith(
        color: kDarkSecondaryColor,
      ),
  textTheme: ThemeData.light().textTheme.apply(
        fontFamily: 'SFProText',
        bodyColor: kDarkSecondaryColor,
        displayColor: kDarkSecondaryColor,
      ),
);

// Create a unique theme with "ThemeData"
final titleStyle =
    //color: Colors.grey[600], fontFamily: 'RobotoMono' )
    TextStyle(
        color: Colors.grey[700],
        fontFamily: 'Roboto',
        fontSize: 17,
        fontWeight: FontWeight.normal);

final subtitleStyle = TextStyle(
    color: Colors.grey[700],
    fontFamily: 'Roboto',
    fontSize: 15,
    fontWeight: FontWeight.normal);

final subtitleBoldStyle = TextStyle(
    color: Colors.grey[700],
    fontFamily: 'Roboto',
    fontSize: 15,
    fontWeight: FontWeight.bold);

final bodyStyle = TextStyle(color: Colors.grey[600], fontFamily: 'RobotoMono');

final borderColor = Colors.grey[100];

final iconColor = Colors.grey[800];

final listTitleStyle = TextStyle(
  color: Colors.blue[900],
  fontFamily: 'Roboto',
  fontSize: 17,
  fontWeight: FontWeight.normal,
);

final jobFormat = TextStyle(
  color: Colors.blue[900],
  fontFamily: 'Roboto',
  fontSize: 17,
  fontWeight: FontWeight.w500,
);


final jobFormat1 = TextStyle(
  color: Colors.blue[900],
  fontFamily: 'Roboto',
  fontSize: 14,
  fontWeight: FontWeight.w400,
);
final listSubTitleStyle = TextStyle(
  color: Colors.grey[700],
  fontFamily: 'Roboto',
  fontSize: 16,
  fontWeight: FontWeight.normal,
);

final appBarTitleStyle = TextStyle(
  color: Colors.blue[900],
  fontFamily: 'Roboto',
  fontSize: 14,
  fontWeight: FontWeight.normal,
);
