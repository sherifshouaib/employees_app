import 'package:employees_app/widgets/gesturedetector_navigation.dart';
import 'package:flutter/material.dart';

class NavigationLine extends StatelessWidget {
  const NavigationLine(
      {super.key,
      required this.text1,
      required this.text2,
      required this.ontap});

  final void Function()? ontap;

  final String text1, text2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        GesturedetectorNavigation(ontap: ontap, text: text2)
      ],
    );
  }
}
