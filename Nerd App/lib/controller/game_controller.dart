import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nerd/models/person.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

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

  void startGame() {
    currentIndex = 0;
    personsCountNeedToSkip = 0;
    currentSkippedPersonsCount = 0;
    isGameRunning = true;
    deletePerson();
  }

  void deletePerson() async {
    print("${personsList[currentIndex].id} del");
    personsList[currentIndex].isDel = true;
    notifyListeners();
    currentSkippedPersonsCount = 0;
    personsCountNeedToSkip += 1;
    new Timer(new Duration(milliseconds: 800), () async {
      checkCircle();
    });
  }

  Future<void> checkCircle() async {
    if (personsList.where((element) => element.isDel == false).length > 1) {
      currentIndex += 1;
      if (currentIndex == personsList.length) {
        currentIndex = 0;
      }
      if (personsList.elementAt(currentIndex).isDel == true) {
        checkCircle();
      } else {
        await controller?.scrollToIndex(currentIndex);
        controller?.highlight(currentIndex, animated: false);
        new Timer(new Duration(milliseconds: 500), () async {
          if (currentSkippedPersonsCount >= personsCountNeedToSkip) {
            deletePerson();
          } else {
            skipPerson();
          }
        });
      }
    }else{
      isGameRunning = false;
    }
  }

  void skipPerson() {
    currentSkippedPersonsCount += 1;
    print("${personsList[currentIndex].id} skip ${currentSkippedPersonsCount}");
    checkCircle();
  }
}
