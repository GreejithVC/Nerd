import 'package:flutter/material.dart';
import 'package:nerd/resources/app_colors.dart';

class AppTextStyle {
  static TextStyle normal_14(
      {Color? color, String? fontFamily, FontWeight? fontWeight}) {
    return TextStyle(
      color: color ?? AppColors.textDarkBlackColor,
      fontSize: 10,
      fontWeight: fontWeight ?? FontWeight.normal,
    );
  }
  static TextStyle large_20(
      {Color? color, String? fontFamily, FontWeight? fontWeight}) {
    return TextStyle(
      color: color ?? AppColors.textDarkBlackColor,
      fontSize: 20,
      fontWeight: fontWeight ?? FontWeight.normal,
    );
  }
}
