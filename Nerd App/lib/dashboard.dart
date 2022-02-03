import 'package:flutter/material.dart';
import 'package:nerd/resources/app_colors.dart';
import 'package:nerd/room_list.dart';
import 'package:nerd/utils/app_text.dart';
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
              indicatorColor: AppColors.textWhiteColor,
              indicatorWeight: 5,
              tabs: [
                _tabView("GAME ROOMS"),
                _tabView("CREDITS"),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            RoomList(),
            CreditsView(),

            // second tab bar viiew widget
          ],
        ),
      ),
    );
  }

  Widget _tabView(String? title) {
    return Tab(
      child: AppText.large_20(title ?? "",
          fontWeight: FontWeight.w500, color: AppColors.bgWhiteColor),
    );
  }
}
