import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'Item_Gamer.dart';

class GameRooms extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(

      inAsyncCall: false,
      child:
      ListView(children: [
        _gameRoom1(),
      ],)

    );
  }
  Widget _gameRoom1() {
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(16),
      crossAxisCount: 8,
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
