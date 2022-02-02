import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nerd/resources/app_colors.dart';
import 'package:nerd/resources/app_strings.dart';

class WidgetUtils {
  static Future<bool> showExitPopUp(BuildContext context) async {
    return await showPopUp(context,
        title: "Confirmation",
        message: "Are you sure to exit the app?",
        sBtnLabel: "Exit",
        sBtnFunction: () => Navigator.of(context).pop(true),
        showBtnN: true);
  }

  static Future<bool> showPopUp(BuildContext context,
      {String? title,
      String? message,
      String? sBtnLabel,
      String? nBtnLabel,
      GestureTapCallback? sBtnFunction,
      GestureTapCallback? nBtnFunction,
      bool? showBtnN}) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: AppColors.bgColor,
        title: Text(title ?? AppStrings.appName, textAlign: TextAlign.center),
        content: Text(
          message ?? "",
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          TextButton(
            child: Text(sBtnLabel ?? "OK"),
            onPressed: sBtnFunction ?? () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text(nBtnLabel ?? "Cancel"),
            onPressed: nBtnFunction ?? () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
