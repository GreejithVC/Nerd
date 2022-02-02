import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nerd/controller/game_controller.dart';
import 'package:nerd/resources/app_colors.dart';
import 'package:nerd/utils/app_text.dart';
import 'package:provider/provider.dart';
import 'Item_Gamer.dart';

class GameRooms extends StatelessWidget {
  static GameController? _gameController;

  @override
  Widget build(BuildContext context) {
    _gameController = Provider.of<GameController>(context);
    return Scaffold(
      backgroundColor: AppColors.bgWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        actions: [
          GestureDetector(
              onTap: () {
                _gameController?.startGame();
              },
              child: Container(
                  margin: EdgeInsets.only(right: 32),
                  child: Row(
                    children: [
                      AppText.normal_14("Start", color: AppColors.bgWhiteColor),
                      Icon(Icons.play_arrow, color: AppColors.bgWhiteColor),
                    ],
                  ))),
        ],
      ),
      body: _listView(),
    );
  }

  Widget _listView() {
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.all(16),
      crossAxisCount: 5,
      itemCount: _gameController?.personsList.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return ItemGamer(person: _gameController?.personsList[index]);
      },
      staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
      mainAxisSpacing: 12,
      crossAxisSpacing: 10,
    );
  }
}
