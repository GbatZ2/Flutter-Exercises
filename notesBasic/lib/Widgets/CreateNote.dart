import 'package:flutter/material.dart';

import '../model/Notes.dart';
import 'components/TextFieldCustom.dart';

class CreateNote extends StatefulWidget {
  final Function addNote;
  const CreateNote(this.addNote, {Key? key}) : super(key: key);

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  void _submitNote() {
    if (titleController.text.isEmpty || contentController.text.isEmpty) {
      return;
    } else {
      widget.addNote(Notes(DateTime.now().toString(), titleController.text,
          contentController.text, DateTime.now()));
    }
    titleController.text = "";
    contentController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
        padding: const EdgeInsets.only(top: 20.0),
        width: width,
        child: Column(
          children: [
            Container(
              width: width / 1.3,
              child: Column(
                children: [
                  TextFieldCustom("Title", titleController),
                  TextFieldCustom("Content", contentController),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40.0),
              width: width / 2.5,
              child: ElevatedButton(
                style: ButtonStyle(
                  side: MaterialStateProperty.all(BorderSide(
                      width: 2, color: Theme.of(context).primaryColorLight)),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 10.0)),
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColorDark),
                ),
                onPressed: _submitNote,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [Icon(Icons.add), Text("Add")]),
              ),
            )
          ],
        ));
  }
}
