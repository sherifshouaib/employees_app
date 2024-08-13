import 'package:employees_app/firebase_options.dart';
import 'package:employees_app/pages/admin_register_page.dart';
import 'package:employees_app/pages/adminprofile.dart';
import 'package:employees_app/pages/dashboard.dart';
import 'package:employees_app/pages/employee_page.dart';
import 'package:employees_app/pages/login_page.dart';
import 'package:employees_app/pages/questions_bank.dart';
import 'package:employees_app/pages/register_page.dart';
import 'package:employees_app/provider/counter.dart';
import 'package:employees_app/provider/dashboard_detail.dart';
import 'package:employees_app/provider/user_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const EmployeesApp());
}

class EmployeesApp extends StatelessWidget {
  const EmployeesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return Counter();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return UserData();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return DashboardDetail();
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          'LoginPage': (context) => const LoginPage(),
          RegisterPage.id: (context) => RegisterPage(),
          AdminRegisterPage.id: (context) => AdminRegisterPage(),
          Adminprofile.id: (context) => const Adminprofile(),
          Dashboard.id: (context) => const Dashboard(),
          QuestionsBank.id: (context) => QuestionsBank(),
          EmployeePage.id: (context) => EmployeePage(),
        },
        initialRoute: 'LoginPage',
      ),
    );

    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   routes: {
    //     'LoginPage': (context) => LoginPage(),
    //     RegisterPage.id: (context) => RegisterPage(),
    //     AdminRegisterPage.id: (context) => AdminRegisterPage(),
    //     Adminprofile.id: (context) => Adminprofile(),
    //     Dashboard.id: (context) => Dashboard(),
    //     QuestionsBank.id: (context) => QuestionsBank(),
    //   },
    //   initialRoute: 'LoginPage',
    // );
  }
}
