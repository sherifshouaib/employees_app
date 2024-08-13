import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  List selectedQuestions = [];

  // int price = 0;

  //int index = 1;
  int? datalength;
  String? selectedQuestion;
  int count = 1, noCount = 0, yesCount = 0, index = 1;

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

  skip() {
    ++index;
    notifyListeners();
  }

  add({required String selectedquestion}) {
    selectedQuestions.add(selectedquestion);
    ++index;
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
