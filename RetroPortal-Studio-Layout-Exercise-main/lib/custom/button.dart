import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/widget_functions.dart';

class OptionButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final double? width;

  const OptionButton({Key? key, this.text, this.icon, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: FlatButton(
          color: COLOR_DARK_BLUE.withAlpha(450),
          splashColor: COLOR_WHITE.withAlpha(55),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          onPressed: () {},
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              icon,
              color: COLOR_WHITE,
            ),
            addHorizontalSpace(10.0),
            Text(text!, style: TextStyle(color: COLOR_WHITE))
          ])),
    );
  }
}
