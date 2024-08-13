import 'package:flutter/material.dart';

class AnswerQuestion extends StatelessWidget {
  const AnswerQuestion(
      {super.key,
      required this.answer,
      required this.ver,
      required this.hor,
      required this.fontsize,
      required this.color,
       this.onPressed,
      });

final void Function()? onPressed;
  final Color color;
  final String answer;
  final double ver, hor, fontsize;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: color,
        padding: EdgeInsets.symmetric(
          vertical: ver,
          horizontal: hor,
        ),
      ),
      child: Text(
        answer,
        style: TextStyle(fontSize: fontsize),
      ),
    );
  }
}
