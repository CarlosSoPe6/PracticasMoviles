import 'package:flutter/material.dart';

Column buildFormPageFrom(List<Widget> children) {
  return new Column(
      crossAxisAlignment: CrossAxisAlignment.start, children: children);
}

Container buildTextField(BuildContext context,
    {String text, TextAlign align = TextAlign.left}) {
  return new Container(
      padding: EdgeInsets.fromLTRB(1.0, 10.0, 1.0, 10.0),
      child: Center(
          child: Text(
        text,
        style: Theme.of(context).textTheme.caption,
        textAlign: align,
      )));
}
