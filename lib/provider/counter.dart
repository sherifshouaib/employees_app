import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  List selectedQuestions = [];

  // int price = 0;

  //int index = 1;
  int? datalength;
  String? selectedQuestion;
  int count = 0,
      count2 = -1,
      noCount = 0,
      yesCount = 0,
      index = 1,
      countback = 0;

  addyesCount() {
    yesCount++;
    notifyListeners();
  }

  addnoCount() {
    noCount++;
    notifyListeners();
  }

  addtoemployee() {
    ++count;
    notifyListeners();
  }

  addcount2() {
    ++count2;
    notifyListeners();
  }

  skip() {
    ++index;
    countback = index;
    notifyListeners();
  }

  goBack() {
    --countback;
    index = countback;
    notifyListeners();
  }

  add({required String selectedquestion}) {
    selectedQuestions.add(selectedquestion);
    // ++index;
    // countback = index;

    // price += product.price.round();
    notifyListeners();
  }

  // delete(Question question) {
  //   selectedQuestions.remove(question);
  //   // price -= product.price.round();
  //   notifyListeners();
  // }

  get itemCount {
    return selectedQuestions.length;
  }
}
