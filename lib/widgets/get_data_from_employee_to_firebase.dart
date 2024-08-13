// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employees_app/models/question.dart';
import 'package:employees_app/provider/counter.dart';
import 'package:employees_app/provider/user_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetDataFromEmployeeToFirebase extends StatefulWidget {
  const GetDataFromEmployeeToFirebase({
    super.key,
    required this.yesnostor,
  });

  final String? yesnostor;
  @override
  State<GetDataFromEmployeeToFirebase> createState() =>
      _GetDataFromEmployeeToFirebaseState();
}

class _GetDataFromEmployeeToFirebaseState
    extends State<GetDataFromEmployeeToFirebase> {
  @override
  Widget build(BuildContext context) {
    final counterrr = Provider.of<Counter>(context);
  
    final userdata = Provider.of<UserData>(context);
   // final credential = FirebaseAuth.instance.currentUser;

    String? fullname;
    // Question? q1;
    Future<void> fetchField() async {
      try {
        DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(userdata.credential4!.user!.uid)
            .get();

        if (documentSnapshot.exists) {
          String firstname = documentSnapshot.get(
            'first name',
          );

          String lastname = documentSnapshot.get(
            'last name',
          );

          // print(firstname);
          // print(lastname);

          fullname = '$firstname $lastname';
          if (firstname != null &&
              widget.yesnostor != null &&
              counterrr.count2 < counterrr.selectedQuestions.length) {
            print('$firstname $lastname');
            // print(fullname);
            print(counterrr.selectedQuestions[counterrr.count2]);
            print(widget.yesnostor);
            print(DateTime.now().toString());

            // Question q1 = Question(
            //   answer: widget.yesnostor,
            //   question: counterrr.selectedQuestions[counterrr.count2],
            //   createdAt: DateTime.now().toString(),
            //   fullname: fullname,
            // );

            CollectionReference dashboardquestions =
                FirebaseFirestore.instance.collection('dashboardquestions');

            try {
              dashboardquestions
                  .add(
                    Question(
                      answer: widget.yesnostor,
                      question: counterrr.selectedQuestions[counterrr.count2],
                      createdAt: DateTime.now().toString(),
                      fullname: fullname,
                    ).toMap(),
                  )
                  .then((value) => print('User Added'))
                  .catchError((error) => print('Failed to add user: $error'));

              // print('question added successfully');
            } catch (e) {
              print('Failed to add products: $e');
            }

//  List<Question> questions = [];
//  questions.add(Question(question: counterrr.selectedQuestions[counterrr.count2],
//  answer: widget.yesnostor,
//   createdAt:  DateTime.now().toString(),
//    fullname: fullname),);
          }
          //  print('first name: $fullname'); // Output: User age: 30
          // //  var lastname =documentSnapshot.get('last name');
          // //   print('last name: $lastname'); // Output: User age: 30
        } else {
          print('Document does not exist');
        }
      } catch (e) {
        print('Failed to fetch field: $e');
      }
    }

    //counterrr.count = counterrr.datalength!;

    // return FutureBuilder<DocumentSnapshot>(
    //   future: dashboardquestions.doc('uJCPkYPHF9DZXnMpwYWO').get(),
    //   builder:
    //       (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
    //     if (snapshot.hasError) {
    //       return const Text("Something went wrong");
    //     }

    //     if (snapshot.hasData && !snapshot.data!.exists) {
    //       return const Text("Document does not exist");
    //     }

    // if (snapshot.connectionState == ConnectionState.done) {

    // Map<String, Question> data =
    //     snapshot.data!.data() as Map<String, Question>;

    //  GetDataFromFirestoreToUsername;

    // print(counterrr.selectedQuestions[counterrr.count]);

    fetchField();

    // if (fullname != null &&
    //     widget.yesnostor != null &&
    //     counterrr.count < counterrr.selectedQuestions.length) {}

    // dodo(dashboardquestions);
    // print('cat');

    // try {
    //   dashboardquestions
    //       .add(
    //         Question(
    //           answer: widget.yesnostor,
    //           question: counterrr.selectedQuestions[counterrr.count2],
    //           createdAt: DateTime.now().toString(),
    //           fullname: fullname,
    //         ).toMap(),
    //       )
    //       .then((value) => print('User Added'))
    //       .catchError((error) => print('Failed to add user: ${error}'));

    //   // print('question added successfully');
    // } catch (e) {
    //   print('Failed to add products: $e');
    // }

    // dashboardquestions
    //     .doc('bUSHYewt57hxNsDaFSzF')
    //     .set({})
    //     .then((value) => print("User Added"))
    //     .catchError((error) => print("Failed to add user: $error"));

    // dashboardquestions
    //     .doc('9JkPAwCnzaPWsRLyrJnn')
    //     .set({
    //       '${(question:${data[counterrr.selectedQuestions[counterrr.count]]} ,answer: ,fullname: ,createdAt: )}'     //'${data[counterrr.selectedQuestions[counterrr.count]]}':  ,
    //     })
    //     .then((value) => print("User Added"))
    //     .catchError((error) => print("Failed to add user: $error"));

    // print(data[counterrr.selectedQuestions[counterrr.count]]);

    // counterrr.datalength = data.length;
    // fillSelectedQuestion(counterrr, data);

    return const Center(
      child: Text(
        "",
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    // }

    // return const Text("loading");
  }

  // void dodo(CollectionReference<Object?> dashboardquestions) {
  //   Future<void> addquestion(Question question) async {
  //     // CollectionReference questionCollection =
  //     //     FirebaseFirestore.instance.collection('dashboardquestions');
  //     print('cat');
  //     try {
  //       await dashboardquestions
  //           .doc('bUSHYewt57hxNsDaFSzF')
  //           .set({'1': '2'})
  //           .then((value) => print('User Added'))
  //           .catchError((error) => print('Failed to add user: ${error}'));

  //       print('Products added successfully');
  //     } catch (e) {
  //       print('Failed to add products: $e');
  //     }
  //   }
  // }
}
