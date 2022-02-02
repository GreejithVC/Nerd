import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nerd/models/person.dart';
import 'package:nerd/resources/app_colors.dart';
import 'package:nerd/resources/drawables.dart';
import 'package:nerd/utils/app_text.dart';

class ItemGamer extends StatelessWidget {
  final Person? person;

  const ItemGamer({Key? key, this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return person?.isDel == true
        ? Container(width: 0, height: 0)
        : Container(
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.disabledTextColor),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _imageView(),
                _titleView(),
              ],
            ),
          );
  }

  Widget _imageView() {
    return Image.asset(
      Drawables.avatarSitting,
      fit: BoxFit.contain,
      height: 50,
    );
  }

  Widget _titleView() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: AppText.normal_14(person?.id?.toString() ?? "",
          fontWeight: FontWeight.w500),
    );
  }
}
