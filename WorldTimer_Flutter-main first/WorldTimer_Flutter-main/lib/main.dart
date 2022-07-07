import 'package:flutter/material.dart';
import 'package:flutter_exercise_4/pages/home.dart';
import 'package:flutter_exercise_4/pages/loading.dart';
import 'package:flutter_exercise_4/pages/choose_location.dart';

void main() => runApp(MaterialApp(initialRoute: '/', routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    }));
