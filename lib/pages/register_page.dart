import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employees_app/constants.dart';
import 'package:employees_app/helper/show_snack_bar.dart';
import 'package:employees_app/widgets/between_login_and_reg.dart';
import 'package:employees_app/widgets/custom_button.dart';
import 'package:employees_app/widgets/custom_form_text_field.dart';
import 'package:employees_app/widgets/row_passwordauth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  bool isVisible = false;

  UserCredential? credential2;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isPassword8Char = false;
  bool isPasswordHas1Number = false;
  bool hasUppercase = false;
  bool hasLowercase = false;
  bool hasSpecialCharacters = false;

  onPasswordChanged(String password) {
    isPassword8Char = false;
    isPasswordHas1Number = false;
    hasUppercase = false;
    hasLowercase = false;
    hasSpecialCharacters = false;

    setState(() {
      if (password.contains(RegExp(r'.{8,}'))) {
        isPassword8Char = true;
      }

      if (password.contains(RegExp(r'[0-9]'))) {
        isPasswordHas1Number = true;
      }

      if (password.contains(RegExp(r'[A-Z]'))) {
        hasUppercase = true;
      }

      if (password.contains(RegExp(r'[a-z]'))) {
        hasLowercase = true;
      }
      if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        hasSpecialCharacters = true;
      }
    });
  }

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
                      'Employees Statistics',
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
                      'REGISTER',
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFormTextField(
                  onChanged: (data) {
                    firstname = data;
                  },
                  hintText: 'First Name',
                  suffixicon: const Icon(
                    Icons.location_city_rounded,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFormTextField(
                  onChanged: (data) {
                    lastname = data;
                  },
                  hintText: 'Last Name',
                  suffixicon: const Icon(
                    Icons.location_city_rounded,
                    color: Colors.white,
                  ),
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
                  height: 20,
                ),
                CustomFormTextField(
                  obscureText: isVisible ? false : true,
                  onChanged: (data) {
                    onPasswordChanged(data);
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
                RowPasswordauth(
                    rowPassMessage: 'At least 8 characters',
                    passAuth: isPassword8Char),
                const SizedBox(
                  height: 10,
                ),
                RowPasswordauth(
                    rowPassMessage: 'At least 1 number',
                    passAuth: isPasswordHas1Number),
                const SizedBox(
                  height: 10,
                ),
                RowPasswordauth(
                    rowPassMessage: 'Has Uppercase', passAuth: hasUppercase),
                const SizedBox(
                  height: 10,
                ),
                RowPasswordauth(
                    rowPassMessage: 'Has Lowercase', passAuth: hasLowercase),
                const SizedBox(
                  height: 10,
                ),
                RowPasswordauth(
                    rowPassMessage: 'Has Special Characters',
                    passAuth: hasSpecialCharacters),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  text: 'Register',
                  onTap: () async {
                    await registerValidation(context);
                  },
                ),
                NavigationLine(
                  text1: 'already have an account ?',
                  text2: ' Login',
                  ontap: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerValidation(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      if (isPassword8Char == false ||
          isPasswordHas1Number == false ||
          hasUppercase == false ||
          hasLowercase == false ||
          hasSpecialCharacters == false) {
        showSnackBar(context, 'weak password');
        return;
      }

      isLoading = true;
      setState(() {});
      try {
        await registerUser();

        CollectionReference users =
            FirebaseFirestore.instance.collection('users');

        users
            .doc(credential2!.user!.uid)
            .set({
              'employee id': email,
              'first name': firstname,
              'last name': lastname,
              'password': password,
            })
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));


        showSnackBar(context, 'success');

        Navigator.pop(context); //تحتاج للتعديل
      } on FirebaseAuthException catch (ex) {
        if (ex.code == 'weak-password') {
          showSnackBar(context, 'weak password');
        } else if (ex.code == 'email-already-in-use') {
          showSnackBar(context, 'email already exists');
        }
      } catch (ex) {
        showSnackBar(context, 'there was an error');
      }
      isLoading = false;
      setState(() {});
    }
  }

  Future<void> registerUser() async {
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
    //  print(credential.user!.uid);
    credential2 = credential;
  }
}
