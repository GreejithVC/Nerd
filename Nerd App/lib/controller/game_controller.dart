import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nerd/models/person.dart';

class GameController with ChangeNotifier {
  int currentIndex = 0;
  int personsCountNeedToSkip = 0;
  int currentSkippedPersonsCount = 0;
  List<Person> personsList = <Person>[];

  void initPersonList(int count) {
    personsList =
        List.generate(count, (index) => Person(id: index + 1, isDel: false));
  }

  void startGame() {
    currentIndex = 0;
    personsCountNeedToSkip = 0;
    currentSkippedPersonsCount = 0;
    deletePerson();
  }

  void deletePerson() {
    print("${personsList[currentIndex].id} del");
    personsList[currentIndex].isDel = true;
    notifyListeners();
    currentSkippedPersonsCount = 0;
    personsCountNeedToSkip += 1;
    new Timer(new Duration(seconds: 3), () async {
      checkCircle();
    });
  }

  void checkCircle() {
    if (personsList.where((element) => element.isDel == false).length > 1) {
      currentIndex += 1;
      if (currentIndex == personsList.length) {
        currentIndex = 0;
      }
      if (personsList.elementAt(currentIndex).isDel == true) {
        checkCircle();
      } else {
        if (currentSkippedPersonsCount >= personsCountNeedToSkip) {
          deletePerson();
        } else {
          skipPerson();
        }
      }
    }
  }

  void skipPerson() {
    currentSkippedPersonsCount += 1;
    print("${personsList[currentIndex].id} skip ${currentSkippedPersonsCount}");
    checkCircle();
  }
}
