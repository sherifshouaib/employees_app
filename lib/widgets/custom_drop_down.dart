import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:employees_app/models/question.dart';
import 'package:employees_app/packages/apptextfield.dart';
import 'package:employees_app/widgets/users_details_dashboard.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  CustomDropDown({super.key});

  TextEditingController country = TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<SelectedListItem> questionlist = [];

    Future<List<Question>> fetchUsers() async {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('dashboardquestions')
          .get();
      return querySnapshot.docs
          .map((doc) => Question.fromMap(doc.data()))
          .toList();
    }

    return FutureBuilder<List<Question>>(
      future: fetchUsers(), // Fetch the list of users
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final questions = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) {



           //   final question = questions[index];

              print(questions.length);

              for (int i = 0; i < questions.length; i++) {
                if (questionlist.contains('${questions[i].question}')) {
                  continue;
                } else {
                  questionlist
                      .add(SelectedListItem(name: questions[i].question!));
                }

                //SelectedListItem(name:userdata.questions![i].question!);
              }

              return Column(
                children: [
                  AppTextField(
                      datalist: questionlist,
                      // SelectedListItem(
                      //     name: userdata.questions![0].question!),
                      // SelectedListItem(
                      //     name: userdata.questions![1].question!),
                      // SelectedListItem(
                      //     name: userdata.questions![2].question!),

                      // SelectedListItem(name: 'Mahmoud Omar'),
                      // SelectedListItem(name: 'Saad Marzouk'),
                      // SelectedListItem(name: 'Ibrahim Ahmed'),
                      // SelectedListItem(name: 'Abdullah Masoud'),
                      // SelectedListItem(name: 'Mahmoud Elmallah'),
                      // SelectedListItem(name: 'Fathy Youssef'),

                      textEditingController: country,
                      title: 'Select Question Name',
                      hint: 'Question name',
                      isCitySelected: true),
                  Column(
                    children: [
                     UsersDetailsDashboard(),
                    ],
                  )
                ],
              );

              // return ListTile(
              //   title: Text(question.name),
              //   subtitle: Text('Age: ${question.age}'),
              // );

              // return Center(
              //   child:  Column(
              //     children: [
              //       // Text(
              //       //   'cat',
              //       //   style: TextStyle(color: Colors.red, fontSize: 25),
              //       // ),
              //       // Text(
              //       //   'cat',
              //       //   style: TextStyle(color: Colors.red, fontSize: 25),
              //       // ),
              //       // Text(
              //       //   'cat',
              //       //   style: TextStyle(color: Colors.red, fontSize: 25),
              //       // ),

              //       // AppTextField(
              //       //     datalist: [
              //       //       SelectedListItem(name: question.question!),

              //       //       // SelectedListItem(name: 'Mahmoud Omar'),
              //       //       // SelectedListItem(name: 'Saad Marzouk'),
              //       //       // SelectedListItem(name: 'Ibrahim Ahmed'),
              //       //       // SelectedListItem(name: 'Abdullah Masoud'),
              //       //       // SelectedListItem(name: 'Mahmoud Elmallah'),
              //       //       // SelectedListItem(name: 'Fathy Youssef'),
              //       //     ],
              //       //     textEditingController: country,
              //       //     title: 'Select Question Name',
              //       //     hint: 'Question name',
              //       //     isCitySelected: true),
              //     ],
              //   ),
              // );
            },
          );
        } else  {
          return Center(child: Text('No data found'));
        }
      },
    );

    // return Column(
    //   children: [
    //     AppTextField(
    //         datalist: [
    //           SelectedListItem(name: 'Eslam Elsadany'),
    //           SelectedListItem(name: 'Mahmoud Omar'),
    //           SelectedListItem(name: 'Saad Marzouk'),
    //           SelectedListItem(name: 'Ibrahim Ahmed'),
    //           SelectedListItem(name: 'Abdullah Masoud'),
    //           SelectedListItem(name: 'Mahmoud Elmallah'),
    //           SelectedListItem(name: 'Fathy Youssef'),
    //         ],
    //         textEditingController: country,
    //         title: 'Select Question Name',
    //         hint: 'Question name',
    //         isCitySelected: true),
    //   ],
    // );
  }
}
