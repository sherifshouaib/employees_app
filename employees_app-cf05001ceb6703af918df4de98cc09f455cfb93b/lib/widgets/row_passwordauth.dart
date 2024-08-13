import 'package:flutter/material.dart';

class RowPasswordauth extends StatelessWidget {
  const RowPasswordauth({super.key, required this.passAuth, required this.rowPassMessage});

  final bool passAuth;
  final String rowPassMessage;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: passAuth ? Colors.green : Colors.white,
            border: Border.all(color: const Color.fromARGB(255, 161, 159, 159)),
          ),
          child: const Icon(
            Icons.check,
            color: Colors.white,
            size: 15,
          ),
        ),
        const SizedBox(
          width: 11,
        ),
         Text(
          rowPassMessage,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
