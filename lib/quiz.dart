import 'package:flutter/material.dart';
import 'package:my_quiz_app/answer.dart';
import 'package:my_quiz_app/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int indexQuestion;
  final Function answerQuestion;
  const Quiz(
      {super.key,
      required this.answerQuestion,
      required this.indexQuestion,
      required this.questions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
            questionText: questions[indexQuestion]["questionText"].toString()),
        ...(questions[indexQuestion]["answers"] as List<Map<String, Object>>)
            .map(
              (answer) => Answer(
                selectHandler: () => answerQuestion(answer["score"]),
                answerText: answer["text"].toString(),
              ),
            )
            .toList(),
      ],
    );
  }
}
