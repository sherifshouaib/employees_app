import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employees_app/constants.dart';
import 'package:employees_app/provider/counter.dart';
import 'package:employees_app/provider/user_data.dart';
import 'package:employees_app/widgets/answer_question.dart';
import 'package:employees_app/widgets/data_from_firestore_to_employee.dart';
import 'package:employees_app/widgets/get_data_from_employee_to_firebase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeePage extends StatefulWidget {
  EmployeePage({super.key});

  static String id = 'EmployeePage';

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  //int index = 0;
  String? yesnostor;

  @override
  Widget build(BuildContext context) {
    final counterrr = Provider.of<Counter>(context);
    final userdata = Provider.of<UserData>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: const Text('Today\'s Questions'),

        
        leading: IconButton(
          onPressed: () {
            counterrr.count=0;
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),


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
                if (counterrr.count < (counterrr.selectedQuestions.length)) {
                  print(counterrr.count);
                  print(counterrr.count2);

                  counterrr.addyesCount();
                  counterrr.addcount2();
                  counterrr.addtoemployee();
                  yesnostor = 'Yes';
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
                if (counterrr.count < counterrr.selectedQuestions.length) {
                  print(counterrr.count);
                  print(counterrr.count2);

                  counterrr.addnoCount();
                  counterrr.addcount2();
                  counterrr.addtoemployee();
                  yesnostor = 'No';
                }
              },
              answer: 'No',
              ver: 20,
              hor: 70,
              fontsize: 24,
              color: Colors.deepPurple[900]!,
            ),
            GetDataFromEmployeeToFirebase(
              yesnostor: yesnostor,
            ),
          ],
        ),
      ),
    );
  }
}
