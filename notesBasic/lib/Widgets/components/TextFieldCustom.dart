import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {
  final String label;
  final TextEditingController controller;

  const TextFieldCustom(this.label, this.controller, {Key? key})
      : super(key: key);

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        maxLines: 1,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        controller: widget.controller,
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).primaryColorLight),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
            label: Text(widget.label),
            floatingLabelStyle: Theme.of(context).textTheme.bodyText1));
  }
}
