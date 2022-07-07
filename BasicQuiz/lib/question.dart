import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  String questionText;

  Question(this.questionText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
      child: Text(
        questionText,
        style: const TextStyle(
            fontSize: 28.0, color: Color.fromARGB(255, 97, 116, 98)),
        textAlign: TextAlign.center,
      ),
    );
  }
}
