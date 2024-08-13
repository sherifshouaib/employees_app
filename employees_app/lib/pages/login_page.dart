import 'package:employees_app/constants.dart';
import 'package:employees_app/helper/show_snack_bar.dart';
import 'package:employees_app/pages/admin_register_page.dart';
import 'package:employees_app/pages/employee_page.dart';
import 'package:employees_app/pages/register_page.dart';
import 'package:employees_app/widgets/between_login_and_reg.dart';
import 'package:employees_app/widgets/custom_button.dart';
import 'package:employees_app/widgets/custom_form_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;

  String? password;

  bool isLoading = false;
  bool isVisible = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 75,
                ),
                Image.asset(
                  'assets/images/clipart1482312.png',
                  width: 100,
                  height: 100,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Employees Stastics',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontFamily: 'poppins',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 75,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'LOGIN',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomFormTextField(
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: 'Enter your employee id',
                  suffixicon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFormTextField(
                  obscureText: isVisible ? false : true,
                  onChanged: (data) {
                    password = data;
                  },
                  hintText: 'enter your password',
                  suffixicon: IconButton(
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    icon: isVisible
                        ? const Icon(
                            Icons.visibility_off,
                            color: Colors.white,
                          )
                        : const Icon(
                            Icons.visibility,
                            color: Colors.white,
                          ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await loginUser();
                        Navigator.pushNamed(context, EmployeePage.id);
                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'wrong-password') {
                          showSnackBar(context, 'wrong password');
                        } else if (ex.code == 'user-not-found') {
                          showSnackBar(context, 'user not found');
                        }
                      } catch (ex) {
                        showSnackBar(context, 'there was an error');
                      }
                      isLoading = false;
                      setState(() {});
                    }
                  },
                  text: 'Login',
                ),
                NavigationLine(
                  text1: 'don\'t have an account ?',
                  text2: ' Register',
                  ontap: () {
                    Navigator.pushNamed(context, RegisterPage.id);
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                NavigationLine(
                  text1: 'Are you Admin ?',
                  text2: ' Admin',
                  ontap: () {
                    Navigator.pushNamed(context, AdminRegisterPage.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
