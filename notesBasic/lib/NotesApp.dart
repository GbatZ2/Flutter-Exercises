// ignore: file_names
import 'package:flutter/material.dart';

import 'Widgets/CreateNote.dart';
import 'Widgets/ListNotes.dart';
import 'model/Notes.dart';

class NotesApp extends StatefulWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  State<NotesApp> createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  final List<Notes> _listOfNotes = [
    Notes(
        DateTime.now().toString(),
        "Lorem Ipsum",
        "orem Ipsum is simply dummy text of the LetraageMaker including versions of Lorem ",
        DateTime.now()),
    Notes(
        DateTime.now().toString(),
        "Lorem Ipsum",
        "orem Ipsum is simply dummy text of the LetraageMaker including versions of Lorem ",
        DateTime.now()),
    Notes(
        DateTime.now().toString(),
        "Lorem Ipsum",
        "orem Ipsum is simply dummy text of the LetraageMaker including versions of Lorem ",
        DateTime.now()),
    Notes(
        DateTime.now().toString(),
        "Lorem Ipsum",
        "orem Ipsum is simply dummy text of the LetraageMaker including versions of Lorem ",
        DateTime.now())
  ];

  void _addNotes(Notes note) {
    setState(() {
      _listOfNotes.add(note);
    });
  }

  void _removeNotes(Notes note) {
    setState(() {
      _listOfNotes.remove(note);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NotesApp"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.notification_add,
              semanticLabel: "Notificacion icon",
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          CreateNote(_addNotes),
          SizedBox(
            height: 20,
          ),
          _listOfNotes.isEmpty
              ? SizedBox(
                  height: 15.8,
                )
              : Divider(
                  color: Theme.of(context).primaryColorDark,
                  thickness: 1,
                  endIndent: 10,
                  indent: 10,
                ),
          ListNotes(_listOfNotes, _removeNotes),
        ]),
      ),
    );
  }
}
