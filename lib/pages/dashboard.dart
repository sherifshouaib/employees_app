
import 'package:employees_app/constants.dart';
import 'package:employees_app/provider/counter.dart';
import 'package:employees_app/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  static String id = 'Dashboard';

  @override
  Widget build(BuildContext context) {
    final counterrr = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: ListView(
          children: [
            const SizedBox(
              height: 12,
            ),
            Text(
              'number of yes answers : ${counterrr.yesCount}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'number of no answers : ${counterrr.noCount}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10,),
           CustomDropDown(),


          
          ],
        ),
      ),
    );
  }
}
