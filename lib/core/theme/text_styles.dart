import 'package:flutter/material.dart';
import 'package:sprints_shopping_app/gen/colors.gen.dart';
import 'package:sprints_shopping_app/gen/fonts.gen.dart';

class TextStyles {
  static TextStyle get appTitle => TextStyle(
    fontFamily: FontFamily.suwannaphum,
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: ColorName.whiteColor,
  );
  static TextStyle get subTitle => TextStyle(
    fontFamily: FontFamily.suwannaphum,
    fontSize: 28,
    color: ColorName.whiteColor,
  );
  static TextStyle get primeText => TextStyle(
    fontFamily: FontFamily.suwannaphum,
    fontSize: 20,
    color: ColorName.primaryColor,
  );
  static TextStyle get normalText => TextStyle(
    fontFamily: FontFamily.suwannaphum,
    fontSize: 15,
    color: ColorName.blackColor,
  );
}
