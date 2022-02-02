import 'package:flutter/material.dart';
import 'app_text_style.dart';

class AppText {

  static Widget normal_14(String? text,
      {Color? color, String? fontFamily, FontWeight? fontWeight}) {
    return Text(
      text ?? "",
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      softWrap: true,
      style: AppTextStyle.normal_14(
          color: color, fontFamily: fontFamily, fontWeight: fontWeight),
    );
  }
  static Widget large_20(String? text,
      {Color? color, String? fontFamily, FontWeight? fontWeight}) {
    return Text(
      text ?? "",
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      softWrap: true,
      style: AppTextStyle.large_20(
          color: color, fontFamily: fontFamily, fontWeight: fontWeight),
    );
  }
}
