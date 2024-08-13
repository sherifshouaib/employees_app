import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employees_app/provider/user_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetDataFromFirestoreToUsername extends StatefulWidget {
  //final String documentId;

  const GetDataFromFirestoreToUsername({
    super.key,
  });

  @override
  State<GetDataFromFirestoreToUsername> createState() =>
      _GetDataFromFirestoreToUsernameState();
}

class _GetDataFromFirestoreToUsernameState
    extends State<GetDataFromFirestoreToUsername> {
  @override
  Widget build(BuildContext context) {
    final userdata = Provider.of<UserData>(context);
    //counterrr.count = counterrr.datalength!;

    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc('kKif7PWimfWRCSbu2IpfAJfV6Sd2').get(),
      
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
          userdata.completename = data['first name'] + data['last name'];

          print(userdata.completename);

          return Text(
            "${data['first name']} ${data['last name']}",
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          );
                 

        }

        return const Text("loading");
      },
    );
  }
}
