import 'package:flutter/material.dart';
import 'package:nerd/resources/app_colors.dart';
import 'package:nerd/resources/drawables.dart';
import 'package:nerd/utils/app_text.dart';
import 'package:provider/provider.dart';

import 'controller/game_controller.dart';
import 'game_rooms.dart';

class RoomList extends StatefulWidget {
  const RoomList({Key? key}) : super(key: key);

  @override
  _RoomListState createState() => _RoomListState();
}

class _RoomListState extends State<RoomList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        gameRoomsBannerView(100,"Game Room 100 players",Drawables.room100),
        gameRoomsBannerView(50,"Game Room 50 players",Drawables.room50),
        gameRoomsBannerView(15,"Game Room 15 players",Drawables.room15),
      ],
    );
  }

  Widget gameRoomsBannerView(int personCount,String title,String image) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GameRooms(personCount: personCount),
          ),
        );
      },
      child: Container(padding: EdgeInsets.all(16),
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],

            borderRadius: BorderRadius.circular(8), color:Colors.white),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: 140,
        child: Column(
          children: [
            Image.asset(
              image,
              height: 90,width: 250,
              // color: Colors.red,
              fit: BoxFit.contain,
            ),
            AppText.normal_14(title)
          ],
        ),
      ),
    );
  }
}
