import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nerd/controller/game_controller.dart';
import 'package:nerd/resources/app_colors.dart';
import 'package:nerd/utils/app_text.dart';
import 'package:nerd/utils/widget_utils.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'Item_Gamer.dart';

class GameRooms extends StatefulWidget {
  @override
  State<GameRooms> createState() => _GameRoomsState();
}

class _GameRoomsState extends State<GameRooms> {
  GameController? _gameController;

  @override
  void initState() {
    super.initState();
    Provider.of<GameController>(context, listen: false)
        .initPersonList(count: 50, context: context);
  }

  @override
  Widget build(BuildContext context) {
    _gameController = Provider.of<GameController>(context);
    return WillPopScope(
      onWillPop: () => checkAndPop(),
      child: Scaffold(
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
                        AppText.normal_14("Start",
                            color: AppColors.bgWhiteColor),
                        Icon(Icons.play_arrow, color: AppColors.bgWhiteColor),
                      ],
                    ))),
          ],
        ),
        body: _listView(),
      ),
    );
  }

  Future<bool> checkAndPop() async {
    if (_gameController?.isGameRunning == true) {
      WidgetUtils?.showSnackBar(context, "Game is running. Please stay back");
      return false;
    }
    return true;
  }

  Widget _listView() {
    if (_gameController?.controller == null) {
      _gameController?.controller = AutoScrollController(
          viewportBoundaryGetter: () =>
              Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
          axis: Axis.vertical);
    }
    return StaggeredGridView.countBuilder(
      controller: _gameController?.controller,
      padding: EdgeInsets.all(16),
      crossAxisCount: 5,
      itemCount: _gameController?.personsList.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return AutoScrollTag(
            key: ValueKey(index),
            controller: _gameController!.controller!,
            index: index,
            highlightColor: Colors.purple.withOpacity(0.1),
            child: ItemGamer(person: _gameController?.personsList[index]));
      },
      staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
      mainAxisSpacing: 12,
      crossAxisSpacing: 10,
    );
  }
}
