import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        width: double.infinity,
        child: ElevatedButton(
          child: Text(answerText, style: TextStyle(color: Colors.white)),
          onPressed: selectHandler,
          style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 44, 71, 120)),
        ));
  }
}
