import 'package:example/Widgets/components/NoteCard.dart';
import 'package:flutter/material.dart';

import '../model/Notes.dart';

class ListNotes extends StatelessWidget {
  final List<Notes> listOfNotes;
  final Function removeNote;

  const ListNotes(this.listOfNotes, this.removeNote, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return listOfNotes.isNotEmpty
        ? Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10),
                height: height / 2,
                child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return NoteCard(listOfNotes[index], removeNote);
                    },
                    itemCount: listOfNotes.length),
              ),
            ],
          )
        : Container(
            height: height / 2.02,
            width: width,
            color: Theme.of(context).primaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Empty List",
                    style: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                        fontSize: 40.0))
              ],
            ));
  }
}
