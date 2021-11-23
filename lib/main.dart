import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Center(
      child: buildText(),
    ),
  ));
}

Text buildText([String text = 'hello world']) {
  return Text(
    text,
    // textDirection: TextDirection.ltr,
  );
}
