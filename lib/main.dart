import 'package:flutter/material.dart';
import 'package:my_quiz_app/answer.dart';
import 'package:my_quiz_app/question.dart';
import 'package:my_quiz_app/quiz.dart';
import 'package:my_quiz_app/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _totalScore = 0;
  var _indexQuestion = 0;
  final _questions = const [
    {
      "questionText": "What's your favorite color?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "White", "score": 1},
        {"text": "Blue", "score": 7},
        {"text": "Green", "score": 5},
      ],
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": [
        {"text": "Cat", "score": 9},
        {"text": "Dog", "score": 8},
        {"text": "Rabbit", "score": 6},
        {"text": "Bird", "score": 5},
      ],
    },
    {
      "questionText": "What's your favorite phone brand?",
      "answers": [
        {"text": "Samsung", "score": 7},
        {"text": "Apple", "score": 7},
        {"text": "Huawei", "score": 7},
        {"text": "Nokia", "score": 4},
      ],
    },
  ];

  void _resetQuiz() {
    setState(() {
      _indexQuestion = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    setState(
      () {
        _totalScore += score;
        _indexQuestion += 1;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My Quiz App"),
        ),
        body: (_indexQuestion < _questions.length)
            ? Quiz(
                answerQuestion: _answerQuestion,
                indexQuestion: _indexQuestion,
                questions: _questions)
            : Result(resultScore: _totalScore, resetQuiz: _resetQuiz),
      ),
    );
  }
}
