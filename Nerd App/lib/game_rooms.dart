import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'Item_Gamer.dart';

class GameRooms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _gameRoom1(),
      ],
    );
  }

  Widget _gameRoom1() {
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(16),
      crossAxisCount: 6,
      // itemCount: _homeController?.comboList?.length ?? 0,
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) {
        return ItemGamer();
      },
      staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
      mainAxisSpacing: 12,
      crossAxisSpacing: 10,
    );
  }
}
