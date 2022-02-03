import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nerd/models/person.dart';
import 'package:nerd/resources/app_colors.dart';
import 'package:nerd/resources/drawables.dart';
import 'package:nerd/utils/app_text.dart';
import 'package:nerd/utils/widget_utils.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../Item_Gamer.dart';

class GameController with ChangeNotifier {
  int currentIndex = 0;
  int personsCountNeedToSkip = 0;
  int currentSkippedPersonsCount = 0;
  List<Person> personsList = <Person>[];
  AutoScrollController? controller;
  bool isGameRunning = false;

  void initPersonList({required int count, required BuildContext context}) {
    personsList =
        List.generate(count, (index) => Person(id: index + 1, isDel: false));
    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical);
  }

  void startGame(BuildContext context) {
    currentIndex = 0;
    personsCountNeedToSkip = 0;
    currentSkippedPersonsCount = 0;
    isGameRunning = true;
    deletePerson(context);
  }

  void deletePerson(BuildContext context) async {
    print("${personsList[currentIndex].id} del");
    personsList[currentIndex].isDel = true;
    notifyListeners();
    currentSkippedPersonsCount = 0;
    personsCountNeedToSkip += 1;
    new Timer(new Duration(milliseconds: 800), () async {
      checkCircle(context);
    });
  }

  Future<void> checkCircle(BuildContext context) async {
    if (personsList.where((element) => element.isDel == false).length > 1) {
      currentIndex += 1;
      if (currentIndex == personsList.length) {
        currentIndex = 0;
      }
      if (personsList.elementAt(currentIndex).isDel == true) {
        checkCircle(context);
      } else {
        await controller?.scrollToIndex(currentIndex);
        controller?.highlight(currentIndex, animated: false);
        new Timer(new Duration(milliseconds: 500), () async {
          if (currentSkippedPersonsCount >= personsCountNeedToSkip) {
            deletePerson(context);
          } else {
            skipPerson(context);
          }
        });
      }
    } else {
      endGame(context);
    }
  }

  void skipPerson(BuildContext context) {
    currentSkippedPersonsCount += 1;
    print("${personsList[currentIndex].id} skip ${currentSkippedPersonsCount}");
    checkCircle(context);
  }

  void endGame(BuildContext context) {
    isGameRunning = false;
    Person winnerPerson = personsList
        .where((element) => element.isDel == false)
        .toList()
        .elementAt(0);
    WidgetUtils.showSnackBar(context, "Winner Person is ${winnerPerson.id}");

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetAnimationDuration: Duration(microseconds: 800),
            insetAnimationCurve: Curves.easeInCirc,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            child: Container(
                padding: EdgeInsets.all(20),
                height: 250.0,
                width: 100.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText.large_20("Congratulations",
                        color: AppColors.primaryColorLight),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Image.asset(Drawables.avatarSitting,
                          fit: BoxFit.contain, height: 100),
                    ),
                    AppText.large_20(winnerPerson.id?.toString(),
                        fontWeight: FontWeight.w500),
                  ],
                )),
          );
        });
  }
}
