import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nerd/resources/app_colors.dart';
import 'package:nerd/resources/drawables.dart';
import 'package:nerd/dashboard.dart';
import 'package:nerd/utils/widget_utils.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    new Timer(new Duration(seconds: 3), () async {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
          (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => WidgetUtils?.showExitPopUp(context),
      child: Scaffold(
        backgroundColor: AppColors.textDarkBlackColor,
        body: Center(
            child:
                Image.asset(Drawables.logo, width: 250, fit: BoxFit.contain)),
      ),
    );
  }
}
