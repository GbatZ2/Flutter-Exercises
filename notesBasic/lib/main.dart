import 'package:flutter/material.dart';

import 'NotesApp.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: const Color(0xff7A86B6),
          primaryColorLight: const Color(0xffE4DCCF),
          primaryColorDark: const Color(0xff2C3639),
          appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xff293B5F),
              titleTextStyle: TextStyle(
                  color: Color(0xffEAF6F6),
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0)),
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Color(0xff464D5C)),
          )),
      home: const NotesApp(),
    );
  }
}
