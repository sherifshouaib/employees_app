import 'package:employees_app/constants.dart';
import 'package:employees_app/provider/counter.dart';
import 'package:employees_app/widgets/answer_question.dart';
import 'package:employees_app/widgets/data_from_firestore_to_employee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  static String id = 'EmployeePage';

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  //int index = 0;

  @override
  Widget build(BuildContext context) {
    final counterrr = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: Text('Today\'s Questions'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const GetDataFromFirestoreToEmployee(),
            const SizedBox(
              height: 10,
            ),
            AnswerQuestion(
              onPressed: () {
                if (counterrr.count <= (counterrr.selectedQuestions.length)) {
                  counterrr.addyesCount();
                  counterrr.addtoemployee();
                }
              },
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
              onPressed: () {
                if (counterrr.count <= counterrr.selectedQuestions.length) {
                  counterrr.addnoCount();
                  counterrr.addtoemployee();
                }
              },
              answer: 'No',
              ver: 20,
              hor: 70,
              fontsize: 24,
              color: Colors.deepPurple[900]!,
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
