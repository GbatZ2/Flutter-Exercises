import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../model/Notes.dart';

class NoteCard extends StatelessWidget {
  final Function removeNote;
  final Notes note;

  const NoteCard(this.note, this.removeNote, {Key? key}) : super(key: key);

  void deleteNote() {
    removeNote(note);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: deleteNote,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(
                  left: Radius.zero, right: Radius.circular(20))),
          color: Theme.of(context).primaryColorDark,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  note.title,
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColorLight),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(DateFormat.yMMMd().format(note.date).toString(),
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).primaryColorLight)),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  note.content,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).primaryColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
