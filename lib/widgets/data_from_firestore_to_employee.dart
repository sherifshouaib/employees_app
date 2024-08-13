import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employees_app/provider/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetDataFromFirestoreToEmployee extends StatefulWidget {
  //final String documentId;

  const GetDataFromFirestoreToEmployee({
    super.key,
  });

  @override
  State<GetDataFromFirestoreToEmployee> createState() => _GetDataFromFirestoreToEmployeeState();
}

class _GetDataFromFirestoreToEmployeeState extends State<GetDataFromFirestoreToEmployee> {
  @override
  Widget build(BuildContext context) {
    final counterrr = Provider.of<Counter>(context);
    //counterrr.count = counterrr.datalength!;

    CollectionReference questions_bank =
        FirebaseFirestore.instance.collection('questions_bank');

    return FutureBuilder<DocumentSnapshot>(
      future: questions_bank.doc('UEJYt8VYGjHM1en8i0DV').get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          // counterrr.datalength = data.length;
          // fillSelectedQuestion(counterrr, data);

          if (counterrr.count >= counterrr.selectedQuestions.length) {
            //counterrr.index--;
            return Text(
              'there is no other questions ✋',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.only(left: 50, right: 30),
            child: Text(
              "${counterrr.selectedQuestions[counterrr.count]}",
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }

        return const Text("loading");
      },
    );
  }
}
