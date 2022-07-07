import 'package:example/result.dart';
import 'package:flutter/material.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;

  final questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 20},
        {'text': 'White', 'score': 30},
        {'text': 'Green', 'score': 40}
      ]
    },
    {
      'questionText': "What\'s your favorite animal?",
      'answers': [
        {'text': 'Dogs', 'score': 10},
        {'text': 'Cats', 'score': 20},
        {'text': 'Birds', 'score': 30},
        {'text': 'Lions', 'score': 40}
      ]
    }
  ];

  var _totalScore = 0;

  void answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      if (questionIndex < questions.length) {
        questionIndex += 1;
      }
    });
  }

  void _resetQuiz() {
    setState(() {
      questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text(
          "My App",
          style: TextStyle(
              color: Color.fromARGB(255, 97, 116, 98), fontSize: 25.0),
          textAlign: TextAlign.center,
        ),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 182, 255, 243),
      ),
      body: questionIndex < questions.length
          ? Quiz(answerQuestion, questions, questionIndex)
          : Result(_totalScore, _resetQuiz),
      backgroundColor: Color.fromARGB(255, 206, 239, 243),
    ));
  }
}
