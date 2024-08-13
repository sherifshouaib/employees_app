// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:employees_app/models/question.dart';
// import 'package:employees_app/provider/counter.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class GetDataFromFirbaseToDashboard extends StatefulWidget {
//   const GetDataFromFirbaseToDashboard({super.key});

//   @override
//   State<GetDataFromFirbaseToDashboard> createState() => _GetDataFromFirbaseToDashboardState();
// }

// class _GetDataFromFirbaseToDashboardState extends State<GetDataFromFirbaseToDashboard> {
//  @override
//   Widget build(BuildContext context) {
//     final counterrr = Provider.of<Counter>(context);
//     //counterrr.count = counterrr.datalength!;

//     CollectionReference dashboardquestions =
//         FirebaseFirestore.instance.collection('dashboardquestions');

//     return FutureBuilder<DocumentSnapshot>(
//       future: dashboardquestions.doc().get(),
//       builder:
//           (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return const Text("Something went wrong");
//         }

//         if (snapshot.hasData && !snapshot.data!.exists) {
//           return const Text("Document does not exist");
//         }


// Future<Question> fetchProducts() async {
//   CollectionReference productsCollection = FirebaseFirestore.instance.collection('dashboardquestions');

//   try {
//     QuerySnapshot querySnapshot = await productsCollection.get();
    
//     Question question = querySnapshot.docs.map(
//       (doc) {
//       return Question.fromMap(doc.data() as Map<String, dynamic>);
//     }
//     );
//     return question;
//   } catch (e) {
//     print('Failed to fetch products: $e');
//     return [];
//   }
// }





//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data =
//               snapshot.data!.data() as Map<String, dynamic>;
//           // counterrr.datalength = data.length;
//           // fillSelectedQuestion(counterrr, data);











//           if (counterrr.count >= counterrr.selectedQuestions.length) {
//             //counterrr.index--;
//             return Text(
//               'there is no other questions ✋',
//               style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold,
//               ),
//             );
//           }

//           return Padding(
//             padding: const EdgeInsets.only(left: 50, right: 30),
//             child: Text(
//               "${counterrr.selectedQuestions[counterrr.count]}",
//               style: const TextStyle(
//                 fontSize: 23,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           );
//         }

//         return const Text("loading");
//       },
//     );
//   }
// }

