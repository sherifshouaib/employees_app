import 'package:employees_app/constants.dart';
import 'package:employees_app/pages/dashboard.dart';
import 'package:employees_app/pages/questions_bank.dart';
import 'package:employees_app/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class Adminprofile extends StatelessWidget {
  const Adminprofile({super.key});

  static String id = 'AdminProfile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomListTile(
              tapname: "Profile Page",
              icon: const Icon(Icons.person),
              // routename: Adminprofile.id,
              OnTap: () {
                //  Navigator.pushNamed(context, Adminprofile.id);
                Navigator.pop(context);
              },
            ),
            CustomListTile(
              tapname: "Employees Report",
              icon: const Icon(Icons.line_style),
              // routename: Dashboard.id,
              OnTap: () {
                Navigator.pushNamed(context, Dashboard.id);
              },
            ),
            CustomListTile(
              tapname: "Questions Bank",
              icon: const Icon(Icons.comment_bank),
              // routename: QuestionsBank.id,
              OnTap: () {
                Navigator.pushNamed(context, QuestionsBank.id);
              },
            ),
            CustomListTile(
              tapname: "Logout",
              icon: const Icon(Icons.exit_to_app),
              //  routename: 'LoginPage',
              OnTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
                // Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: const Text('Profile Page'),
      ),
      body: const Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            CircleAvatar(
              radius: 112,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 110,
                backgroundImage:
                    AssetImage('assets/images/male-female-office-workers.jpg'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'General Manager',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Your id number : adminadmin',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
