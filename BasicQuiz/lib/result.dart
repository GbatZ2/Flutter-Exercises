import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    var resultText = "You did it";
    if (resultScore <= 48) {
      resultText = "You are awesoma and innocect";
    } else if (resultScore <= 70) {
      resultText = "Pretty likeable";
    } else if (resultScore <= 100) {
      resultText = "Muy me la verda";
    } else {
      resultText = "MALO MALO MAAAALO";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(resultPhrase,
            style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold)),
        ElevatedButton(
          onPressed: resetQuiz,
          child: Text("Reset Quiz", style: TextStyle(color: Colors.white)),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 23, 53, 24)),
          ),
        )
      ],
    ));
  }
}
