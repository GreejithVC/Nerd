import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nerd/resources/app_colors.dart';
import 'package:nerd/resources/drawables.dart';
import 'package:nerd/utils/app_text.dart';

class ItemGamer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.disabledTextColor),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          _imageView(),
          Spacer(),
          _titleView(),
          _priceView(),
        ],
      ),
    );
  }

  Widget _imageView() {
    return Container(
      height: 50,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      // margin: EdgeInsets.only(top: 14, left: 14, right: 14),
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.only(
          //     topLeft: Radius.circular(8), topRight: Radius.circular(8))
      ),
      child: Image.asset(
        // _homeController?.homePageSliderList?[itemIndex].sliderImage ?? "",
        Drawables.avatarSitting,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _titleView() {
    return AppText.normal_10("Player 1", fontWeight: FontWeight.w500);
  }

  Widget _priceView() {
    return AppText.normal_10("10 points", fontWeight: FontWeight.w700);
  }
}
