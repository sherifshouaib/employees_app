import 'package:employees_app/provider/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuestionsCounter extends StatelessWidget {
  const QuestionsCounter({super.key});

  @override
  Widget build(BuildContext context) {
      final counterrr = Provider.of<Counter>(context);

    return Row(
            children: [
              Stack(
                children: [
                  Positioned(
                    bottom: 24,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(211, 164, 255, 193),
                          shape: BoxShape.circle),
                      child: Text(
                        '${counterrr.selectedQuestions.length}',
                        style: const TextStyle(
                            fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_shopping_cart),
                  ),
                ],
              ),
            ],
          );
  }
}