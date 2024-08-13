// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:employees_app/constants.dart';
import 'package:employees_app/helper/show_snack_bar.dart';
import 'package:employees_app/pages/adminprofile.dart';
import 'package:employees_app/widgets/custom_button.dart';
import 'package:employees_app/widgets/custom_form_text_field.dart';
import 'package:flutter/material.dart';

class AdminRegisterPage extends StatefulWidget {
  AdminRegisterPage({super.key});
  static String id = 'AdminPage';

  @override
  State<AdminRegisterPage> createState() => _AdminRegisterPageState();
}

class _AdminRegisterPageState extends State<AdminRegisterPage> {
  bool isLoading = false;

  String? adminId;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'put your id if you\'re Admin',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomFormTextField(
                onChanged: (data) {
                  adminId = data;
                },
                hintText: 'Admin id',
                suffixicon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});

                      await goToAdminProfile(context);

                      isLoading = false;
                      setState(() {});
                    }
                  },
                  text: 'Register'),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> goToAdminProfile(BuildContext context) async {
    if (adminId == 'adminadmin') {
      showSnackBar(context, 'success');

      Navigator.pushNamed(context, Adminprofile.id);
    } else {
      showSnackBar(context, 'Wrong ID');
    }
  }
}
