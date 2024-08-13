import 'package:flutter/material.dart';

class GesturedetectorNavigation extends StatelessWidget {
  const GesturedetectorNavigation(
      {super.key, required this.ontap, required this.text});

  final VoidCallback? ontap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xffC7EDE6),
        ),
      ),
    );
  }
}
