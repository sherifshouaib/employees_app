import 'package:employees_app/constants.dart';
import 'package:employees_app/provider/counter.dart';
import 'package:employees_app/widgets/answer_question.dart';
import 'package:employees_app/widgets/data_from_firestore.dart';
import 'package:employees_app/widgets/questions_counter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class QuestionsBank extends StatelessWidget {
  QuestionsBank({super.key});

  static String id = 'QuestionsBank';
  final credential = FirebaseAuth.instance.currentUser;

  CollectionReference questions_bank =
      FirebaseFirestore.instance.collection(kQuestionsBank);

  @override
  Widget build(BuildContext context) {
    final counterrr = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: const Text('Questions Bank'),
        actions: [
          const QuestionsCounter(),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetDataFromFirestore(),
              const SizedBox(
                height: 10,
              ),
              AnswerQuestion(
                onPressed: () {},
                answer: 'Yes',
                ver: 20,
                hor: 70,
                fontsize: 24,
                color: Colors.deepPurple[900]!,
              ),
              const SizedBox(
                height: 15,
              ),
              AnswerQuestion(
                onPressed: () {},
                answer: 'No',
                ver: 20,
                hor: 70,
                fontsize: 24,
                color: Colors.deepPurple[900]!,
              ),
              const SizedBox(
                height: 40,
              ),
              AnswerQuestion(
                onPressed: () {
                  // print(counterrr.selectedQuestion);
                  // print(counterrr.index);
        
        
                  if (counterrr.selectedQuestions
                      .contains(counterrr.selectedQuestion)) {
                           // ++counterrr.index;
        
                    return;
                  }
        
                  // for (int i = 0; i < counterrr.selectedQuestions.length; i++) {
                  //   if (counterrr.selectedQuestion ==
                  //       counterrr.selectedQuestions[i]) {
                  //     return;
                  //   }
                  // }
        
                  if (counterrr.index <= counterrr.datalength!) {
                    counterrr.add(selectedquestion: counterrr.selectedQuestion!);
                  }
        
                  // print(counterrr.selectedQuestion);
                  // print(counterrr.index);
                  // print(counterrr.datalength);
                  
                },
                answer: 'push this question to employees accounts',
                ver: 4,
                hor: 23,
                fontsize: 18,
                color: kSecondaryColor,
              ),
              const SizedBox(
                height: 10,
              ),
              AnswerQuestion(
                onPressed: () {
                  if (counterrr.index <= counterrr.datalength!) {
                    counterrr.skip();
                  }
                },
                answer: 'skip this question',
                ver: 4,
                hor: 23,
                fontsize: 18,
                color: kSecondaryColor,
              ),
               const SizedBox(
                height: 10,
              ),
              AnswerQuestion(
                  onPressed: () {
                    if (counterrr.countback >= 2) {
                      counterrr.goBack();
                    }
                  },
                  answer: 'return to the previous question',
                  ver: 4,
                  hor: 23,
                  fontsize: 18,
                  color: kSecondaryColor),
            ],
          ),
        ),
      ),
    );
  }
}
