import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nerd/resources/app_colors.dart';
import 'package:nerd/resources/app_strings.dart';
import 'package:nerd/splash_screen.dart';
import 'package:provider/provider.dart';

import 'controller/game_controller.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => GameController()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.primarySwatchColor,
      ),
      home: SplashScreen(),
    );
  }
}
