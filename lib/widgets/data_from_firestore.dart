// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employees_app/provider/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetDataFromFirestore extends StatefulWidget {
  //final String documentId;

  const GetDataFromFirestore({
    super.key,
  });

  @override
  State<GetDataFromFirestore> createState() => _GetDataFromFirestoreState();
}

class _GetDataFromFirestoreState extends State<GetDataFromFirestore> {
  @override
  Widget build(BuildContext context) {
    final counterrr = Provider.of<Counter>(context);

    CollectionReference questionsBank =
        FirebaseFirestore.instance.collection('questions_bank');

    CollectionReference dashboardquestions =
        FirebaseFirestore.instance.collection('dashboardquestions');




    final dialogUsernameController = TextEditingController();
   // final credential = FirebaseAuth.instance.currentUser;

    myDialog(Map data, int length) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
            child: Container(
              padding: const EdgeInsets.all(22),
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                      controller: dialogUsernameController,
                      maxLength: 40,
                      decoration:
                          const InputDecoration(hintText: "Enter new question")),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                          onPressed: () {
                            questionsBank
                                .doc('UEJYt8VYGjHM1en8i0DV')
                                .update({
                                  '${length + 1}':
                                      dialogUsernameController.text,
                                })
                                .then((value) => print("User Added"))
                                .catchError((error) =>
                                    print("Failed to add user: $error"));

                            dashboardquestions
                                .doc('9JkPAwCnzaPWsRLyrJnn')
                                .update({
                                  '${length + 1}':
                                      dialogUsernameController.text,
                                })
                                // ignore: avoid_print
                                .then((value) => print("User Added"))
                                .catchError((error) =>
                                    print("Failed to add user: $error"));

                            // questions_bank
                            //     .doc(credential.uid)
                            //     .set({
                            //       'imgLink': urll,
                            //       'username': usernameController.text,
                            //       'age': ageController.text,
                            //       'title': titleController.text,
                            //       'email': emailController.text,
                            //       'pass': passwordController.text,
                            //     })
                            //     .then((value) => print("User Added"))
                            //     .catchError((error) =>
                            //         print("Failed to add user: $error"));

                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                          child: const Text(
                            "Add",
                            style: TextStyle(fontSize: 22),
                          )),
                      TextButton(
                          onPressed: () {
                            //  addnewtask();
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(fontSize: 22),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return FutureBuilder<DocumentSnapshot>(
      future: questionsBank.doc('UEJYt8VYGjHM1en8i0DV').get(),
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
          counterrr.datalength = data.length;
          fillSelectedQuestion(counterrr, data);
          if (counterrr.index > data.length) {
            //counterrr.index--;
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        myDialog(data, data.length);
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'there is no other questions ✋',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          }

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      myDialog(data, data.length);
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 30),
                child: Text(
                  "${data[counterrr.index.toString()]}",
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        }

        return const Text("loading");
      },
    );
  }

  void fillSelectedQuestion(Counter counterrr, Map<String, dynamic> data) {
    if (counterrr.index <= data.length) {
      counterrr.selectedQuestion = data[(counterrr.index).toString()];
    }
  }
}
