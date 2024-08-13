import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employees_app/models/question.dart';
import 'package:employees_app/provider/dashboard_detail.dart';
import 'package:employees_app/provider/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class UsersDetailsDashboard extends StatefulWidget {
  UsersDetailsDashboard({super.key});

  @override
  State<UsersDetailsDashboard> createState() => _UsersDetailsDashboardState();
}
////////

class _UsersDetailsDashboardState extends State<UsersDetailsDashboard> {
  List datalist = [];

  List datalist2 = [];

  @override
  Widget build(BuildContext context) {
    final dashboarddetail = Provider.of<DashboardDetail>(context);

    Future<List<Question>> getDashboardQuestionssByField(
        String fieldName, dynamic fieldValue) async {
      try {
        // Query the collection with a where clause
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection(' dashboardquestions')
            .where(fieldName, isEqualTo: fieldValue)
            .get();

        // Map the documents to User objects
        List<Question> questions = querySnapshot.docs
            .map((doc) => Question.fromMap(doc.data() as Map<String, dynamic>))
            .toList();

        // Return the list of users
        return questions;
      } catch (e) {
        print("Failed to get users: $e");
        return [];
      }
    }

    Future<List<Question>> fetchUsers2() async {
      // final querySnapshot2 = await FirebaseFirestore.instance
      //     .collection('dashboardquestions')
      //     .get();

      final querySnapshot2 = await FirebaseFirestore.instance
          .collection('dashboardquestions')
          .where('question', isEqualTo: '${dashboarddetail.textEditing!.text}')
          .get();

      return querySnapshot2.docs
          .map((doc) => Question.fromMap(doc.data()))
          .toList();
    }

    //     Future<Widget?> displaydatadashboard() async {
    //   List<Question> questions = await getDashboardQuestionssByField(
    //       'question', '${dashboarddetail.textEditing!.text}');
    //   for (var question in questions) {
    //   return  Text('User ID: ${question.fullname}: Name: ${question.answer}');
    //   }
    // }

    return FutureBuilder<List<Question>>(
      future: fetchUsers2(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final questions = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) {
              // final question = questions[index];

              print(questions.length);

              for (int i = 0; i < questions.length; i++) {
                datalist.add(questions[i].fullname!);
                datalist2.add(questions[i].answer!);
                print(questions[i].fullname!);
                print(questions[i].answer!);

                //SelectedListItem(name:userdata.questions![i].question!);
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  Text(
                    '${datalist[index]}: ${datalist2[index]}',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ],
              );
            },
          );
        } else {
          return Center(child: Text('No data found'));
        }
      },
    );
  }
}
