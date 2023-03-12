import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetQuiz;

  const Result({super.key, required this.resultScore, required this.resetQuiz});

  String get resuktPhrase {
    if (resultScore < 8) {
      return "You are awesome and innocent";
    } else if (resultScore < 12) {
      return "Pretty likeable";
    } else {
      return "You are strange";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resuktPhrase,
            style: const TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          TextButton(onPressed: resetQuiz, child: const Text("Restart Quiz")),
        ],
      ),
    );
  }
}
