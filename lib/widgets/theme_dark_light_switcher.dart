import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keejob_mobile/theme/theme.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ThemeSwitcherDarkLight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: Duration(milliseconds: 100),
      crossFadeState: ThemeProvider.of(context)!.brightness == Brightness.dark
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      firstChild: GestureDetector(
        onTap: () => ThemeSwitcher.of(context)!.changeTheme(theme: kLightTheme),
        child: Icon(
          LineAwesomeIcons.sun,
          size: ScreenUtil().setSp(kSpacingUnit.w * 3),
        ),
      ),
      secondChild: GestureDetector(
        onTap: () => ThemeSwitcher.of(context)!.changeTheme(theme: kDarkTheme),
        child: Icon(
          LineAwesomeIcons.moon,
          size: ScreenUtil().setSp(kSpacingUnit.w * 3),
        ),
      ),
    );
  }
}
