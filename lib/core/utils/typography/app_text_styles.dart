import 'package:flutter/material.dart';
import 'package:tandem/core/utils/colors_config/app_colors_config.dart';
 import '../global_constant.dart';
import 'app_typography.dart';

class AppTextStylesSet extends TypographySet {
  /// text styles

  AppTextStylesSet() {
    /// headline 1
    headline1 = TextStyle(
        fontFamily: GlobalAppConsts.mainFontFamily,
        fontSize: 96,
        color: appColors.typographyTitle,
        fontWeight: FontWeight.w700);

    /// headline 2
    headline2 = TextStyle(
        fontFamily: GlobalAppConsts.mainFontFamily,
        fontSize: 60,
        color: appColors.typographyTitle,
        fontWeight: FontWeight.w700);

    /// headline 3
    headline3 = TextStyle(
        fontFamily: GlobalAppConsts.mainFontFamily,
        fontSize: 48,
        color: appColors.typographyTitle,
        fontWeight: FontWeight.w700);

    /// headline 4
    headline4 = TextStyle(
        fontFamily: GlobalAppConsts.mainFontFamily,
        fontSize: 34,
        color: appColors.typographyTitle,
        fontWeight: FontWeight.w700);

    /// headline 5
    headline5 = TextStyle(
        fontFamily: GlobalAppConsts.mainFontFamily,
        fontSize: 24,
        color: appColors.typographyTitle,
        fontWeight: FontWeight.w700);

    /// headline 6
    headline6 = TextStyle(
        fontFamily: GlobalAppConsts.mainFontFamily,
        fontSize: 20,
        color: appColors.typographyTitle,
        fontWeight: FontWeight.w700);

    /// body 1
    body1 = TextStyle(
        fontFamily: GlobalAppConsts.mainFontFamily,
        fontSize: 16,
        height: 1.7,
        color: appColors.typographyTitle,
        fontWeight: FontWeight.w700);

    /// body 2
    body2 = TextStyle(
        fontFamily: GlobalAppConsts.mainFontFamily,
        fontSize: 14,
        height: 1.7,
        color: appColors.typographyTitle,
        fontWeight: FontWeight.w700);





    /// headline 1
    t1 = TextStyle(
        fontFamily: GlobalAppConsts.mainFontFamily,
        fontSize: 22,
        color: appColors.typographyTitle,
        fontWeight: FontWeight.w700);

    /// headline 1
    b1 = TextStyle(
        fontFamily: GlobalAppConsts.mainFontFamily,
        fontSize: 16,
        color: appColors.typographyTitle,
        fontWeight: FontWeight.w700);


    /// headline 1
    b2 = TextStyle(
        fontFamily: GlobalAppConsts.mainFontFamily,
        fontSize: 14,
        color: appColors.typographyTitle,
        fontWeight: FontWeight.w700);





  }
}

TypographySet appTextStyles = AppTextStylesSet();
