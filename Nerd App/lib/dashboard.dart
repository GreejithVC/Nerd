import 'package:flutter/material.dart';
import 'package:nerd/resources/app_colors.dart';
import 'package:nerd/utils/app_text.dart';

import 'game_rooms.dart';
import 'credits_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.bgWhiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          flexibleSpace: Container(
            alignment: Alignment.bottomCenter,
            child: TabBar(
              tabs: [
                _tabView("GAME ROOMS",),
                _tabView("CREDITS"),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            GameRooms(),
            CreditsView(),

            // second tab bar viiew widget
          ],
        ),
      ),
    );
  }

  Widget _tabView(String? title) {
    return Tab(
      child: AppText.large_20(title ?? "", fontWeight: FontWeight.w500,color: AppColors.bgWhiteColor),
    );
  }
}
