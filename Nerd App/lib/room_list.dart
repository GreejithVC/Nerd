import 'package:flutter/material.dart';
import 'package:nerd/resources/drawables.dart';
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
        _offerProductsBannerView(),
      ],
    );
  }

  Widget _offerProductsBannerView() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GameRooms(personCount: 100),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.red),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: 140,
        child: Image.asset(
          Drawables.logo,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
